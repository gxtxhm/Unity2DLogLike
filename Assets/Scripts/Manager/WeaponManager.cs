using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class WeaponManager
{
    public static WeaponManager Instance { get; private set; }=new WeaponManager();

    public List<Weapon> weaponList = new List<Weapon>();

    int curIndex=0;

    
    public Slider ReloadSlider;

    WeaponManager()
    {

    }

    public void Init()
    {
        ReloadSlider = GameManager.Instance.pc.GetComponentInChildren<Slider>();
        ReloadSlider.gameObject.SetActive(false);
    }

    public void AddWeapon(Weapon weapon)
    {
        weaponList.Add(weapon);
        weapon.Init();
    }

    public Weapon GetCurWeapon()
    {
        return weaponList[curIndex];
    }

    public Weapon SwapWeapon()
    {
        if (weaponList.Count <= 1) return null;
        weaponList[curIndex].gameObject.SetActive(false);
        curIndex = (curIndex + 1)%weaponList.Count;
        weaponList[curIndex].gameObject.SetActive(true);
        return weaponList[curIndex];
    }
}
