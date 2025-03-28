using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class CameraController : MonoBehaviour
{
    [SerializeField]
    GameObject Target;

    [SerializeField]
    float maxDistance = 5;

    [SerializeField]
    float moveSpeed = 5.0f;
    Camera cam;
    // Start is called before the first frame update
    void Start()
    {
        cam = GetComponent<Camera>();
        cam.transform.position = new Vector3(Target.transform.position.x,Target.transform.position.y,-10);
        
        
    }

    // Update is called once per frame
    void LateUpdate()
    {
        Vector3 mousePos = Camera.main.ScreenToWorldPoint(Input.mousePosition);
        mousePos.z = 0;

        Vector3 targetPos = Target.transform.position;
         
        Vector3 offset = (mousePos - targetPos).normalized*Mathf.Min(Vector3.Distance(mousePos, targetPos), maxDistance);

        Vector3 desirePos = targetPos + offset;
        desirePos.z = -10;

        transform.position = Vector3.Lerp(transform.position,desirePos,Time.deltaTime * moveSpeed);
    }
}