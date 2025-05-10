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
    GameObject backDoor;

    [SerializeField]
    GameObject leftDoor;

    [SerializeField]
    GameObject rightDoor;

    int roomNumCnt = 0;

    List<Rigidbody2D> rigidbody2Ds = new List<Rigidbody2D>();
    List<RoomController> visualRooms = new List<RoomController>();
    Dictionary<int,RoomController> roomMap = new Dictionary<int,RoomController>();
    List<BoxCollider2D> boxCollider2Ds = new List<BoxCollider2D>();

    [SerializeField]
    float tileSize = 1f; // <- 인스펙터에서 설정할 수 있도록

    List<Edge> mst;

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

        // 문 생성하는 것. 통로까지 완료하고 나중에
        // door 방향 정하고 
        // for test 우선은 아래 위로만
        //DoorController enterd = Instantiate(frontDoor).GetComponent<DoorController>();
        //DoorController exitd = Instantiate(frontDoor).GetComponent<DoorController>();
        //enterd.gameObject.transform.SetParent(go.transform);
        //exitd.gameObject.transform.SetParent(go.transform);

        //int enterdRandPos = Random.Range(1, xLen - 1);
        //int exitdRandPos = Random.Range(1, xLen - 1);
        //arr[yLen - 1, enterdRandPos] = -1;
        //arr[yLen - 1, enterdRandPos - 1] = 2;
        //arr[0, exitdRandPos - 1] = 3;
        //arr[0, exitdRandPos] = -1;

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

                // TODO : 우선 통로 생성 후에 다른 타일 생성
                //switch (arr[i, j])
                //{
                //    case 0:
                //        inst = Instantiate(floorTile, Vector3.zero, Quaternion.identity);
                //        inst.transform.SetParent(go.transform);
                //        inst.transform.localPosition = new Vector3(j - yOffset, i - xOffset, 0);
                //        break;
                //    case 1:
                //        inst = Instantiate(wallTile, Vector3.zero, Quaternion.identity);
                //        inst.transform.SetParent(go.transform);
                //        inst.transform.localPosition = new Vector3(j - yOffset, i - xOffset, 0);
                //        break;
                //    case 2:

                //        exitd.gameObject.transform.localPosition = new Vector3(j - yOffset, i - xOffset, 0);
                //        break;
                //    case 3:

                //        enterd.gameObject.transform.localPosition = new Vector3(j - yOffset, i - xOffset, 0);
                //        break;
                //}
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
        List<Kruscal.KruscalNode> nodes = new List<Kruscal.KruscalNode> ();
        
        for(int i=0;i<visualRooms.Count;i++)
        {
            Kruscal.KruscalNode node = new Kruscal.KruscalNode();
            node.Id = visualRooms[i].RoomId;
            node.Center = visualRooms[i].transform.position; //visualRooms[i].GetCenter();
            nodes.Add(node);
        }
        kruscal.rooms = nodes;

        mst = kruscal.Run();

        Dictionary<int,int> corCnt = new Dictionary<int,int>();

        foreach(Edge e in mst)
        {
            corCnt[e.V1] = corCnt.ContainsKey(e.V1) ? corCnt[e.V1] + 1 : 1;
            corCnt[e.V2] = corCnt.ContainsKey(e.V2) ? corCnt[e.V2] + 1 : 1;

            // For Debug
            Debug.Log(e.V1 + " <--> " + e.V2);
        }

        yield return null;
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

        //SnapAllRoomsToGrid(); // 위치 반올림 처리

        StartCoroutine("GenerateCorridor");
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