using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public enum WeaponType
{
    Rifle,
    Gun,
    ShotGun
}

[CreateAssetMenu(menuName = "Weapon Data")]
public class WeaponData : ScriptableObject
{
    public string Name;
    public int maxAmmo;

    public float FireRate;
    public float reloadTime;

    public Sprite weaponSprite;

    public GameObject bulletPrefab;
    public WeaponType type;

    public float RotateZ;

    public AudioClip shotClip;
    public AudioClip reloadClip;
}
