using UnityEngine;

public class MinimapCamera : MonoBehaviour
{
    public Transform player; // 플레이어 Transform
    public float height = 50f; // 카메라 높이

    void LateUpdate()
    {
        // 플레이어 위치를 따라 카메라 이동
        Vector3 newPosition = player.position;
        newPosition.z = -10;
        transform.position = newPosition;

        // (선택) 플레이어 방향에 따라 회전
        //transform.rotation = Quaternion.Euler(90f, player.eulerAngles.y, 0f);
    }
}