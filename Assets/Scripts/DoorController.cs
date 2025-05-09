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
    BoxCollider2D curCollider;

    public BoxCollider2D Collider { get { return curCollider; } }

    public void Init()
    {
        curCollider.gameObject.GetComponent<ActionColliderTrigger>().triggerAction += TriggerAction;
        curCollider = GetComponentInChildren<BoxCollider2D>();
    }

    void TriggerAction(Collider2D collision)
    {
        if(collision.tag == "Player")
            StartCoroutine(doorOpen());
    }

    IEnumerator doorOpen()
    {
        curCollider.enabled = false;
        float elapsedTime = 0f;

        // 초기 위치 저장
        Vector3 door1Start = door1.transform.position;
        Vector3 door2Start = door2.transform.position;

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
            door1.transform.position = door1Start + Vector3.down * offsetY;
            door2.transform.position = door2Start + Vector3.down * offsetY;

            // 마스크는 위로 이동
            mask1.localPosition = mask1Start + Vector3.up * offsetY;
            mask2.localPosition = mask2Start + Vector3.up * offsetY;

            yield return null;
        }
    }

}