using System.Collections;
using System.Collections.Generic;
using TMPro;
using Unity.VisualScripting;
using UnityEngine;
using UnityEngine.UI;

struct Heart
{
    public int stairs;
}

public class PlayerController : MonoBehaviour
{
    [SerializeField]
    Sprite IdleUp;
    [SerializeField]
    Sprite IdleSide;
    [SerializeField]
    Sprite IdleDown;

    [SerializeField]
    float speed = 8.0f;

    AudioSource audioSource;
    [SerializeField]
    GameObject cursor;

    [SerializeField]
    Image[] heartsImage;

    [SerializeField]
    Sprite[] heartSprites;

    Heart[] hearts = new Heart[3];
    int heartsIndex = 2;

    public GameObject WeaponPos;
    Weapon curWeapon;
    public Weapon TestWeapon;
    public Weapon TestWeapon2;

    Vector2 moveVec;
    string curWeaponDirection;

    bool isMove;

    bool canShoot = true;

    SpriteRenderer spriteRenderer;
    Animator animator;

    [SerializeField]
    Canvas UICanvas;

    public Canvas GetCanvas() { return UICanvas; }

    [SerializeField]
    TextMeshProUGUI roomClearText;

    public void Init()
    {
        WeaponManager.Instance.AddWeapon(curWeapon);
        WeaponManager.Instance.AddWeapon(TestWeapon);
        WeaponManager.Instance.AddWeapon(TestWeapon2);
        EquipWeapon(curWeapon);

        for(int i=0;i<3;i++)
        {
            hearts[i] = new Heart();
            hearts[i].stairs = 2;

            heartsImage[i].sprite = heartSprites[2];
        }
    }

    private void Awake()
    {
        spriteRenderer = GetComponent<SpriteRenderer>();
        animator = GetComponent<Animator>();
        WeaponPos = GameObject.Find("WeaponPos");
        curWeapon = WeaponPos.GetComponentInChildren<Weapon>();
        audioSource = GetComponent<AudioSource>();
    }

    void Start()
    {
        
    }

    void Update()
    {
        if (GameManager.Instance.isEnd) return;
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
        cursor.transform.position = mousePos;

        Vector2 dir = mousePos - transform.position; 
        float angle = Mathf.Atan2(dir.y, dir.x) * Mathf.Rad2Deg; 

        
        WeaponPos.transform.rotation = Quaternion.Euler(0, 0, angle-90);
        if(angle >= -45 && angle < 45)
        {
            curWeaponDirection = "Right";
        }
        else if(angle >=45 && angle <135)
        {
            curWeaponDirection = "Up";
        }
        else if(angle>=-135 && angle<-45)
        {
            curWeaponDirection = "Down";
        }
        else
        {
            curWeaponDirection = "Left";
        }

        curWeapon.SpriteRenderer.sortingOrder = 6;

        switch (curWeaponDirection)
        {
            case "Up":
                if (isMove) animator.Play("WalkUp");else spriteRenderer.sprite = IdleUp;
                if (angle < 0) curWeapon.SpriteRenderer.flipY = true;
                else curWeapon.SpriteRenderer.flipY = false;
                curWeapon.SpriteRenderer.sortingOrder = 4;
                break;
            case "Down":
                if (isMove) animator.Play("WalkDown");else spriteRenderer.sprite = IdleDown;
                if (angle < 0) curWeapon.SpriteRenderer.flipY = true;
                else curWeapon.SpriteRenderer.flipY = false;
                break;
            case "Left":
                if (isMove) animator.Play("WalkSide");
                else spriteRenderer.sprite = IdleSide;
                spriteRenderer.flipX = true;
                curWeapon.SpriteRenderer.flipY = true;
                break;
            case "Right":
                if (isMove) animator.Play("WalkSide");
                else spriteRenderer.sprite = IdleSide;
                spriteRenderer.flipX = false;
                curWeapon.SpriteRenderer.flipY = false;
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
        GameManager.Instance.bulletText.text = $"{curWeapon.curAmmo}/{curWeapon.maxAmmo}";
        yield return new WaitForSeconds(curWeapon.FireRate);
        canShoot = true;
    }

    public void EquipWeapon(Weapon weapon)
    {
        weapon.transform.SetParent(WeaponPos.transform);
        weapon.transform.localPosition = new Vector3(0,0.06f,0);
        weapon.transform.localRotation = Quaternion.Euler(0, 0, weapon.RotateZ);
        curWeapon = weapon;
        curWeapon.Init();
        GameManager.Instance.weaponImage.sprite = curWeapon.weaponSprite;
        GameManager.Instance.bulletText.text = $"{curWeapon.curAmmo}/{curWeapon.maxAmmo}";

    }

    public void UnEquipWeapon()
    {
        curWeapon.gameObject.SetActive(false);
    }

    
    public void StartClearText()
    {
        StartCoroutine(Co_ActiveRoomClearText());
    }

    IEnumerator Co_ActiveRoomClearText()
    {
        float animTime = 1f;
        float elapsedTime = 0;
        while(elapsedTime < animTime)
        {
            elapsedTime += Time.deltaTime;
            float value = Mathf.Lerp(0, 1, elapsedTime / animTime);

            Color c = roomClearText.color;
            c.a = value;
            roomClearText.color = c;

            yield return null;
        }
        StartCoroutine(Co_DeActiveRoomClearText());
    }

    IEnumerator Co_DeActiveRoomClearText()
    {
        float animTime = 1f;
        float elapsedTime = 0;
        while (elapsedTime < animTime)
        {
            elapsedTime += Time.deltaTime;
            float value = Mathf.Lerp(1, 0, elapsedTime / animTime);

            Color c = roomClearText.color;
            c.a = value;
            roomClearText.color = c;

            yield return null;
        }
    }

    public void TakeDamage(int damage)
    {
        hearts[heartsIndex].stairs--;
        heartsImage[heartsIndex].sprite = heartSprites[hearts[heartsIndex].stairs];

        if (hearts[heartsIndex].stairs == 0)
            heartsIndex--;

        if (heartsIndex < 0)
            GameManager.Instance.EndGamePanel();
    }
}
