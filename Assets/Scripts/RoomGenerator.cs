using System.Collections;
using System.Collections.Generic;
using Unity.VisualScripting;
using UnityEditor;
using UnityEngine;

public class RoomGenerator : MonoBehaviour
{
    [SerializeField]
    int minRoom;
    [SerializeField]
    int maxRoom;

    [SerializeField]
    int roomCount;

    [SerializeField]
    float roomPadding;

    [SerializeField]
    GameObject corridorTile;

    [SerializeField]
    GameObject floorTile;

    [SerializeField]
    GameObject wallTile;

    [SerializeField]
    GameObject frontDoor;

    [SerializeField]
    GameObject backDoor;

    [SerializeField]
    GameObject leftDoor;

    [SerializeField]
    GameObject rightDoor;

    int roomNumCnt = 0;

    [SerializeField]
    GameObject prefabMonster;
    [SerializeField]
    GameObject[] creatures = new GameObject[4]; 

    List<Rigidbody2D> rigidbody2Ds = new List<Rigidbody2D>();
    List<RoomController> visualRooms = new List<RoomController>();
    Dictionary<int,RoomController> roomMap = new Dictionary<int,RoomController>();
    List<BoxCollider2D> boxCollider2Ds = new List<BoxCollider2D>();

    [SerializeField]
    float tileSize = 1f; // <- 인스펙터에서 설정할 수 있도록

    List<Edge> mst;

    Dictionary<Vector2,GameObject> DirToDoor = new Dictionary<Vector2,GameObject>();

    public RoomController GetRoomController(int roomId)
    {
        return roomMap[roomId];
    }

    public void Start()
    {
        DirToDoor.Clear();
        DirToDoor.Add(Vector2.down, frontDoor);
        DirToDoor.Add(Vector2.up, backDoor);
        DirToDoor.Add(Vector2.left, leftDoor);
        DirToDoor.Add(Vector2.right, rightDoor);
    }

    // 타원 안의 랜덤 위치 얻기
    Vector2 GetRandomPointInEllipse(float ellipseWidth, float ellipseHeight, float tileSize)
    {
        float t = 2 * Mathf.PI * Random.value;
        float u = Random.value + Random.value;
        float r = u > 1 ? 2 - u : u;

        float x = (ellipseWidth * r * Mathf.Cos(t)) / 2f;
        float y = (ellipseHeight * r * Mathf.Sin(t)) / 2f;

        x = Mathf.Round(x / tileSize) * tileSize;
        y = Mathf.Round(y / tileSize) * tileSize;

        return new Vector2(x, y);
    }


    public void StartGenerateRoom()
    {
        rigidbody2Ds.Clear();
        for (int i = 0; i < roomCount; i++)
        {
            int x = Random.Range(-5, 5);
            int y = Random.Range(-5, 5);

            GenerateRoom(new Vector3(x+0.5f, y+0.5f, 0));

            //Vector2 pos = GetRandomPointInEllipse(150f, 20f, tileSize); // width, height는 상황에 맞게 조절
            //GenerateRoom(new Vector3(pos.x, pos.y, 0));
        }

        foreach (Rigidbody2D rb in rigidbody2Ds)
        {
            rb.bodyType = RigidbodyType2D.Dynamic;
        }
        StartCoroutine("RunSeparation");

    }


    void GenerateRoom(Vector3 sv)
    {
        GameObject go = new GameObject("Room" + roomNumCnt);
        GameObject goo = new GameObject("Room");
        goo.transform.position = sv;
        go.transform.SetParent(goo.transform);
        go.transform.localPosition = Vector3.zero;
        RoomController rc = go.AddComponent<RoomController>();
        visualRooms.Add(rc);

        int xLen = Random.Range(minRoom, maxRoom);
        int yLen = Random.Range(minRoom, maxRoom);

        Rigidbody2D rb = goo.AddComponent<Rigidbody2D>();
        rb.gravityScale = 0;
        rb.constraints = RigidbodyConstraints2D.FreezeRotation;
        rb.bodyType = RigidbodyType2D.Static;
        rb.drag = 6;
        rigidbody2Ds.Add(rb);

        BoxCollider2D bc = goo.AddComponent<BoxCollider2D>();
        boxCollider2Ds.Add(bc);

        float yOffset = yLen / 2;
        float xOffset = xLen / 2;

        bc.offset = new Vector2(xOffset, yOffset);
        bc.size = new Vector2(xLen + roomPadding, yLen + roomPadding);

        // 배열로 미리 어떤 타일을 생성할지 세팅
        // 벽 세팅
        rc.roomArrayData = new TileType[yLen, xLen];
        for (int i = 0; i < yLen; i++)
        {
            rc.roomArrayData[i, 0] = TileType.Wall;
            rc.roomArrayData[i, xLen - 1] = TileType.Wall;
        }
        for (int i = 0; i < xLen; i++)
        {
            rc.roomArrayData[0, i] = TileType.Wall;
            rc.roomArrayData[yLen - 1, i] = TileType.Wall;
        }

        // 방 크기만큼 바닥타일 생성
        
        for (int i = 0; i < yLen; i++)
        {
            for (int j = 0; j < xLen; j++)
            {
                if (rc.roomArrayData[i, j] == 0)
                {
                    GameObject inst;
                    inst = Instantiate(floorTile, Vector3.zero, Quaternion.identity);
                    inst.transform.SetParent(go.transform);
                    inst.transform.localPosition = new Vector3(j, i, 0);
                    rc.roomArrayData[i, j] = TileType.Floor;
                }
                
            }
        }

        // 룸 Init 함수 
        //rc.SetInit(enterd, exitd, xLen, yLen, roomNumCnt);//, xLen, yLen, roomNumCnt
        rc.SetInit(xLen, yLen, roomNumCnt++);
        go.SetActive(false);
        roomMap.Add(rc.RoomId, rc);
    }

