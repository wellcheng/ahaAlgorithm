//: Playground - noun: a place where people can play

import Cocoa

let MAX = 99999999
// 原始的信息
var map = [
    [0,2,6,4],
    [MAX,0,3,MAX],
    [7,MAX,0,1],
    [5,MAX,12,0]
]

// 从 i 顶点到 j 顶点，通过中间的 k 顶点，求最短路径
func floyd_warshall() {
    
    for k in 0...3 {
        for i in 0...3 {
            for j in 0...3 {
                // 对从 i -> j 这条路，尝试使用 k 作为中转，看是否能够获得最短路径
                let dis = map[i][k] + map[k][j]
                if map[i][j] > dis{
                    map[i][j] = dis
                }
            }
        }
    }
    
    print("Map:\n\(map)")
}
//floyd_warshall()


// ----------------------- 递归写法

// 递归写法
// 对于 i -> j 的最短路径，如果以 1..k 为中间点，得到最短路径，设 D(i,j,k)
// 那么，这里有两种决策：
// 1: 对于 i，j 两点，其最短路径不需要经过 k 点
// 问题层级降下来，两点的最短路径为 D(i,j,k - 1)
//
// 2: 对于 i，j 两点，其最短路径需要经过 k 点
// 问题降低层次，i，j 两点最短路径为，i 到 k 点最短 + k 到 j 点最短
// D(i,k,k-1) + D(k,j,k-1)
// 
// 最终结果为两种决策中最小的一个

var preCnt = 0


func floyd_warshall_recursive(startPoint start:Int, endPoint end:Int, midPoint k: Int) -> Int {
    
    var preStr = ""
    if preCnt >= 1 {
        for _ in 1...preCnt {
            preStr += "  "
        }
    }
    
    
    print("\(preStr)\(start) -> \(end) by \(k)")
    
//    if start == end {
//        return 0
//    }
//    
    // 边界条件, 当前的中转节点只有一个 k
    if k == 0 {
        let dis = map[start][k] + map[k][end]
        if  dis < map[start][end] {
            print("\(preStr): dis = \(dis)")
            return dis
        } else {
            print("\(preStr): cur = \(map[start][end])")
            return map[start][end]
        }
    }
    // 决策 1
    preCnt += 1
    let decision_1 =
        floyd_warshall_recursive(startPoint: start, endPoint: end, midPoint: k - 1)
    preCnt -= 1
    
    // 决策 2
    preCnt += 1
    let decision_2 =
        floyd_warshall_recursive(startPoint: start, endPoint: k, midPoint: k - 1) +
        floyd_warshall_recursive(startPoint: k, endPoint: end, midPoint: k - 1)
    preCnt -= 1
    
    return min(decision_1, decision_2)
}

floyd_warshall_recursive(startPoint: 0, endPoint: 3, midPoint: 3)

//var shortMap = Array(repeating: [0,0,0,0], count: 4)
//for i in 0...3 {
//    for j in 0...3 {
//        shortMap[i][j] = floyd_warshall_recursive(startPoint: i, endPoint: j, midPoint: 3)
//    }
//}
//print(shortMap)
//
