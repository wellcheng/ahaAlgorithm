//: Playground - noun: a place where people can play

import Cocoa

// 迪科斯彻算法使用了广度优先搜索解决非负权有向图的单源最短路径问题，算法最终得到一个最短路径树。该算法常用于路由算法或者作为其他图算法的一个子模块。举例来说，如果图中的顶点表示城市，而边上的权重表示城市间开车行经的距离，该算法可以用来找到两个城市之间的最短路径。

let MAX = 9999999
var map = [
    [0,1,12,MAX,MAX,MAX,],
    [MAX,0,9,3,MAX,MAX,],
    [MAX,MAX,0,MAX,5,MAX,],
    [MAX,MAX,4,0,13,15],
    [MAX,MAX,MAX,MAX,0,4],
    [MAX,MAX,MAX,MAX,MAX,0,],
]

func Dijkstra(originPoint op: Int) -> [Int]{
    
    // init res result
    var res = Array(repeating: MAX, count: map.count)
    
    // 记录哪些点已经在 P 队列中，表示已经算出原始点到该点的最短路径
    var book = Array(repeating: 0, count: map.count)
    book[op] = 1
    
    
    // 初始化 res
    for point in 0...map.count - 1{
        res[point] = map[op][point]
    }
    
    print("res : \(res)")

    
    
    // 总共需要迭代 n - 1 次，除原点的所有点都需要迭代
    for time in 0...res.count - 1 {
        // 找到 Q 队列中距离原点最短的点
        var minPointValue = MAX
        var minPointIdx = 0
        
        for idx in 0...res.count - 1 where book[idx] == 0 && res[idx] != MAX {
            print("neast idx = \(idx)")
            if res[idx] < minPointValue {
                minPointValue = res[idx]
                minPointIdx = idx
            }
        }
        print("minPointIdx : \(minPointIdx)")
        book[minPointIdx] = 1
        
        // 通过该点开始拓展, 找该点能到达的点，并且在 Q 队列中
        for idx in 0...res.count - 1 where book[idx] == 0 && map[minPointIdx][idx] != MAX {
            let temp = res[minPointIdx] + map[minPointIdx][idx]
            print("minPoint \(minPointIdx) to \(idx) = \(temp)(\(op),\(minPointIdx),\(idx))")
            if res[idx] > temp {
               res[idx] = temp
                print("\t cur Res \(res)")
            }
            
        }
        
        print("-------------------")
    }
    
    return res
}

print(Dijkstra(originPoint: 0))