using AStar;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Events;
using UnityEngine.UI;

public class Test_Monster : MonoBehaviour
{
    int hp=100;
    Animator animator;
    Slider slider;
    GameObject target;

    float moveSpeed = 4.0f;

    public UnityAction OnDeadEvent;

    public RoomController roomController;

    bool[,] map;

    (int, int)[] path;

    Coroutine co;

    void Start()
    {
        animator = GetComponent<Animator>();
        slider = GetComponentInChildren<Slider>();
        target = GameManager.Instance.pc.gameObject;
    }

    public void Init(RoomController rc)
    {
        roomController = rc;
        OnDeadEvent += Dead;
    }

    // Update is called once per frame
    void Update()
    {
        
    }

    public void StartBattle(bool[,] m)
    {
        map = m;
        StartCoroutine(FindPathRoutine());
    }

    async void pathFinding()
    {
        Vector3 pos = GameManager.Instance.pc.gameObject.transform.localPosition;
        
        path = await AStarPathfinding.GeneratePath(
            Mathf.RoundToInt(pos.x), Mathf.RoundToInt(pos.y), Mathf.RoundToInt(transform.localPosition.x), Mathf.RoundToInt(transform.localPosition.y), map);

        if (path == null || path.Length == 0)
        {
            Debug.LogWarning("Path is empty or null!");
            pathFinding();
            return;
        }
        co = StartCoroutine(FollowPath());
    }

    IEnumerator FindPathRoutine()
    {
        while(true)
        {
            pathFinding();
            
            yield return new WaitForSeconds(0.3f);
            if(co!=null)
                StopCoroutine(co);
        }
        
    }

    IEnumerator FollowPath()
    {
        
        foreach (var point in path)
        {
            // 경로의 (x, y)를 월드 좌표로 변환
            Vector2 targetPosition = new Vector2(point.Item1, point.Item2);
            targetPosition += new Vector2(roomController.transform.position.x, roomController.transform.position.y);
            // 현재 위치에서 목표 위치까지 이동
            while (Vector2.Distance(transform.position, targetPosition) > 0.01f)
            {
                transform.position = Vector2.MoveTowards(
                    transform.position,
                    targetPosition,
                    moveSpeed * Time.deltaTime * 0.4f
                );
                yield return null; // 다음 프레임까지 대기
            }

            // 목표 위치에 정확히 도달하도록 설정
            transform.position = targetPosition;
            transform.localPosition = targetPosition - new Vector2(roomController.transform.position.x, roomController.transform.position.y);
            
            yield return null;
        }
    }

    public void TakeDamage(int damage)
    {
        hp-=damage;
        if (hp <= 0) { OnDeadEvent?.Invoke(); }
        slider.value = hp / 100.0f;
    }

    void Dead()
    {
        StopAllCoroutines();
        gameObject.SetActive(false);
    }
}
