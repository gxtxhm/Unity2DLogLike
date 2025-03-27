using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Gun : Weapon
{
    public override void Init()
    {
        base.Init();
    }

    public override void Reload()
    {
        StartCoroutine("CoReload");
    }

    public override void Shoot()
    {
        if (IsReloading) return;
        curAmmo--;
        GameObject bullet = PoolingManager.Instance.GetItem(PoolingType.GunBullet);
        bullet.transform.position = Muzzle.transform.position;
        bullet.transform.rotation = Quaternion.Euler(0, 0, gameObject.transform.parent.eulerAngles.z - 90);
        bullet.GetComponent<Bullet>().InitBullet(gameObject.transform.parent.eulerAngles.z - 90);
        bullet.SetActive(true);
        if (curAmmo == 0)
            Reload();
    }

}
