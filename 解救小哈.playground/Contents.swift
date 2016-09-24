//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

// end
let p = 3
let q = 2

// map
let n = 5
let m = 4

var min = Int(INT_MAX)

let map: [[Int]] = [
    [0,0,1,0],
    [0,0,0,0],
    [0,0,1,0],
    [0,1,0,0],
    [0,0,0,1],
]

struct MyVariables {
    static var book: [[Int]] = [
        [1,0,0,0],
        [0,0,0,0],
        [0,0,0,0],
        [0,0,0,0],
        [0,0,0,0],
        ]
}

let next:[[Int]] = [
    [0, 1], // you
    [1, 0],
    [0, -1],
    [-1, 0],
]


/**
 dfs 只考虑当前这步应该怎么办
 
 - parameter curX: 当前点的 x
 - parameter curY: 当前点的 y
 - parameter step: 已经走过的步数
 */
func dfs(curX: Int, curY: Int, step: Int) {
    // 首先判断是不是已经找到
    if curX == p && curY == q {
        // 如果当前这条路的总路径要比之前的小，更新
        print("------ book:\(MyVariables.book)")
        if step < min {
            min = step
        }
        return
    }
    
    // 
    for k in 0...3 {
        // 计算下一步的坐标
        let tx = curX + next[k][0]
        let ty = curY + next[k][1]
//        adf
        print("C ->\(curX,curY) N -> \(tx, ty)")
        // 判断是否越界
        if tx < 0 || ty < 0 || tx >= 5 || ty >= 4{
            print("||")
            continue
        }
        
        // 如果不是障碍或者标记点
        if map[tx][ty] == 0 && MyVariables.book[tx][ty] == 0{
            
            MyVariables.book[tx][ty] = 1
            dfs(tx, curY: ty, step: step + 1)
            MyVariables.book[tx][ty] = 0
        }else {
            print("💩")
        }
    }
}





dfs(0, curY: 0, step: 0)




