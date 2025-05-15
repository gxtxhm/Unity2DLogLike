using AStar;
using System.Collections;
using System.Collections.Generic;
using Unity.VisualScripting;
using UnityEngine;
using UnityEngine.Events;
using UnityEngine.UI;

public class Monster : MonoBehaviour
{
    int hp=100;
    Animator animator;
    Slider slider;
    GameObject target;

    float moveSpeed = 4.0f;

    [SerializeField]
    bool check;


    public UnityAction OnDeadEvent;

    public RoomController roomController;

    PlayerController player;

    [SerializeField]
    GameObject muzzle;

    [SerializeField]
    float FireRate;

    bool[,] map;

    (int, int)[] path;

    Coroutine co;

    bool isDead = false;

    bool battleStart = false;

    bool canShoot = true;

    void Start()
    {
        animator = GetComponent<Animator>();
        slider = GetComponentInChildren<Slider>();
        target = GameManager.Instance.pc.gameObject;
    }

    public void Init(RoomController rc)
    {
        roomController = rc;
        OnDeadEvent += ()=> { StartCoroutine(Dead()); };
        player = GameManager.Instance.pc;
        GameManager.Instance.OnEndGame += () => { StartCoroutine(Dead()); };
    }

    // Update is called once per frame
    void Update()
    {
        
        if (battleStart == false) return;
        if (canShoot == false) return;
        if (isDead) return;

        Vector2 dir = player.transform.localPosition - transform.localPosition; // 방향 벡터
        float angle = Mathf.Atan2(dir.y, dir.x) * Mathf.Rad2Deg; // 라디안 → 도

        
        muzzle.transform.rotation = Quaternion.Euler(0, 0, angle + 180);
        StartCoroutine(Co_Shoot());
    }

    void Shoot()
    {
        //Debug.Log("Monster Shoot");
        GameObject bullet = PoolingManager.Instance.GetItem(PoolingType.ArrowBullet);
        bullet.transform.position = muzzle.transform.position;
        float angle = muzzle.transform.eulerAngles.z + 90;
        if (angle < 0) angle += 360;
        
        bullet.transform.rotation = Quaternion.Euler(0, 0, angle);
        bullet.GetComponent<Bullet>().InitBullet(muzzle.transform.eulerAngles.z);
        bullet.SetActive(true);
    }

    IEnumerator Co_Shoot()
    {
        canShoot = false;
        Shoot();
        yield return new WaitForSeconds(FireRate);
        canShoot = true;
    }

    public void StartBattle(bool[,] m)
    {
        map = m;
        StartCoroutine(FindPathRoutine());
        battleStart = true;
    }

    async void pathFinding()
    {
        if(isDead) return;
        Vector3 pos = GameManager.Instance.pc.gameObject.transform.localPosition;
        
        path = await AStarPathfinding.GeneratePath(
            Mathf.RoundToInt(pos.x), Mathf.RoundToInt(pos.y), Mathf.RoundToInt(transform.localPosition.x), Mathf.RoundToInt(transform.localPosition.y), map);

        if (path == null || path.Length == 0)
        {
            Debug.LogWarning("Path is empty or null!");
            
            return;
        }
        co = StartCoroutine(FollowPath());
    }

    IEnumerator FindPathRoutine()
    {
        while(true)
        {
            if (isDead) break;
            pathFinding();
            
            yield return new WaitForSeconds(0.3f);
            if(co!=null)
                StopCoroutine(co);
        }
        
    }

    IEnumerator FollowPath()
    {
        if (path == null) yield break;
        foreach (var point in path)
        {
            
            Vector2 targetPosition = new Vector2(point.Item1, point.Item2);
            targetPosition += new Vector2(roomController.transform.position.x, roomController.transform.position.y);
            
            while (Vector2.Distance(transform.position, targetPosition) > 0.01f)
            {
                if (isDead) break;
                transform.position = Vector2.MoveTowards(
                    transform.position,
                    targetPosition,
                    moveSpeed * Time.deltaTime * 0.4f
                );
                yield return null; 
            }

            transform.position = targetPosition;
            transform.localPosition = targetPosition - new Vector2(roomController.transform.position.x, roomController.transform.position.y);
            
            yield return null;
        }
    }

    public void TakeDamage(int damage)
    {
        if(isDead) return;
        hp-=damage;
        if (hp <= 0) { StopAllCoroutines(); OnDeadEvent?.Invoke(); }
        slider.value = hp / 100.0f;
    }

    IEnumerator Dead()
    {
        if (isDead) yield break;
        isDead = true;
        animator.Play("Dead");
        yield return new WaitForSeconds(0.55f);
        gameObject.SetActive(false);
    }
}
