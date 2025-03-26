using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;


public abstract class Weapon : MonoBehaviour
{
    // Action 으로 shoot, reload 등록

    public string Name = "Weapon";

    public int curBulletCount { get; protected set; }
    public int maxBulletCount { get; protected set; }

    protected float reloadTime;

    [SerializeField]
    protected GameObject Muzzle;

    [SerializeField]
    public Sprite weaponSprite;

    [SerializeField]
    protected GameObject bulletPrefab;

    //[SerializeField]
    public float ShootSpeed { get; protected set; }

    public bool IsReloading = false;

    public bool CanShoot() { return curBulletCount > 0; }

    public abstract void Init();
    public abstract void Shoot();
    public abstract void Reload();

    protected IEnumerator CoReload()
    {
        IsReloading = true;
        WeaponManager.Instance.ReloadSlider.gameObject.SetActive(true);
        float elaspedTime = 0;
        float duration = 1;

        while (elaspedTime < duration)
        {
            elaspedTime += Time.deltaTime;
            WeaponManager.Instance.ReloadSlider.value = Mathf.Lerp(0, 1, elaspedTime / duration);

            yield return null;
        }

        curBulletCount = maxBulletCount;
        WeaponManager.Instance.ReloadSlider.gameObject.SetActive(false);
        IsReloading = false;
        GameManager.Instance.bulletText.text = $"{curBulletCount}/{maxBulletCount}";
    }
}
