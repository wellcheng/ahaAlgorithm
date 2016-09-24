//: Playground - noun: a place where people can play

import Cocoa

// 先给出城市地图（有向图）的邻接矩阵表示
// Max = 999 表示不可到达
let MaxDIS = 999
var MinDIS = 0  // 已经找到的最短路径

let cityMap = [
    [0, 2, 4, MaxDIS, 10],
    [2, 0, 3, MaxDIS, 7],
    [4, 3, 0, 4, 3],
    [MaxDIS, MaxDIS, 4, 0, 5],
    [10, 7, 3, 5, 0],
]

// 记录已经走过的点
var book = [1, 0, 0, 0, 0]

var resultDis = [-1, -1, -1, -1]


/// 返回从当前城市到达终点城市的路径
///
/// - parameter curCity: 当前城市
/// - parameter desCity: 终点城市
///
/// - returns: 所需距离
func dfsCurrentCity(curCity: Int, desCity: Int) -> Int {
    
    // 从当前城市到达终点的最短距离
    var minDis = MaxDIS
    print("->> cur -> des: \(curCity) -> \(desCity)")
    
    let dis = resultDis[curCity]
    if dis > 0 {
        print("already get : \(curCity) to 4 = \(dis)")
        return dis
    }
    
    // 边界条件，如果是自己找自己，那么返回 0
    if curCity == desCity {
        print("zhao zi ji")
        return 0
    }
    

    // 找到从当前城市所能到达的城市
    // 并且该点不能被访问过
    var result = [Int : Int]()
    for nextCity in 0...4 where cityMap[curCity][nextCity] != MaxDIS && book[nextCity] == 0 {
        print("\tbook:\(book)")
        print("\tcur -> next: \(curCity) -> \(nextCity)")
        
        // 如果下一个点就是终点，能直达，那么算出直达的距离
        if nextCity == desCity {
            result[nextCity] = cityMap[curCity][nextCity]
            print("\t\tzhida: \(cityMap[curCity][desCity])")
        } else {
            // 尝试这些还没走过的中间点，看从这些中间点走到终点需要多少路径
            book[nextCity] = 1
            let distance = dfsCurrentCity(curCity: nextCity, desCity: desCity)
            if distance != MaxDIS {
                // 得到当前点从下个点出发时的距离
                print("\t\t(cur:\(curCity),next:\(nextCity) = \(cityMap[curCity][nextCity])) + \(distance) to 4 = All: \(distance + cityMap[curCity][nextCity])")
                result[nextCity] = distance + cityMap[curCity][nextCity]
            }
            book[nextCity] = 0
        }
    }
    print("compare result\(result)")
    for res in result.keys {
        if result[res]! < minDis {
            minDis = result[res]!
        }
    }
    print("get cur:\(curCity) to des:4 = \(minDis)\n\n")
    result[curCity] = minDis
    return minDis
}


let distance = dfsCurrentCity(curCity: 0, desCity: 4)

