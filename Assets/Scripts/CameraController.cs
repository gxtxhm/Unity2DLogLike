using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class CameraController : MonoBehaviour
{
    [SerializeField]
    GameObject Target;

    Camera cam;
    // Start is called before the first frame update
    void Start()
    {
        cam = GetComponent<Camera>();
        cam.transform.position = new Vector3(Target.transform.position.x,Target.transform.position.y,-10);
        

    }

    // Update is called once per frame
    void Update()
    {
        cam.transform.position = new Vector3(Target.transform.position.x, Target.transform.position.y, -10);
    }
}
