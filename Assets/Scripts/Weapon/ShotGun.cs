using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ShotGun : Weapon
{
    public override void Init()
    {
        base.Init();
    }

    public override void Reload()
    {
        base.Reload();
        StartCoroutine("CoReload");
    }

    public override void Shoot()
    {
        if (IsReloading) return;
        base.Shoot();
        curAmmo--;

        float spreadAngle = 10;
        float ammoCnt = 5;
        float centerOffset = (ammoCnt - 1) / 2f;

        for (int i = 0; i < ammoCnt; i++)
        {
            float angle = gameObject.transform.parent.eulerAngles.z - 90
                          + (i - centerOffset) * spreadAngle;

            GameObject bullet = PoolingManager.Instance.GetItem(PoolingType.ShotGunBullet);
            bullet.transform.position = Muzzle.transform.position;
            bullet.transform.rotation = Quaternion.Euler(0, 0, angle);
            bullet.GetComponent<Bullet>().InitBullet(angle);
            bullet.SetActive(true);
            //bullet.SetActive(true);
        }


        //GameObject go = Instantiate(bulletPrefab, Muzzle.transform.position,
        //    Quaternion.Euler(0, 0, gameObject.transform.parent.eulerAngles.z - 90));
        if (curAmmo == 0)
            Reload();
    }

}
