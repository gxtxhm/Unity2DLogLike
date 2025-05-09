using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Events;

public class ActionColliderTrigger : MonoBehaviour
{
    public UnityAction<Collider2D> triggerAction;

    private void OnTriggerEnter2D(Collider2D collision)
    {
        triggerAction?.Invoke(collision);
    }
}
