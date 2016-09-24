//: Playground - noun: a place where people can play

import UIKit


enum Pipe {
    case U_L
    case U_R
    case U_D
    case R_D
    case L_D
    case L_R
    case ERR
}

enum Direction {
    case Up
    case Down
    case Left
    case Right
    
    // 根据进水口和 pipe 类型，判断流出口
    func outDirectionByPipe(pipe: Pipe) -> [Direction] {
        switch self {
        case .Up, .Down:
            if pipe == .U_L || pipe == .U_R || pipe == .L_D || pipe == .R_D {
                return [.Left, .Right]
            } else if pipe == .L_R || pipe == .U_D {
                return self == .Down ? [.Down] : [.Up]
            }
        case .Left, .Right:
            if pipe == .U_L || pipe == .U_R || pipe == .L_D || pipe == .R_D {
                return [.Up, .Down]
            } else if pipe == .L_R || pipe == .U_D {
                return self == .Left ? [.Left] : [.Right]
            }
        }
        return []
    }
    
    func nextPoint(x:Int, y:Int) -> (Int, Int) {
        switch self {
        case .Up:
            return (x - 1, y)
        case .Down:
            return (x + 1, y)
        case .Left:
            return (x, y - 1)
        case .Right:
            return (x, y + 1)
        }
    }
}

var map: [[Pipe]] = [
    [.L_R, .L_D, .L_R, .L_D],
    [.U_R, .L_R, .L_D, .ERR],
    [.R_D, .L_D, .L_R, .U_R],
    [.U_D, .U_R, .U_R, .U_D],
    [.U_R, .L_R, .L_R, .U_R]
]

var book = [
    [0,0,0,0],
    [0,0,0,0],
    [0,0,0,0],
    [0,0,0,0],
    [0,0,0,0],
]



func dfs(map: [[Pipe]],
         startDirect sd:Direction,
                     _ start: (x:Int, y:Int),
           endDirect ed:Direction,
                  _ end: (x:Int, y:Int)){
    
    // 如果当前处理的点正好是终点，并且当前点的流入状态也与终点需要的流入一致
    print("Cur -> \(start) : \(sd)")
    if start == end && sd == ed{
        print(" ********* \(book) ")
        return
    }
    
    // 当前的点超出了范围
    if start.x < 0 || start.x > 4 || start.y < 0 || start.y > 3 {
        print("--- out ---")
        return
    }
    
    if book[start.x][start.y] == 1 {
        print("--- use ---")
        return
    }
    
    // 当前需要旋转的水管
    let curPipe = map[start.x][start.y]
    
    let dires = sd.outDirectionByPipe(curPipe)
    print("\t \(curPipe) : \(dires)")
    
    if dires.isEmpty {
        // 当前水管不能够响应这个流水方向
        print("+++ nul +++")
        return
    }
    
    book[start.x][start.y] = 1
    print("-> \(book)")
    // 对于找到的方向, 递归
    for dire in dires {
        print("\n\n")
        dfs(map, startDirect: dire, dire.nextPoint(start.x, y: start.y), endDirect: ed, end)
    }
    book[start.x][start.y] = 0
    print("<- \(book)")
}

dfs(map, startDirect: .Right, (0, 0), endDirect: .Right, (4, 4))


















