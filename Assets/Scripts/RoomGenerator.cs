﻿using System.Collections;
using System.Collections.Generic;
using Unity.VisualScripting;
using UnityEditor;
using UnityEngine;
using UnityEngine.UI;

public class RoomGenerator : MonoBehaviour
{
    // test
    [SerializeField]
    Sprite floorSprite;

    [SerializeField]
    int minRoom;
    [SerializeField]
    int maxRoom;

    [SerializeField]
    int roomCount;

    [SerializeField]
    float roomPadding;

    // middleX = 0, middleY =1,
    // lf = 2 ,     lb = 3,
    // rf = 4,      rb =5
    [SerializeField]
    GameObject[] corridorTile;

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
    Sprite questionMarkSprite;

    List<Edge> mst;

    Dictionary<Vector2,GameObject> DirToDoor = new Dictionary<Vector2,GameObject>();

    public int GetRoomCount()
    {
        return roomCount;
    }

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

    public void StartGenerateRoom()
    {
        rigidbody2Ds.Clear();
        for (int i = 0; i < roomCount; i++)
        {
            int x = Random.Range(-5, 5);
            int y = Random.Range(-5, 5);

            GenerateRoom(new Vector3(x+0.5f, y+0.5f, 0));
        }

        foreach (Rigidbody2D rb in rigidbody2Ds)
        {
            rb.bodyType = RigidbodyType2D.Dynamic;
        }
        StartCoroutine("RunSeparation");
    }


