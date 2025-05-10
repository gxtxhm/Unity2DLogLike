//using System.Collections;
//using System.Collections.Generic;
//using UnityEngine;

//public class RoomController : MonoBehaviour
//{
//    [SerializeField]
//    DoorController enterDoor;
//    [SerializeField]
//    DoorController exitDoor;


//    //Test
//    public int MonsterCnt = 3;
//    GameObject PrefabMonster;

//    public void SetInit(DoorController enter,DoorController exit)
//    {
//        enterDoor = enter;
//        exitDoor = exit;
//        PrefabMonster = Resources.Load<GameObject>("TestEnemy");

//        enterDoor.Init();
//        exitDoor.Init();
//        exitDoor.Collider.enabled = false;
//    }

//    // Start is called before the first frame update
//    void Start()
//    {
//        Invoke("OpenExitDoor", 5f);
//        return;
//        int py=Random.Range(-6, 8);
//        int px=Random.Range(-7, 7);
//        for(int i = 0; i < MonsterCnt; i++) 
//            Instantiate(PrefabMonster, new Vector3(px, py, 0), Quaternion.identity);


//    }
//    // For Test
//    void OpenExitDoor()
//    {
//        exitDoor.Collider.enabled = true;
//    }
//}
/// 복사 전 
/// 

using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class RoomController : MonoBehaviour
{
    [SerializeField]
    DoorController enterDoor;
    [SerializeField]
    DoorController exitDoor;

    public int MonsterCnt = 3;
    GameObject PrefabMonster;

    
    public int RoomId { get; private set; }
    public int Width { get; private set; }
    public int Height { get; private set; }

    public RoomController()
    {
        
    }

    public void SetInit(int width = 0, int height = 0, int roomId = -1)
    {
        Width = width;
        Height = height;
        RoomId = roomId;
    }

    public void SetInit(DoorController enter, DoorController exit, int width = 0, int height = 0, int roomId = -1)
    {
        enterDoor = enter;
        exitDoor = exit;
        PrefabMonster = Resources.Load<GameObject>("TestEnemy");

        Width = width;
        Height = height;
        RoomId = roomId;

        enterDoor.Init();
        exitDoor.Init();
        exitDoor.Collider.enabled = false;
    }

    void Start()
    {
        return;
        Invoke("OpenExitDoor", 5f);

        for (int i = 0; i < MonsterCnt; i++)
        {
            int px = Random.Range(-7, 7);
            int py = Random.Range(-6, 8);
            Instantiate(PrefabMonster, new Vector3(px, py, 0), Quaternion.identity);
        }
    }

    void OpenExitDoor()
    {
        exitDoor.Collider.enabled = true;
    }

    public Vector2 GetCenter()
    {
        return (Vector2)transform.position;// + new Vector2(Width / 2f, Height / 2f);
    }

    public bool IsMainRoom(float meanWidth, float meanHeight, float thresholdFactor = 1.25f)
    {
        return Width >= meanWidth * thresholdFactor && Height >= meanHeight * thresholdFactor;
    }

    public void SetDoor(GameObject door, Vector2 dir)
    {
        if (dir == Vector2.left || dir == Vector2.right)
        {
            int randH = Random.Range(1, Height-1);

            door.transform.SetParent(transform);
            Vector3 pos = Vector3.zero;
            if (dir == Vector2.right) pos.x = Width;
            pos.y = randH;
            pos.x -= Width / 2;
            pos.y -= Height / 2;
            door.transform.localPosition = pos;
        }
        else
        {
            int randW = Random.Range(1, Width-1);

            door.transform.SetParent(transform);
            Vector3 pos = Vector3.zero;
            if (dir == Vector2.up) pos.y = Height;
            pos.x = randW;
            pos.x -= Width / 2;
            pos.y -= Height / 2;
            door.transform.localPosition = pos;
        }
    }

}


