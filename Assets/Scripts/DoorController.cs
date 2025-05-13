using System.Collections;
using System.Collections.Generic;
using Unity.VisualScripting;
using UnityEngine;

public class DoorController : MonoBehaviour
{
    [SerializeField]
    Vector2 endPos;

    [SerializeField]
    float animTime;

    [SerializeField]
    GameObject door1;

    [SerializeField]
    GameObject door2;

    [SerializeField]
    BoxCollider2D enterCollider;

    [SerializeField]
    BoxCollider2D exitCollider;

    public BoxCollider2D EnterCollider { get { return enterCollider; } }
    public BoxCollider2D ExitCollider { get { return exitCollider; } }

    public int RoomId { get; set; }

    public Vector2 DoorDir { get; set; }

    public (Vector2, Vector2) originPos;

    bool isEntered = false;

    RoomController rc;

    Queue<Coroutine> jobQueue=new Queue<Coroutine>();

    

    public void Init()
    {
        enterCollider.gameObject.GetComponent<ActionColliderTrigger>().triggerAction += ActionEnterDoor;
        exitCollider.gameObject.GetComponent<ActionColliderTrigger>().triggerAction += ActionExitDoor;
        rc = transform.parent.GetComponent<RoomController>();
        originPos = (door1.transform.localPosition, door2.transform.localPosition);
    }

    public void EnterPlayer()
    {
        isEntered = true;
    }

    void ActionEnterDoor(Collider2D collision)
    {
        if(collision.tag == "Player")
        {
            Debug.Log("before IsEntered" + isEntered + "in ActionEnterDoor");   
            if(isEntered == false)
                StartCoroutine(doorOpen());
            else
            {
                StartCoroutine(doorClose());
                isEntered = false;
            }
            Debug.Log("after IsEntered" + isEntered + "in ActionEnterDoor");
        }
    }

    void ActionExitDoor(Collider2D collision)
    {
        if(collision.tag == "Player")
        {
            Debug.Log("before IsEntered" + isEntered + "in ActionExitDoor");
            if (isEntered == false)
            {
                StartCoroutine (doorClose());
                isEntered = true;
                rc.StartRoom();
            }
            else
                StartCoroutine(doorOpen());

            Debug.Log("after IsEntered" + isEntered + "in ActionExitDoor");
        }
    }

    IEnumerator doorOpen()
    {
        Debug.Log("doorOpen");
        float elapsedTime = 0f;

        // 초기 위치 저장
        Vector3 door1Start = door1.transform.localPosition;
        Vector3 door2Start = door2.transform.localPosition;

        Transform mask1 = door1.GetComponentInChildren<SpriteMask>().transform;
        Transform mask2 = door2.GetComponentInChildren<SpriteMask>().transform;

        Vector3 mask1Start = mask1.localPosition;
        Vector3 mask2Start = mask2.localPosition;

        while (elapsedTime < animTime)
        {
            elapsedTime += Time.deltaTime;
            float t = Mathf.Clamp01(elapsedTime / animTime);
            float offsetY = Mathf.Lerp(0, -endPos.y, t);

            // 문은 아래로 이동
            door1.transform.localPosition = door1Start + Vector3.down * offsetY;
            door2.transform.localPosition = door2Start + Vector3.down * offsetY;

            // 마스크는 위로 이동
            mask1.localPosition = mask1Start + Vector3.up * offsetY;
            mask2.localPosition = mask2Start + Vector3.up * offsetY;

            yield return null;
        }
    }

    IEnumerator doorClose()
    {
        Debug.Log("doorClose");
        float elapsedTime = 0f;

        // 현재 로컬 위치 저장
        Vector3 door1Start = door1.transform.localPosition;
        Vector3 door2Start = door2.transform.localPosition;

        Transform mask1 = door1.GetComponentInChildren<SpriteMask>().transform;
        Transform mask2 = door2.GetComponentInChildren<SpriteMask>().transform;

        Vector3 mask1Start = mask1.localPosition;
        Vector3 mask2Start = mask2.localPosition;

        while (elapsedTime < animTime)
        {
            elapsedTime += Time.deltaTime;
            float t = Mathf.Clamp01(elapsedTime / animTime);
            float offsetY = Mathf.Lerp(0, endPos.y-0.5f, t); // 열린 상태(-endPos.y)에서 원래 위치(0)로

            mask1.localPosition = mask1Start + Vector3.up * offsetY;
            mask2.localPosition = mask2Start + Vector3.up * offsetY;

            door1.transform.localPosition = door1Start + Vector3.down * offsetY;
            door2.transform.localPosition = door2Start + Vector3.down * offsetY;

            

            yield return null;
        }
        // 하드 코딩으로 원래 위치 맞추기
        door1.transform.localPosition = originPos.Item1;
        door2.transform.localPosition = originPos.Item2;
        mask1.localPosition = Vector3.zero;
        mask2.localPosition = Vector3.zero;
    }

}