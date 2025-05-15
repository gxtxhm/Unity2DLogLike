using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using UnityEngine.UIElements;


public abstract class Weapon : MonoBehaviour
{
    public WeaponType type;

    [SerializeField]
    AudioClip shotClip;
    [SerializeField]
    AudioClip reloadClip;
    [SerializeField]
    protected AudioSource audioSource;
    // TODO : Action 으로 shoot, reload 등록
    [SerializeField]
    protected WeaponData weaponData;

    public string Name;

    public int curAmmo { get; protected set; }
    public int maxAmmo { get; protected set; }

    protected float reloadTime;

    public float RotateZ;

    [SerializeField]
    protected GameObject Muzzle;

    public Sprite weaponSprite;
    public SpriteRenderer SpriteRenderer;

    protected GameObject bulletPrefab;

    public float FireRate { get; protected set; }

    public bool IsReloading = false;

    public bool CanShoot() { return curAmmo > 0; }

    public WeaponData GetWeaponData() { return weaponData; }

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
        RotateZ = weaponData.RotateZ;
        shotClip = weaponData.shotClip;
        reloadClip = weaponData.reloadClip;

        PoolingManager.Instance.AddInMap(bulletPrefab.GetComponent<Bullet>().poolingType, bulletPrefab);
        audioSource = GetComponentInParent<AudioSource>();
        
        SpriteRenderer = GetComponent<SpriteRenderer>();
    }
    public virtual void Shoot() { audioSource.PlayOneShot(shotClip); }
    public virtual void Reload() { audioSource.PlayOneShot(reloadClip); }

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
