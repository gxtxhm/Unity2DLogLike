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

    bool isEntered = false;

    RoomController rc;

    public void Init()
    {
        enterCollider.gameObject.GetComponent<ActionColliderTrigger>().triggerAction += ActionEnterDoor;
        exitCollider.gameObject.GetComponent<ActionColliderTrigger>().triggerAction += ActionExitDoor;
        rc = transform.parent.GetComponent<RoomController>();
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

        // �ʱ� ��ġ ����
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

            // ���� �Ʒ��� �̵�
            door1.transform.localPosition = door1Start + Vector3.down * offsetY;
            door2.transform.localPosition = door2Start + Vector3.down * offsetY;

            // ����ũ�� ���� �̵�
            mask1.localPosition = mask1Start + Vector3.up * offsetY;
            mask2.localPosition = mask2Start + Vector3.up * offsetY;

            yield return null;
        }
    }

    IEnumerator doorClose()
    {
        Debug.Log("doorClose");
        float elapsedTime = 0f;

        // ���� ���� ��ġ ����
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
            float offsetY = Mathf.Lerp(0, endPos.y-1, t); // ���� ����(-endPos.y)���� ���� ��ġ(0)��

            // ���� ���� �̵�
            door1.transform.localPosition = door1Start + Vector3.down * offsetY;
            door2.transform.localPosition = door2Start + Vector3.down * offsetY;

            // ����ũ�� �Ʒ��� �̵�
            mask1.localPosition = mask1Start + Vector3.up * offsetY;
            mask2.localPosition = mask2Start + Vector3.up * offsetY;

            yield return null;
        }
    }

}