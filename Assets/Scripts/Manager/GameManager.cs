using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using TMPro;
using UnityEngine.Events;

public class GameManager : MonoBehaviour
{
    public static GameManager Instance;

    [SerializeField]
    TextMeshProUGUI clearRoomCntText;

    [SerializeField]
    RoomGenerator roomGenerator;

    [SerializeField]
    GameObject finishPanel;

    TextMeshProUGUI finishText;

    public PlayerController pc;

    public GameObject WeaponPanel;
    public Image weaponImage;
    public TextMeshProUGUI bulletText;

    [SerializeField]
    GameObject arrowPrefab;

    public UnityAction OnEndGame;

    public int CurRoomId { get; set; }
    public bool isEnd = false;

    int clearRoomCount = 0;

    private void Awake()
    {
        if(Instance == null)
        {
            Instance = this;
        }
        else
        {
            Destroy(this);
        }
        
    }

    public void UpdateRoomCount()
    {
        clearRoomCntText.text = $"Clear Room : {++clearRoomCount} / {roomGenerator.GetRoomCount()}";

        if(clearRoomCount == roomGenerator.GetRoomCount())
        {
            isEnd = true;
            OnEndGame.Invoke();
            finishPanel.SetActive(true);

            StartCoroutine(fadeInText(finishText));
        }
    }

    public void EndGamePanel()
    {
        isEnd = true;
        OnEndGame.Invoke();
        finishPanel.SetActive(true);
        finishText.text = "Game Over...";
        StartCoroutine(fadeInText(finishText));
    }

    IEnumerator fadeInText(TextMeshProUGUI text)
    {
        float animTime = 1;
        float elapsedTime = 0;

        while(elapsedTime < animTime)
        {
            elapsedTime += Time.deltaTime;

            float value = Mathf.Lerp(0.0f, 1.0f, elapsedTime/animTime);

            Color c = text.color;
            c.a = value;
            text.color = c;

            yield return null;
        }
        text.color = Color.black;
    }

    // Start is called before the first frame update
    public void GameStart(RoomController rc)
    {
        //pc.Init();
        //WeaponManager.Instance.Init();
        clearRoomCntText.text = $"Clear Room : {clearRoomCount} / {roomGenerator.GetRoomCount()}";
        pc.transform.position = rc.GetCenter();
        rc.StartRoom();

    }

    void EnemySet()
    {
        PoolingManager.Instance.AddInMap(PoolingType.ArrowBullet, arrowPrefab);
    }

    private void Start()
    {
        finishText = finishPanel.GetComponentInChildren<TextMeshProUGUI>();
        finishPanel.SetActive(false);
        pc.Init();
        WeaponManager.Instance.Init();
        roomGenerator.StartGenerateRoom();

        // 적 관련 세팅
        EnemySet();
    }
    // Update is called once per frame
    void Update()
    {
        
    }
}
