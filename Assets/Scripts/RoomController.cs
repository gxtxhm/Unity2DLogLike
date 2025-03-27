using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class RoomController : MonoBehaviour
{
    [SerializeField]
    GameObject enterCollider;
    [SerializeField]
    GameObject exitCollider;

    // TODO : RoomData 만들기 => 크기, 좌표도 가지고있어야할듯

    //Test
    public int MonsterCnt = 3;
    public GameObject PrefabMonster;

    // Start is called before the first frame update
    void Start()
    {
        int py=Random.Range(-6, 8);
        int px=Random.Range(-7, 7);
        exitCollider.SetActive(false);
        for(int i = 0; i < MonsterCnt; i++) 
            Instantiate(PrefabMonster, new Vector3(px, py, 0), Quaternion.identity);

        Invoke("OpenDoor", 5f);
    }
    // For Test
    void OpenDoor()
    {
        exitCollider.SetActive(true);
    }
}