    void GenerateRoom(Vector3 sv)
    {
        //GameObject go = new GameObject("Room" + roomNumCnt);
        //GameObject goo = new GameObject("Room");
        //goo.transform.position = sv;
        //go.transform.SetParent(goo.transform);
        //go.transform.localPosition = Vector3.zero;
        //RoomController rc = go.AddComponent<RoomController>();
        //visualRooms.Add(rc);

        //GameObject structure = new GameObject("Structure");
        //structure.transform.SetParent(go.transform);
        //rc.Structure = structure;
        //structure.transform.localPosition = Vector3.zero;

        //GameObject mapObject = new GameObject("MinimapImage");
        //mapObject.AddComponent<SpriteRenderer>().sprite = questionMarkSprite;
        //mapObject.layer = 13; // Minimap
        //mapObject.transform.SetParent(go.transform);
        //mapObject.transform.localPosition = Vector3.zero;

        //int xLen = Random.Range(minRoom, maxRoom);
        //int yLen = Random.Range(minRoom, maxRoom);

        //Rigidbody2D rb = goo.AddComponent<Rigidbody2D>();
        //rb.gravityScale = 0;
        //rb.constraints = RigidbodyConstraints2D.FreezeRotation;
        //rb.bodyType = RigidbodyType2D.Static;
        //rb.drag = 6;
        //rigidbody2Ds.Add(rb);

        //BoxCollider2D bc = goo.AddComponent<BoxCollider2D>();
        //boxCollider2Ds.Add(bc);

        //float yOffset = yLen / 2;
        //float xOffset = xLen / 2;

        //bc.offset = new Vector2(xOffset, yOffset);
        //bc.size = new Vector2(xLen + roomPadding, yLen + roomPadding);

        //// 배열로 미리 어떤 타일을 생성할지 세팅
        //// 벽 세팅
        //rc.roomArrayData = new TileType[yLen, xLen];
        //for (int i = 0; i < yLen; i++)
        //{
        //    rc.roomArrayData[i, 0] = TileType.Wall;
        //    rc.roomArrayData[i, xLen - 1] = TileType.Wall;
        //}
        //for (int i = 0; i < xLen; i++)
        //{
        //    rc.roomArrayData[0, i] = TileType.Wall;
        //    rc.roomArrayData[yLen - 1, i] = TileType.Wall;
        //}

        //// 방 크기만큼 바닥타일 생성

        //for (int i = 0; i < yLen; i++)
        //{
        //    for (int j = 0; j < xLen; j++)
        //    {
        //        if (rc.roomArrayData[i, j] == 0)
        //        {
        //            GameObject inst;
        //            inst = Instantiate(floorTile, Vector3.zero, Quaternion.identity);
        //            inst.transform.SetParent(structure.transform);
        //            inst.transform.localPosition = new Vector3(j, i, 0);
        //            rc.roomArrayData[i, j] = TileType.Floor;
        //        }

        //    }
        //}

        //// 룸 Init 함수
        //rc.SetInit(xLen, yLen, roomNumCnt++);
        //go.SetActive(false);
        //roomMap.Add(rc.RoomId, rc);
        GameObject go = new GameObject("Room" + roomNumCnt);
        GameObject goo = new GameObject("Room");
        goo.transform.position = sv;
        go.transform.SetParent(goo.transform);
        go.transform.localPosition = Vector3.zero;
        RoomController rc = go.AddComponent<RoomController>();
        visualRooms.Add(rc);

        // 구조 오브젝트
        GameObject structure = new GameObject("Structure");
        structure.transform.SetParent(go.transform);
        rc.Structure = structure;
        structure.transform.localPosition = Vector3.zero;

        // 미니맵 물음표
        GameObject mapObject = new GameObject("MinimapImage");
        SpriteRenderer qsr = mapObject.AddComponent<SpriteRenderer>();
        qsr.sprite = questionMarkSprite;
        qsr.sortingOrder = 3;
        mapObject.layer = 13; // Minimap
        mapObject.transform.SetParent(go.transform);
        

        
        // 안개 오브젝트
        GameObject fog = new GameObject("Fog");
        SpriteRenderer fogSr = fog.AddComponent<SpriteRenderer>();
        fogSr.sprite = floorSprite; // 바닥 타일 재사용
        fogSr.color = Color.black; // 검정 안개
        fogSr.sortingOrder = 1;
        fogSr.sortingLayerName = "Creature";
        fog.layer = LayerMask.NameToLayer("Default"); // 기본 레이어
        fog.transform.SetParent(go.transform);
        fog.transform.localPosition = Vector3.zero;
        rc.fog = fog;

        // 방 크기 설정
        int xLen = Random.Range(minRoom, maxRoom);
        int yLen = Random.Range(minRoom, maxRoom);

        // 안개와 미니맵 스프라이트 스케일 조정
        fog.transform.localScale = new Vector3(xLen, yLen, 1);
        fog.transform.localPosition = new Vector2(xLen / 2.0f, yLen / 2.0f);

        mapObject.transform.localPosition = new Vector2(xLen / 2.0f, yLen / 2.0f);

        // 기존 코드 (Rigidbody2D, BoxCollider2D, 타일 생성 등)
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

        // 벽 및 바닥 타일 설정
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

        for (int i = 0; i < yLen; i++)
        {
            for (int j = 0; j < xLen; j++)
            {
                if (rc.roomArrayData[i, j] == 0)
                {
                    GameObject inst = Instantiate(floorTile, Vector3.zero, Quaternion.identity);
                    inst.transform.SetParent(structure.transform);
                    inst.transform.localPosition = new Vector3(j, i, 0);
                    rc.roomArrayData[i, j] = TileType.Floor;
                }
            }
        }

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

            GameObject door2 = CreateDoor(-snappedDir);
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
            CreateCorridors(corridors, inputVec, randPos,inputVec2, mode);

        }
        CreateWall();
        FilledFloorTile();
        SetRoomCreature();

