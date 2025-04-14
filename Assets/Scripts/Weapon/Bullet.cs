using System.Collections;
using System.Collections.Generic;
using Unity.VisualScripting;
using UnityEngine;

public class Bullet : MonoBehaviour
{
    public PoolingType poolingType;
    [SerializeField]
    float Speed = 20.0f;
    Vector3 direc;

    public int Damage;
    public float lifeSpan;

    bool canMove = false;

    public void InitBullet(float angle)
    {
        transform.rotation = Quaternion.Euler(0, 0, angle);
        
        float angleRad = angle * Mathf.Deg2Rad;
        direc = new Vector3(Mathf.Cos(angleRad), Mathf.Sin(angleRad), 0).normalized;

        PoolingManager.Instance.ReturnBullet(gameObject, lifeSpan);
        canMove = true;
    }


    // Update is called once per frame
    void Update()
    {
        if(canMove)
            transform.position += -1 * direc * Speed * Time.deltaTime;
    }

    private void OnTriggerEnter2D(Collider2D collision)
    {
        Debug.Log(collision.gameObject.tag);
        if(collision.gameObject.CompareTag("Enemy"))
        {
            collision.gameObject.GetComponent<Test_Monster>().TakeDamage(Damage);
            PoolingManager.Instance.ReturnBullet(gameObject);
        }
        else if(collision.gameObject.CompareTag("Wall"))
        {
            PoolingManager.Instance.ReturnBullet(gameObject);
        }
    }
}
