using System;
using System.Collections;
using System.Collections.Generic;
using Unity.VisualScripting;
using UnityEngine;


public enum PoolingType
{
    GunBullet,
    RifleBullet,
    ShotGunBullet,
    ArrowBullet
}

public class PoolingManager : MonoBehaviour
{
    public static PoolingManager Instance;
    Dictionary<PoolingType, Queue<GameObject>> poolingMap;

    Dictionary<PoolingType, GameObject> prefabsMap;

    const int DefaultPoolSize = 20;

    private void Awake()
    {
        if (Instance == null)
            Instance = this;
        else
            Destroy(gameObject);

        poolingMap = new Dictionary<PoolingType, Queue<GameObject>>();
        prefabsMap = new Dictionary<PoolingType, GameObject>();
        DontDestroyOnLoad(gameObject);
    }


    public void AddInMap(PoolingType name, GameObject prefab)
    {
        if (poolingMap.ContainsKey(name))
        {
            Debug.Log($"already exists {name.ToString()} in poolingMap."); return;
        }
        poolingMap.Add(name, new Queue<GameObject>());
        prefabsMap.Add(name, prefab);
        for (int i = 0; i < DefaultPoolSize; i++)
        {
            GameObject go = Instantiate(prefab);
            go.SetActive(false);
            go.transform.SetParent(transform);
            poolingMap[name].Enqueue(go);
        }
    }

    public GameObject GetItem(PoolingType name)
    {
        if (poolingMap.ContainsKey(name) == false)
        {
            Debug.LogError($"no exist {name} in poolingMap."); return null;
        }

        if(poolingMap[name].Count == 0)
        {
            // if all used
            for (int i = 0; i < DefaultPoolSize; i++)
            {
                GameObject go = Instantiate(prefabsMap[name]);
                go.transform.SetParent(transform);
                go.SetActive(false);
                poolingMap[name].Enqueue(go);
            }
        }
        GameObject bullet = poolingMap[name].Dequeue();
        return bullet;
    }

    public void ReturnBullet(GameObject bullet,float delay =0)
    {
        StartCoroutine(CoReturnBullet(bullet,delay));
    }

    IEnumerator CoReturnBullet(GameObject bullet, float delay)
    {
        float elaspedTime = 0;
        while(elaspedTime<delay)
        {
            elaspedTime += Time.deltaTime;
            yield return null;
        }
        PoolingType poolingType = bullet.GetComponent<Bullet>().poolingType;
        bullet.SetActive(false);
        poolingMap[poolingType].Enqueue(bullet);
        bullet.transform.SetParent(transform);
    }
}
