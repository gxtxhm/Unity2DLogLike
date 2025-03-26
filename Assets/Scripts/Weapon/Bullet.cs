using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Bullet : MonoBehaviour
{
    [SerializeField]
    float Speed = 20.0f;
    Vector3 direc;

    void Start()
    {
        Destroy(gameObject,3f);
        float angleRad = transform.eulerAngles.z * Mathf.Deg2Rad;
        direc = new Vector3(Mathf.Cos(angleRad),Mathf.Sin(angleRad),0).normalized;
    }

    // Update is called once per frame
    void Update()
    {
        transform.position += -1 * direc * Speed * Time.deltaTime;
    }

    private void OnTriggerEnter2D(Collider2D collision)
    {
        if(collision.gameObject.CompareTag("Enemy"))
        {
            collision.gameObject.GetComponent<Test_Monster>().TakeDamage(20);
            Destroy(gameObject);
        }
    }
}
