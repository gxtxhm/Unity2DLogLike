using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using UnityEngine;

public class Edge : IComparable<Edge>
{
    public int V1, V2; // 방 ID
    public float Weight; // 가중치 (유클리드 거리)

    public Edge(int v1, int v2, float weight)
    {
        V1 = v1;
        V2 = v2;
        Weight = weight;
    }

    public int CompareTo(Edge other)
    {
        return Weight.CompareTo(other.Weight);
    }
}

public class UnionFind
{
    private int[] parent, rank;

    public UnionFind(int size)
    {
        parent = new int[size];
        rank = new int[size];
        for (int i = 0; i < size; i++)
        {
            parent[i] = i;
        }
    }

    int Find(int x)
    {
        if (parent[x] != x)
        {
            parent[x] = Find(parent[x]); // 경로 압축
        }
        return parent[x];
    }

    public bool Union(int x, int y)
    {
        int px = Find(x), py = Find(y);
        if (px == py) return false; // 이미 같은 집합 (사이클)
        if (rank[px] < rank[py]) parent[px] = py;
        else if (rank[px] > rank[py]) parent[py] = px;
        else
        {
            parent[py] = px;
            rank[px]++;
        }
        return true; // 연결 성공
    }
}