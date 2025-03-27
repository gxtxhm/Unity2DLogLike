using System.Linq;
using System.Collections.Generic;
using UnityEngine;

[CreateAssetMenu(menuName = "Database/Weapon Database")]
public class WeaponDatabase : ScriptableObject
{
    public List<WeaponEntry> weapons;

    [System.Serializable]
    public class WeaponEntry
    {
        public WeaponType type;
        public GameObject prefab;
    }

    public GameObject GetWeapon(WeaponType type)
    {
        return weapons.FirstOrDefault(w => w.type == type)?.prefab;
    }

    public GameObject RandomCreateWeapon()
    {
        int index = Random.Range(0, weapons.Count);
        GameObject weapon = Instantiate(weapons[index].prefab);
        return weapon;
    }
}
