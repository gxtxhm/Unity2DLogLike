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
        base.Shoot();
        curAmmo--;
        GameObject bullet = PoolingManager.Instance.GetItem(PoolingType.RifleBullet);
        bullet.transform.position = Muzzle.transform.position;
        bullet.transform.rotation = Quaternion.Euler(0, 0, gameObject.transform.parent.eulerAngles.z - 90);
        bullet.GetComponent<Bullet>().InitBullet(gameObject.transform.parent.eulerAngles.z - 90);
        bullet.SetActive(true);
        //GameObject go = Instantiate(bulletPrefab, Muzzle.transform.position,
        //Quaternion.Euler(0, 0, gameObject.transform.parent.eulerAngles.z - 90));
        if (curAmmo == 0)
            Reload();
    }

    public override void Reload()
    {
        base .Reload();
        StartCoroutine(CoReload());
    }
}
