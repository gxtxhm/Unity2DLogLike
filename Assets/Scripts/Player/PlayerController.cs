using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class PlayerController : MonoBehaviour
{
    [SerializeField]
    Sprite IdleUp;
    [SerializeField]
    Sprite IdleSide;
    [SerializeField]
    Sprite IdleDown;

    [SerializeField]
    float speed = 5.0f;

    

    public GameObject WeaponPos;
    Weapon curWeapon;
    public Weapon TestWeapon;

    Vector2 moveVec;
    string curWeaponDirection;

    bool isMove;

    bool canShoot = true;

    SpriteRenderer spriteRenderer;
    Animator animator;

    [SerializeField]
    Canvas UICanvas;

    public Canvas GetCanvas() { return UICanvas; }

    public void Init()
    {
        curWeapon.Init();

        WeaponManager.Instance.AddWeapon(curWeapon);
        WeaponManager.Instance.AddWeapon(TestWeapon);
    }

    private void Awake()
    {
        spriteRenderer = GetComponent<SpriteRenderer>();
        animator = GetComponent<Animator>();
        WeaponPos = GameObject.Find("WeaponPos");
        curWeapon = WeaponPos.GetComponentInChildren<Weapon>();

    }

    void Start()
    {
        
    }

    void Update()
    {
        InputMove();
        RotateDirection();
        MovePlayer();

        if(Input.GetMouseButton(0))
        {
            if (canShoot && curWeapon.CanShoot()) 
                StartCoroutine("Co_Shoot");
        }
        if(Input.GetMouseButtonUp(0))
        {
            StopCoroutine("Co_Shoot");
            canShoot = true;
        }

        if(Input.GetKeyDown(KeyCode.R))
        {
            curWeapon.Reload();
        }

        if(Input.GetKeyDown(KeyCode.LeftControl))
        {
            Weapon weapon = WeaponManager.Instance.SwapWeapon();
            if (weapon == null) return;
            EquipWeapon(weapon);
        }
    }


    void InputMove()
    {
        float h = Input.GetAxisRaw("Horizontal");
        float v = Input.GetAxisRaw("Vertical");

        moveVec = new Vector2(h, v);
        isMove = moveVec.sqrMagnitude > 0;

        if (isMove == false)
        {
            animator.speed = 0;
            animator.enabled = false;
            return;
        }
        animator.enabled = true;
        animator.speed = 1;
    }

    void RotateDirection()
    {
        Vector3 mousePos = Camera.main.ScreenToWorldPoint(Input.mousePosition);
        mousePos.z = 0;

        Vector2 dir = mousePos - transform.position; // 방향 벡터
        float angle = Mathf.Atan2(dir.y, dir.x) * Mathf.Rad2Deg; // 라디안 → 도

        //Debug.Log($"각도 {angle}도");
        WeaponPos.transform.rotation = Quaternion.Euler(0, 0, angle-90);
        if(angle >= -45 && angle < 45)
        {
            //Debug.Log("Right");
            curWeaponDirection = "Right";
        }
        else if(angle >=45 && angle <135)
        {
            //Debug.Log("Up");
            curWeaponDirection = "Up";
        }
        else if(angle>=-135 && angle<-45)
        {
            //Debug.Log("Down");
            curWeaponDirection = "Down";
        }
        else
        {
            //Debug.Log("Left");
            curWeaponDirection = "Left";
        }


        switch (curWeaponDirection)
        {
            case "Up":
                if (isMove) animator.Play("WalkUp");else spriteRenderer.sprite = IdleUp;
                break;
            case "Down":
                if (isMove) animator.Play("WalkDown");else spriteRenderer.sprite = IdleDown;
                break;
            case "Left":
                if (isMove) animator.Play("WalkSide");
                else spriteRenderer.sprite = IdleSide;
                spriteRenderer.flipX = true;
                break;
            case "Right":
                if (isMove) animator.Play("WalkSide");
                else spriteRenderer.sprite = IdleSide;
                spriteRenderer.flipX = false;
                break;
        }
    }

    void MovePlayer()
    {
        if (isMove == false) return;

        Vector2 newVec = (Vector2)transform.position + moveVec.normalized * speed * Time.deltaTime;
        transform.position = newVec;
    }

    IEnumerator Co_Shoot()
    {
        canShoot = false;
        curWeapon.Shoot();
        GameManager.Instance.bulletText.text = $"{curWeapon.curBulletCount}/{curWeapon.maxBulletCount}";
        yield return new WaitForSeconds(curWeapon.ShootSpeed);
        canShoot = true;
    }

    public void EquipWeapon(Weapon weapon)
    {
        weapon.transform.SetParent(WeaponPos.transform);
        weapon.transform.localPosition = new Vector3(0,0.12f,0);
        weapon.transform.localRotation = Quaternion.identity;
        curWeapon = weapon;

        GameManager.Instance.weaponImage.sprite = curWeapon.weaponSprite;
        GameManager.Instance.bulletText.text = $"{curWeapon.curBulletCount}/{curWeapon.maxBulletCount}";

    }

    public void UnEquipWeapon()
    {
        curWeapon.gameObject.SetActive(false);
    }
}
