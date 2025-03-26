using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class Rifle : Weapon
{

    public override void Init()
    {
        Name = "Rifle";
        maxBulletCount = 20;
        curBulletCount = maxBulletCount;
        reloadTime = 1.0f;
        ShootSpeed = 0.1f;
    }

    public override void Shoot()
    {
        if (IsReloading) return;
        curBulletCount--;
        GameObject go = Instantiate(bulletPrefab, Muzzle.transform.position,
            Quaternion.Euler(0, 0, gameObject.transform.parent.eulerAngles.z - 90));
        if(curBulletCount == 0)
            Reload();
    }

    public override void Reload()
    {
        StartCoroutine(CoReload());
    }
}
