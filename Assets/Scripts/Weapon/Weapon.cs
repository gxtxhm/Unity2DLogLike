using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;


public abstract class Weapon : MonoBehaviour
{
    public WeaponType type;
    // Action 으로 shoot, reload 등록
    [SerializeField]
    protected WeaponData weaponData;

    public string Name;

    public int curAmmo { get; protected set; }
    public int maxAmmo { get; protected set; }

    protected float reloadTime;

    [SerializeField]
    protected GameObject Muzzle;

    public Sprite weaponSprite;

    protected GameObject bulletPrefab;

    public float FireRate { get; protected set; }

    public bool IsReloading = false;

    public bool CanShoot() { return curAmmo > 0; }

    public virtual void Init()
    {
        Name = weaponData.Name;
        maxAmmo = weaponData.maxAmmo;
        curAmmo = maxAmmo;
        reloadTime = weaponData.reloadTime;
        FireRate = weaponData.FireRate;
        weaponSprite = weaponData.weaponSprite;
        bulletPrefab = weaponData.bulletPrefab;
        type = weaponData.type;
    }
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

        curAmmo = maxAmmo;
        WeaponManager.Instance.ReloadSlider.gameObject.SetActive(false);
        IsReloading = false;
        GameManager.Instance.bulletText.text = $"{curAmmo}/{maxAmmo}";
    }
}
