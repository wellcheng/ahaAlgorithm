//: Playground - noun: a place where people can play

import Cocoa


let n = 5   // 顶点个数
let m = 7   // 边的数量

let MAX = 99999999

//graphAdjacencyList
let edgeArr = [
    [0, 1, 2],
    [0, 3, 10],
    [1, 2, 3],
    [1, 4, 7],
    [2, 3, 4],
    [3, 4, 5],
    [4, 2, 6],
]

// 最短路径数组
var dis = Array(repeating: MAX, count: n)

// 优化队列
var queue:[Int] = []
var book = Array(repeating: -1, count: n)


// 邻接表建立
var first = Array(repeating: -1, count: n)
var next = Array(repeating: -1, count: m)

for edgeID in 0...m - 1  {
    next[edgeID] = first[edgeArr[edgeID][0]]
    first[edgeArr[edgeID][0]] = edgeID
}

print("first -> \(first)")
print("next  -> \(next)")


// 顶点 0 入队，开始从顶点 0 松弛
queue.append(0)
dis[0] = 0

// 队列不为空时一直循环，不为空说明一直有新的边被松弛后更新了其路径
while queue.count > 0 {
    // 获取当前需要处理的顶点
    let curVertex = queue.first!
    
    // 当前顶点的第一条边
    var firstEdgeID = first[curVertex]
    
    // 遍历从该顶点出发的所有边
    while firstEdgeID != -1 {
        let u = edgeArr[firstEdgeID][0] // 起点
        let v = edgeArr[firstEdgeID][1] // 终点
        let w = edgeArr[firstEdgeID][2] // 权重
        print("handle edge \(firstEdgeID) : (\(u),\(v),\(w))")
        
        if dis[v] > dis[u] + w {
            // 如果顶点 U 通过这条边松弛到顶点 V
            dis[v] = dis[u] + w
            
            print("Success : \(dis)")
            // 顶点 V 的路径发生了变化，需要加入队列
            if !queue.contains(v) {
                queue.append(v)
                print("Add \(v) to Queue : \(queue)")
            }
        }
        // 循环处理下一条边
        firstEdgeID = next[firstEdgeID]
    }
    
    // 当前顶点已经处理完毕，换下一个
    queue.removeFirst()
}

// 
print(dis)


// 原本的 Bellman-ford 算法，是进行 n - 1 轮，每一轮松弛得到从源点通过 i 条边能够到达的最短路径
// 可以优化的地方在于，如果在上一轮中，源点到该点的路径没有发生变化，就不用去松弛该点了
// Dijkstra 算法是深度优先的，因此如果出现负权路径，会导致后向性
// Bellman-Ford 算法是 BFS ，因此解决了这个问题






