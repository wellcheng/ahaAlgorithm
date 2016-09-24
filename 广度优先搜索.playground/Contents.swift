//: Playground - noun: a place where people can play

import UIKit

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


// 节点，以及节点的坐标，该节点多少步可到达


struct Node {
    var x: Int
    var y: Int
    var step: Int
    var father: Int
    
}



func hfs() {
    
    var queue: [Node] = Array(count: 30, repeatedValue: Node(x: 0, y: 0, step: 0, father: 0))
    
    // 队首队尾都是 1
    var head = 1
    var tail = 1
    
    // 入口坐标
    queue[tail].x = 0
    queue[tail].y = 0
    queue[tail].step = 0
    queue[tail].father = 0
    tail += 1
    
    // 标记入口坐标
    MyVariables.book[0][0] = 1
    
    // flag
    var flag = 0
    
    // init
    var tx = 0
    var ty = 0
    
    
    
    // 队列不为空
    while head < tail {
        for k in 0...3 {
            tx = queue[head].x + next[k][0]
            ty = queue[head].y + next[k][1]
            print("N -> \(tx, ty)")
            
            if tx < 0 || tx > 4 || ty < 0 || ty > 3 {
                // 换个方向
                print("💩")
                continue
            }
            
            // 
            if map[tx][ty] == 0 && MyVariables.book[tx][ty] == 0 {
//                astop
                print("  -> ADD")
                // 拓展一个点
                MyVariables.book[tx][ty] = 1
                queue[tail].x = tx
                queue[tail].y = ty
                queue[tail].father = head
                queue[tail].step = queue[head].step + 1
                tail += 1
            }else {
                print(" -> 【】")
            }
            
            // 看当前拓展点是不是目标点
            if tx == 3 && ty == 2 {
                print("--------------------")
                flag = 1
                // 退出当前正在拓展的点
                break
            }
        }
        
        if flag == 1 {
            break
        }
        
        print("D -> \(queue[head])\n")
        head += 1
    }
    for item in 0..<queue.count {
        print(queue[item])
    }
    
}


hfs()


print(MyVariables.book)





