    IEnumerator GenerateCorridor()
    {
        Kruscal kruscal = new Kruscal();
        List<Kruscal.KruscalNode> nodes = new List<Kruscal.KruscalNode>();

        for (int i = 0; i < visualRooms.Count; i++)
        {
            Kruscal.KruscalNode node = new Kruscal.KruscalNode();
            node.Id = visualRooms[i].RoomId;
            node.Center = visualRooms[i].transform.position; //visualRooms[i].GetCenter();
            nodes.Add(node);
        }
        kruscal.rooms = nodes;

        mst = kruscal.Run();

        GameObject corridors = new GameObject();

        foreach (Edge e in mst)
        {
            Vector2 dir = (roomMap[e.V2].GetCenter() - roomMap[e.V1].GetCenter()).normalized;

            // 각도 계산 (도 단위)
            float angle = Mathf.Atan2(dir.y, dir.x) * Mathf.Rad2Deg;
            if (angle < 0) angle += 360; // 0~360도로 변환

            // 각도를 기본 방향으로 매핑
            Vector2 snappedDir;
            if (angle >= 45 && angle < 135)
                snappedDir = Vector2.up; // 90도 ± 45도
            else if (angle >= 135 && angle < 225)
                snappedDir = Vector2.left; // 180도 ± 45도
            else if (angle >= 225 && angle < 315)
                snappedDir = Vector2.down; // 270도 ± 45도
            else
                snappedDir = Vector2.right; // 0도 ± 45도

            GameObject door = CreateDoor(snappedDir);
            roomMap[e.V1].SetDoor(door, snappedDir);

            GameObject door2 =CreateDoor(-snappedDir);
            roomMap[e.V2].SetDoor(door2, -snappedDir);

            Vector2 randPos = GetRandomPos(door.transform.position, door2.transform.position);
            bool mode;
            Vector2 inputVec = door.transform.position;
            Vector2 inputVec2 = door2.transform.position;
            if (snappedDir == Vector2.up || snappedDir == Vector2.down)
            {
                mode = false;
                if(snappedDir == Vector2.up)
                {
                    inputVec.y++; inputVec2.y--;
                }
                else
                {
                    inputVec2.y++; inputVec.y--;
                }
                    
            }
            else
            {
                mode = true;
                if(snappedDir == Vector2.right)
                {
                    inputVec2.x--;
                }
                else
                {
                    inputVec.x--;
                }
            }
            CreateCorridors(corridors, inputVec, randPos, mode);
            CreateCorridors(corridors, randPos, inputVec2, !mode);

        }
        CreateWall();
        FilledFloorTile();
        SetRoomCreature();

        foreach(RoomController room in visualRooms)
        {
            room.GeneratePathMap();
        }

        GameManager.Instance.GameStart();
        yield return null;
    }

    void SetRoomCreature()
    {
        foreach(RoomController rc in visualRooms)
        {
            rc.SetCreature(this);
        }
    }

    void CreateCorridors(GameObject parent,Vector2 v, Vector2 v2, bool mode/* true : x -> y , false : y -> x */)
    {
        //Debug.Log("mode : " + mode);
        Vector2Int pos = new Vector2Int((int)v.x, (int)v.y);
        Vector2Int pos2 = new Vector2Int((int)v2.x, (int)v2.y);
        //Debug.Log(pos.ToString());
        //Debug.Log(pos2.ToString());
        if (mode)
        {
            // for문 수치 파악해보기
            for (int x = pos.x; x != (pos2.x + ((pos2.x > pos.x) ? 1 : -1)); x += (pos2.x > pos.x) ? 1 : -1)
            {
                GameObject go = Instantiate(corridorTile, new Vector2(x, pos.y), Quaternion.identity);
                go.transform.SetParent(parent.transform, true);
            }

            for (int y = pos.y; y != (pos2.y + ((pos2.y > pos.y) ? 1 : -1)); y += (pos2.y > pos.y) ? 1 : -1)
            {
                GameObject go = Instantiate(corridorTile, new Vector2(pos2.x, y), Quaternion.identity);
                go.transform.SetParent(parent.transform, true);
            }
        }
        else
        {
            for (int y = pos.y; y != (pos2.y + ((pos2.y > pos.y) ? 1 : -1)); y += (pos2.y > pos.y) ? 1 : -1)
            {
                GameObject go = Instantiate(corridorTile, new Vector2(pos.x, y), Quaternion.identity);
                go.transform.SetParent(parent.transform, true);
            }
            for (int x = pos.x; x != (pos2.x + ((pos2.x > pos.x) ? 1 : -1)); x += (pos2.x > pos.x) ? 1 : -1)
            {
                GameObject go = Instantiate(corridorTile, new Vector2(x, pos2.y), Quaternion.identity);
                go.transform.SetParent(parent.transform, true);
            }
        }
        
    }

