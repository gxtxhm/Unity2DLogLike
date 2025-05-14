using UnityEngine;

public class MinimapCamera : MonoBehaviour
{
    public Transform player; // �÷��̾� Transform
    public float height = 50f; // ī�޶� ����

    void LateUpdate()
    {
        // �÷��̾� ��ġ�� ���� ī�޶� �̵�
        Vector3 newPosition = player.position;
        newPosition.z = -10;
        transform.position = newPosition;

        // (����) �÷��̾� ���⿡ ���� ȸ��
        //transform.rotation = Quaternion.Euler(90f, player.eulerAngles.y, 0f);
    }
}