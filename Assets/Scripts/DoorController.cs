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

    private void OnTriggerEnter2D(Collider2D collision)
    {
        if(collision.tag == "Player")
            StartCoroutine(doorOpen());
    }

    //IEnumerator doorOpen()
    //{
    //    float elapsedTime = 0;
    //    Vector2 v1;
    //    v1.x = door1.transform.position.x;
    //    Vector2 v2;
    //    v2.x = door2.transform.position.x;

    //    Transform t1 = door1.GetComponentInChildren<Transform>();
    //    Transform t2 = door2.GetComponentInChildren<Transform>();
    //    Vector2 tv1 = Vector2.zero;
    //    Vector2 tv2 = Vector2.zero;


    //    while (elapsedTime < animTime)
    //    {
    //        elapsedTime += Time.deltaTime;

    //        float newPosY = Mathf.Lerp(door1.transform.position.y, door1.transform.position.y - endPos.y, elapsedTime / animTime);
    //        v1.y = newPosY;
    //        door1.transform.position = v1;
    //        tv1.y = -1*newPosY;
    //        t1.localPosition = tv1;

    //        newPosY = Mathf.Lerp(door2.transform.position.y, door2.transform.position.y - endPos.y, elapsedTime / animTime);
    //        v2.y = newPosY;
    //        door2.transform.position = v2;
    //        tv2.y = -1*newPosY;
    //        t2.localPosition = tv2;

    //        yield return null;
    //    }
    //}
    IEnumerator doorOpen()
    {

        GetComponent<BoxCollider2D>().enabled = false;
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