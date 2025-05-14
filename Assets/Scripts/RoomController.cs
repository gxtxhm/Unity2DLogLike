using AStar;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public enum TileType
{
    None,
    Monster,
    Creature,
    Floor,
    Door,
    Wall
}

public class RoomController : MonoBehaviour
{
    List<DoorController> doors = new List<DoorController>();

    int curMonster;
    public int MonsterCnt = 3;
    Test_Monster[] monsters; 

    public int RoomId { get; private set; }
    public int Width { get; private set; }
    public int Height { get; private set; }

    public GameObject Structure;

    public TileType[,] roomArrayData;
    public bool[,] bakedMap;

    //public void SetInit(int width = 0, int height = 0, int roomId = -1)
    //{
    //    Width = width;
    //    Height = height;
    //    RoomId = roomId;
    //}

    //// 첫 입장 시 시작됨
    //public void StartRoom()
    //{
    //    if (curMonster == 0) return;
    //    GameManager.Instance.pc.transform.SetParent(transform, true);
    //    // 몬스터 활동 시작
    //    Invoke("TriggerMonster", 0.2f);

    //    foreach (DoorController dc in doors)
    //    {
    //        dc.EnterCollider.enabled = false;
    //        dc.ExitCollider.enabled = false;
    //        dc.EnterPlayer();
    //    }
    //}

    public bool isVisited { get; private set; } // 방문 여부
    public GameObject fog; // 안개 오브젝트
    public GameObject minimapRoomSprite; // 미니맵 방 구조 스프라이트

    public void SetInit(int width = 0, int height = 0, int roomId = -1)
    {
        Width = width;
        Height = height;
        RoomId = roomId;
        isVisited = false; // 초기화
    }

    // 방 입장 시 호출 (StartRoom 수정)
    public void StartRoom()
    {
        if (!isVisited)
        {
            isVisited = true;
            if (fog != null) fog.SetActive(false); // 안개 제거
            GameObject minimapImage = transform.Find("MinimapImage")?.gameObject;
            if (minimapImage != null) minimapImage.SetActive(false); // 물음표 제거
            if (minimapRoomSprite != null) minimapRoomSprite.SetActive(true); // 방 구조 표시
        }

        if (curMonster == 0) return;
        GameManager.Instance.pc.transform.SetParent(transform, true);
        Invoke("TriggerMonster", 0.2f);

        foreach (DoorController dc in doors)
        {
            dc.EnterCollider.enabled = false;
            dc.ExitCollider.enabled = false;
            dc.EnterPlayer();
        }
    }

    public void GeneratePathMap()
    {
        bakedMap = new bool[Height, Width];
        for (int i = 0; i < Height; i++)
        {
            for (int j = 0; j < Width; j++)
            {
                if (roomArrayData[i, j] == TileType.Floor || roomArrayData[i, j] == TileType.Monster)
                    bakedMap[i, j] = true;
                else
                    bakedMap[i, j] = false;
            }
        }
    }

    void TriggerMonster()
    {
        foreach (Test_Monster m in monsters)
        {
            m.StartBattle(bakedMap);
        }
    }

    public Vector2 GetCenter()
    {
        return (Vector2)transform.position + new Vector2(Width / 2f, Height / 2f);
    }

    public void SetDoor(GameObject door, Vector2 dir)
    {
        DoorController dc = door.GetComponent<DoorController>();
        dc.DoorDir = dir;
        doors.Add(dc);
        
        if (dir == Vector2.left || dir == Vector2.right)
        {
            int randH = Random.Range(1, Height - 2);

            door.transform.SetParent(transform);
            Vector3 pos = Vector3.zero;
            if (dir == Vector2.right) pos.x = Width - 1;
            pos.y = randH;
            roomArrayData[randH, (int)pos.x] = TileType.Door;

            if (dir == Vector2.right) pos.x += 1f;
            door.transform.localPosition = pos;
        }
        else
        {
            int randW = Random.Range(1, Width - 2);

            door.transform.SetParent(transform);
            Vector3 pos = Vector3.zero;
            if (dir == Vector2.up) pos.y = Height - 1;
            pos.x = randW;
            roomArrayData[(int)pos.y, randW] = TileType.Door;

            door.transform.localPosition = pos;
        }
        dc.Init();
    }

    void ClearRoom()
    {
        if (curMonster != 0) return;

        foreach(DoorController dc in doors)
        {
            dc.EnterCollider.enabled = true;
            dc.ExitCollider.enabled = true;
        }

        GameManager.Instance.pc.StartClearText();
        GameManager.Instance.UpdateRoomCount();
    }

    // 몬스터와 장애물 세팅
    public void SetCreature(RoomGenerator rg)
    {
        int randMonster = Random.Range(1, MonsterCnt);
        GameObject[] m = rg.CreateMonster(randMonster);
        curMonster = m.Length;
        monsters = new Test_Monster[m.Length];
        for(int i=0;i<m.Length; i++)
            monsters[i] = m[i].GetComponent<Test_Monster>();

        int randCreature = Random.Range(1, 5);
        GameObject[] objects = rg.CreateRandomCreature(randCreature);

        for(int i=0;i<m.Length;i++)
        {
            while (true)
            {
                int randX = Random.Range(2, Width - 3);
                int randY = Random.Range(2, Height - 3);
                Vector2 v = GetCenter();
                if (randX == v.x && randY == v.y) continue;
                if (roomArrayData[randY, randX] == TileType.Floor)
                {
                    m[i].transform.SetParent(transform);
                    m[i].transform.localPosition = new Vector2(randX, randY);
                    roomArrayData[randY, randX] = TileType.Monster;
                    m[i].GetComponent<Test_Monster>().Init(this);
                    m[i].GetComponent<Test_Monster>().OnDeadEvent += () => { curMonster--; ClearRoom(); };
                    break;
                }
            }
        }
        for(int i=0;i<objects.Length;i++)
        {
            while(true)
            {
                int randX = Random.Range(2, Width - 3);
                int randY = Random.Range(2, Height - 3);
                Vector2 v = GetCenter();
                if (randX == v.x && randY == v.y) continue;
                if (roomArrayData[randY, randX] == TileType.Floor)
                {
                    objects[i].transform.SetParent(transform);
                    objects[i].transform.localPosition = new Vector2(randX,randY);
                    roomArrayData[randY, randX] = TileType.Creature;
                    break;
                }
            }
        }
        
    }

}