    Vector2 GetRandomPos(Vector3 pos, Vector3 pos2)
    {
        float maxY = Mathf.Max(pos.y, pos2.y);
        float minY = Mathf.Min(pos.y, pos2.y);

        float maxX = Mathf.Max(pos.x, pos2.x);
        float minX = Mathf.Min(pos.x, pos2.x);

        int offsetY = Mathf.RoundToInt((maxY - minY) / 4);
        int offsetX = Mathf.RoundToInt((maxX - minX) / 4);

        
        float randX = Random.Range(minX + offsetX, maxX - offsetX);
        float randY = Random.Range(minY + offsetY, maxY - offsetY);
        randX = Mathf.Round(randX);
        randY = Mathf.Round(randY);

        //Debug.Log("RandPoint : "+randX +", "+randY);
        return new Vector2(randX, randY);
    }

    // 빈 곳 바닥으로 채우기
    void FilledFloorTile()
    {
        foreach (RoomController rc in visualRooms)
        {
            for (int i = 0; i < rc.Height; i++)
            {
                for (int j = 0; j < rc.Width; j++)
                {
                    if(rc.roomArrayData[i, j]==TileType.Door)
                    {
                        GameObject inst;
                        inst = Instantiate(floorTile, Vector3.zero, Quaternion.identity);
                        inst.transform.SetParent(rc.transform);
                        inst.transform.localPosition = new Vector3(j, i, 0);
                        //rc.roomArrayData[i, j] = 5;
                    }
                }
            }
        }
    }

    void CreateWall()
    {
        foreach (RoomController rc in visualRooms)
        {
            for(int i=0;i<rc.Height;i++)
            {
                for(int j=0;j<rc.Width;j++)
                {
                    if (rc.roomArrayData[i,j]==TileType.Wall)
                    {
                        GameObject go = Instantiate(wallTile);
                        go.transform.SetParent(rc.transform);
                        go.transform.localPosition = new Vector2(j, i);
                    }
                }
            }
        }
    }

    

    GameObject CreateDoor(Vector2 dir)
    {
        dir = dir.normalized;

        GameObject prefab = DirToDoor[dir];

        GameObject go = Instantiate(prefab,Vector3.zero,Quaternion.identity);

        return go;
    }

    public GameObject[] CreateMonster(int num)
    {
        GameObject[] go = new GameObject[num];
        for(int i=0;i<num;i++)
        {
            go[i] = Instantiate(prefabMonster, Vector3.zero, Quaternion.identity);
        }
        return go;
    }

    public GameObject[] CreateRandomCreature(int num)
    {
        GameObject[] objects = new GameObject[num];
        for(int i=0;i<num;i++)
        {
            int rand = Random.Range(0, creatures.Length);
            objects[i] = Instantiate(creatures[rand]);
        }
        return objects;
    }

    void OnDrawGizmos()
    {
        if (mst == null || visualRooms == null) return;

        Gizmos.color = Color.green; // 선 색상
        foreach (Edge edge in mst)
        {
            RoomController room1 = visualRooms.Find(r => r.RoomId == edge.V1);
            RoomController room2 = visualRooms.Find(r => r.RoomId == edge.V2);
            if (room1 != null && room2 != null)
            {
                Gizmos.DrawLine(room1.GetCenter(), room2.GetCenter());
            }
        }
    }

    IEnumerator RunSeparation()
    {
        Time.timeScale = 10f;

        while (!AllRoomsAreSleeping())
            yield return null;

        Time.timeScale = 1f;


        for(int i=0;i<rigidbody2Ds.Count;i++)
        {
            //rigidbody2Ds[i].simulated = false;
            Destroy(rigidbody2Ds[i]);
            boxCollider2Ds[i].enabled = false;
        }
        foreach (RoomController obj in visualRooms)
            obj.gameObject.SetActive(true);

        SnapAllRoomsToGrid(); // 위치 반올림 처리

        StartCoroutine("GenerateCorridor");
    }

    void SnapAllRoomsToGrid()
    {
        foreach (RoomController obj in visualRooms)
        {
            Vector3 pos = obj.transform.parent.transform.position;
            pos.x = Mathf.Round(pos.x);
            pos.y = Mathf.Round(pos.y);
            obj.transform.parent.transform.position = pos;
        }
    }

    bool AllRoomsAreSleeping()
    {
        foreach (var rb in rigidbody2Ds)
        {
            if (!rb.IsSleeping())
                return false;
        }
        return true;
    }

}