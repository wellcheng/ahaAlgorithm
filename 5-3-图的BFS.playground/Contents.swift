//: Playground - noun: a place where people can play

import Cocoa



// 使用邻接矩阵表示城市与航班
// 总共有 0-4 五个城市
// 每个城市之间是否有航班用 1 表示，否则用 -1 表示,城市自己本身之间用 0 表示
let airPlane = [
    [0, 1, 1, 1, -1],
    [1, 0, 1, 1, -1],
    [1, 1, 0, 1, 1],
    [1, 1, 1, 0, 1],
    [-1, -1, 1, 1, 0]
]


// 现在需要解决从城市 0 到城市 4，转机次数最少

/// 从起始城市到终点城市，返回转机的最小次数
///
/// - parameter startCity: 始发城市编号
/// - parameter endCity:   终点城市编号
func solve(startCity:Int , endCity:Int) {
    
    // no - 城市编号
    // count - 飞抵该城市时已经转机的次数
    var bfsQueue: [(no:Int,count:Int)] = []
    var book:[Int] = [0,0,0,0,0]
    
    // 从当前城市出发
    bfsQueue.append((startCity, 0))
    
    // 当前城市已经使用，标记下
    book[startCity] = 1
    
    var curCity = 0
    // 除非到达了终点城市，负责不断从当前城市开始拓展，看都能到达哪些城市
    while bfsQueue[curCity].no != endCity {
        
        // 遍历所有城市，看当前城市是否可达，并且不是已经路过的城市
        for city in 0...4 where city != curCity && airPlane[curCity][city] == 1 && book[city] == 0{
            bfsQueue.append((city, bfsQueue[curCity].count + 1))
            book[city] = 1
            print("\(curCity) want to \(city) : \(book)")

        }
        curCity += 1
    }
    
    print("right: \(bfsQueue) ")
    print("at least \(bfsQueue.last!.count) times from \(startCity) to \(endCity)")
    
}

solve(startCity: 0, endCity: 4)

// BFS 层层递进的搜索更适合每条边的权值都相同
// DFS 适合遍历所有可能，在遍历的时候，边的权值不同
