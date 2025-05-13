using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using TMPro;

public class GameManager : MonoBehaviour
{
    public static GameManager Instance;

    public PlayerController pc;

    public GameObject WeaponPanel;
    public Image weaponImage;
    public TextMeshProUGUI bulletText;

    public int CurRoomId { get; set; }

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
    // Start is called before the first frame update
    public void GameStart()
    {
        //pc.Init();
        //WeaponManager.Instance.Init();

    }
    private void Start()
    {
        pc.Init();
        WeaponManager.Instance.Init();
    }
    // Update is called once per frame
    void Update()
    {
        
    }
}
