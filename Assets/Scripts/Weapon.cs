using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;


public abstract class Weapon : MonoBehaviour
{
    protected int curBulletCount;
    protected int maxBulletCount;

    protected float reloadTime;

    [SerializeField]
    protected GameObject Muzzle;

    [SerializeField]
    protected Sprite weaponSprite;

    [SerializeField]
    protected GameObject bulletPrefab;

    
    protected Slider ReloadSlider;

    public abstract void Init();
    public abstract void Shoot();
    public abstract void Reload();
}
