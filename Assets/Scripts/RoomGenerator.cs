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
    GameObject floorTile;

    [SerializeField]
    GameObject wallTile;

    [SerializeField]
    GameObject frontDoor;

    [SerializeField]
    GameObject sideDoor;

    int roomNumCnt = 0;

    List<Rigidbody2D> rigidbody2Ds = new List<Rigidbody2D>();
    List<RoomController> visualRooms = new List<RoomController>();
    Dictionary<int,RoomController> roomMap = new Dictionary<int,RoomController>();
    List<BoxCollider2D> boxCollider2Ds = new List<BoxCollider2D>();

    [SerializeField]
    float tileSize = 1f; // <- 인스펙터에서 설정할 수 있도록

    List<Edge> mst;

    Dictionary<Vector2,GameObject> DirToDoor = new Dictionary<Vector2,GameObject>();

    public void Start()
    {
        DirToDoor.Clear();
        DirToDoor.Add(Vector2.down, frontDoor);
        DirToDoor.Add(Vector2.up, frontDoor);
        DirToDoor.Add(Vector2.left, sideDoor);
        DirToDoor.Add(Vector2.right, sideDoor);
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

            GenerateRoom(new Vector3(x, y, 0));

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

        BoxCollider2D bc = goo.AddComponent<BoxCollider2D>();
        boxCollider2Ds.Add(bc);
        bc.offset = Vector3.zero;
        bc.size = new Vector2(xLen + roomPadding, yLen + roomPadding);

        Rigidbody2D rb = goo.AddComponent<Rigidbody2D>();
        rb.gravityScale = 0;
        rb.constraints = RigidbodyConstraints2D.FreezeRotation;
        rb.bodyType = RigidbodyType2D.Static;
        rb.drag = 6;
        rigidbody2Ds.Add(rb);

        // 배열로 미리 어떤 타일을 생성할지 세팅
        int[,] arr = new int[yLen, xLen];
        for (int i = 0; i < yLen; i++)
        {
            arr[i, 0] = 1;
            arr[i, xLen - 1] = 1;
        }
        for (int i = 0; i < xLen; i++)
        {
            arr[0, i] = 1;
            arr[yLen - 1, i] = 1;
        }

        // 배열값에 따라 맞는 프리팹 생성
        int yOffset = yLen / 2;
        int xOffset = xLen / 2;
        for (int i = 0; i < yLen; i++)
        {
            for (int j = 0; j < xLen; j++)
            {
                GameObject inst;
                inst = Instantiate(floorTile, Vector3.zero, Quaternion.identity);
                inst.transform.SetParent(go.transform);
                inst.transform.localPosition = new Vector3(j - yOffset, i - xOffset, 0);

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

        foreach (Edge e in mst)
        {
            Vector2 dir = (roomMap[e.V1].GetCenter() - roomMap[e.V2].GetCenter()).normalized;

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
        }

        yield return null;
    }

    GameObject CreateDoor(Vector2 dir)
    {
        dir = dir.normalized;

        GameObject prefab = DirToDoor[dir];

        GameObject go = Instantiate(prefab,Vector3.zero,Quaternion.identity);

        return go;
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
            rigidbody2Ds[i].simulated = false;
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