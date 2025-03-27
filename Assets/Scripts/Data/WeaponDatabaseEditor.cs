#if UNITY_EDITOR
using System.Collections.Generic;
using UnityEditor;
using UnityEngine;

public class WeaponDatabaseEditor
{
    [MenuItem("Tools/Update Weapon Database")]
    public static void UpdateWeaponDatabase()
    {
        string[] guids = AssetDatabase.FindAssets("t:Prefab", new[] { "Assets/Prefabs/Weapon" });
        var weaponList = new List<WeaponDatabase.WeaponEntry>();

        foreach (string guid in guids)
        {
            string path = AssetDatabase.GUIDToAssetPath(guid);
            GameObject prefab = AssetDatabase.LoadAssetAtPath<GameObject>(path);

            Weapon weapon = prefab.GetComponent<Weapon>();
            if (weapon != null)
            {
                weaponList.Add(new WeaponDatabase.WeaponEntry
                {
                    type = weapon.GetWeaponData().type,
                    prefab = prefab
                });
            }
        }

        WeaponDatabase database = AssetDatabase.LoadAssetAtPath<WeaponDatabase>("Assets/Database/WeaponDatabase.asset");
        if (database != null)
        {
            database.weapons = weaponList;
            EditorUtility.SetDirty(database);
            AssetDatabase.SaveAssets();
            Debug.Log("WeaponDatabase updated!");
        }
        else
        {
            Debug.LogError("WeaponDatabase.asset not found!");
        }
    }
}
#endif
