using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using TMPro;

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
            finishPanel.SetActive(true);

            StartCoroutine(fadeInText(finishText));
        }
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
    private void Start()
    {
        finishText = finishPanel.GetComponentInChildren<TextMeshProUGUI>();
        finishPanel.SetActive(false);
        pc.Init();
        WeaponManager.Instance.Init();
        roomGenerator.StartGenerateRoom();
    }
    // Update is called once per frame
    void Update()
    {
        
    }
}
