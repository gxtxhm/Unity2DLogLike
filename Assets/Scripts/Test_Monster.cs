using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class Test_Monster : MonoBehaviour
{
    int hp=100;
    Animator animator;
    Slider slider;
    void Start()
    {
        animator = GetComponent<Animator>();
        slider = GetComponentInChildren<Slider>();
    }

    // Update is called once per frame
    void Update()
    {
        
    }

    public void TakeDamage(int damage)
    {
        hp-=damage;
        if (hp <= 0) { hp = 100; } //Destroy(gameObject, 1);
        slider.value = hp / 100.0f;
        //Debug.Log("hp:"+hp);
        //Debug.Log("slider:" + slider.value);
    }
}
