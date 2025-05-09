using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using UnityEngine;

public class Kruscal
{
    public List<KruscalNode> rooms;

    public class KruscalNode
    {
        public int Id;
        public Vector2 Center;
    }

    public List<Edge> Run()
    {

        // 모든 edge 추가
        List<Edge> edges = new List<Edge>();

        for (int i = 0; i < rooms.Count; i++)
        {
            for(int j=i+1; j < rooms.Count; j++)
            {
                edges.Add(new Edge(rooms[i].Id, rooms[j].Id, Vector2.Distance(rooms[i].Center, rooms[j].Center)));
            }
        }

        edges.Sort();

        List<Edge> mst = new List<Edge>();
        UnionFind uf = new UnionFind(rooms.Count);
        foreach(Edge e in edges)
        {
            if(uf.Union(e.V1,e.V2))
                mst.Add(e);
        }
        return mst;
    }

}