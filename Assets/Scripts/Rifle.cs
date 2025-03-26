using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class Rifle : Weapon
{

    public override void Init()
    {
        maxBulletCount = 300;
        curBulletCount = maxBulletCount;
        reloadTime = 1.0f;

        // 나중에 무기 매니저만들어서 거기서 관리
        ReloadSlider = gameObject.transform.parent.GetComponentInParent<PlayerController>().reloadSlider;
        ReloadSlider.gameObject.SetActive(false);
    }

    public override void Shoot()
    {
        GameObject go = Instantiate(bulletPrefab, Muzzle.transform.position,
            Quaternion.Euler(0, 0, gameObject.transform.parent.eulerAngles.z - 90));
    }

    public override void Reload()
    {
        StartCoroutine(CoReload());
    }

    IEnumerator CoReload()
    {
        ReloadSlider.gameObject.SetActive(true);
        float elaspedTime = 0;
        float duration = 1;

        while(elaspedTime < duration)
        {
            elaspedTime += Time.deltaTime;
            ReloadSlider.value = Mathf.Lerp(0, 1, elaspedTime / duration);

            yield return null;
        }

        curBulletCount = maxBulletCount;
        ReloadSlider.gameObject.SetActive(false);
    }
}
