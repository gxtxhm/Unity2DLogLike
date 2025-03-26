using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class Rifle : Weapon
{

    public override void Init()
    {
        base.Init();
    }

    public override void Shoot()
    {
        if (IsReloading) return;
        curAmmo--;
        GameObject go = Instantiate(bulletPrefab, Muzzle.transform.position,
            Quaternion.Euler(0, 0, gameObject.transform.parent.eulerAngles.z - 90));
        if(curAmmo == 0)
            Reload();
    }

    public override void Reload()
    {
        StartCoroutine(CoReload());
    }
}
