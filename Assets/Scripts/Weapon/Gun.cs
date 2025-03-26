using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Gun : Weapon
{
    public override void Init()
    {
        Name = "Gun";
        maxBulletCount = 10;
        curBulletCount = maxBulletCount;
        reloadTime = 0.8f;
        ShootSpeed = 0.2f;
    }

    public override void Reload()
    {
        StartCoroutine("CoReload");
    }

    public override void Shoot()
    {
        if (IsReloading) return;
        curBulletCount--;
        GameObject go = Instantiate(bulletPrefab, Muzzle.transform.position,
            Quaternion.Euler(0, 0, gameObject.transform.parent.eulerAngles.z - 90));
        if (curBulletCount == 0)
            Reload();
    }

}