        foreach(RoomController room in visualRooms)
        {
            room.GeneratePathMap();
        }
        int randRoom = Random.Range(0, roomNumCnt);
        GameManager.Instance.GameStart(visualRooms[randRoom]);
        yield return null;
    }

    void SetRoomCreature()
    {
        foreach(RoomController rc in visualRooms)
        {
            rc.SetCreature(this);
        }
    }

    // dx > 0 , dy > 0
    // x = false : left, x = true : right
    // y = false : front, y = true : back
    GameObject GetDirToCorridorTile(bool x, bool y)
    {
        // lf
        if (!x && !y) return corridorTile[2];
        // lb
        else if (!x && y) return corridorTile[3];
        // rf
        else if (x && !y) return corridorTile[4];
        // rb
        else if(x && y) return corridorTile[5];

        else return null;
    }

    void CreateCorridors(GameObject parent, Vector2 v, Vector2 v2 /*randPos*/, Vector2 v3, bool mode /* true: x -> y -> x, false: y -> x -> y */)
    {
        Vector2Int pos = new Vector2Int((int)v.x, (int)v.y);
        Vector2Int pos2 = new Vector2Int((int)v2.x, (int)v2.y);
        Vector2Int pos3 = new Vector2Int((int)v3.x, (int)v3.y);

        (Vector2Int, Vector2Int)[] path = new (Vector2Int, Vector2Int)[3];

        // 경로 설정
        if (mode)
        {
            path[0] = (pos, new Vector2Int(pos2.x, pos.y)); // x축
            path[1] = (new Vector2Int(pos2.x, pos.y), new Vector2Int(pos2.x, pos3.y)); // y축
            path[2] = (new Vector2Int(pos2.x, pos3.y), pos3); // x축
        }
        else
        {
            path[0] = (pos, new Vector2Int(pos.x, pos2.y)); // y축
            path[1] = (new Vector2Int(pos.x, pos2.y), new Vector2Int(pos3.x, pos2.y)); // x축
            path[2] = (new Vector2Int(pos3.x, pos2.y), pos3); // y축
        }

        for (int i = 0; i < 3; i++)
        {
            Vector2Int start = path[i].Item1;
            Vector2Int end = path[i].Item2;

            int dx = (start.x == end.x) ? 0 : (end.x > start.x) ? 1 : -1;
            int dy = (start.y == end.y) ? 0 : (end.y > start.y) ? 1 : -1;

            // 직선 타일 생성
            if (dx != 0) // x축 이동
            {
                int initX = (i == 0) ? start.x : start.x + dx;
                for (int x = initX; x != end.x; x += dx)
                {
                    GameObject go = Instantiate(corridorTile[0], new Vector2(x, start.y), Quaternion.identity);
                    go.transform.SetParent(parent.transform, true);
                }
            }
            else if (dy != 0) // y축 이동
            {
                int initY = (i == 0) ? start.y : start.y + dy;
                for (int y = initY; y != end.y; y += dy)
                {
                    GameObject go = Instantiate(corridorTile[1], new Vector2(start.x, y), Quaternion.identity);
                    go.transform.SetParent(parent.transform, true);
                }
            }

            // 모서리 타일 생성 (i < 2일 때만, 마지막 끝점 제외)
            if (i < 2 && (dx != 0 || dy != 0))
            {
                GameObject go = null;
                if (dx == 0 && dy == 0) // 동일 좌표
                    continue;

                // 다음 경로의 방향 확인
                Vector2Int nextStart = path[i + 1].Item1;
                Vector2Int nextEnd = path[i + 1].Item2;
                int nextDx = (nextStart.x == nextEnd.x) ? 0 : (nextEnd.x > nextStart.x) ? 1 : -1;
                int nextDy = (nextStart.y == nextEnd.y) ? 0 : (nextEnd.y > nextStart.y) ? 1 : -1;

                if (dx != 0 && nextDy != 0) // x -> y
                {
                    GameObject prefab = GetDirToCorridorTile((dx > 0), (nextDy < 0));
                    go = Instantiate(prefab, new Vector2(end.x, end.y), Quaternion.identity);
                }
                else if (dy != 0 && nextDx != 0) // y -> x
                {
                    GameObject prefab = GetDirToCorridorTile((nextDx < 0), (dy > 0));
                    go = Instantiate(prefab, new Vector2(end.x, end.y), Quaternion.identity);
                }
                else // 직선 경로
                {
                    go = Instantiate(dx != 0 ? corridorTile[0] : corridorTile[1], new Vector2(end.x, end.y), Quaternion.identity);
                }

                if (go != null)
                    go.transform.SetParent(parent.transform, true);
            }

            // 최종 끝점 처리 (i == 2)
            if (i==2)
            {
                GameObject go = null;
                
                go = Instantiate((dx != 0)? corridorTile[0] : corridorTile[1],new Vector2(end.x,end.y),Quaternion.identity);
                if (go != null)
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
                        inst.transform.SetParent(rc.Structure.transform);
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
                        go.transform.SetParent(rc.Structure.transform);
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