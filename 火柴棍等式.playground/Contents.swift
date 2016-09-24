//: Playground - noun: a place where people can play

import Cocoa


// 假若手里有 m 火柴，m <= 24
// A + B = C
// 所有火柴全部都用上

// + 、= 各需要 2 根火柴，还剩最多 20 火柴，20 火柴最多组成 10 个 1
// 因此，A、B、C 任意都不能超过 1111

func getNumber(noun: Int) -> Int {
    var amount = 0
    let nounStr = String(noun)
    for char in nounStr.characters {
        switch char {
        case "0":
            amount += 6
        case "1":
            amount += 2
        case "2":
            amount += 5
        case "3":
            amount += 5
        case "4":
            amount += 4
        case "5":
            amount += 5
        case "6":
            amount += 6
        case "7":
            amount += 3
        case "8":
            amount += 7
        case "9":
            amount += 6
        default:
            amount += 0
        }
    }
    return amount
}


func game(items: Int) {
    let numberOfOne = items - 4 > 0 ? items / 2 : 0
    
    if numberOfOne == 0 {
        print("No result")
        return
    }
    
    var dights = numberOfOne / 3 + 1
    var max = 1.0
    while dights > 0 {
        print("dig: \(dights) max = \(max)")
        max += 1 * pow(10.0, Double(dights) - 1.0)
        dights -= 1
    }
    
    print("max = \(max)")
    
    for a in 0...Int(max) {
        for b in 0...Int(max) {
            let c = a + b
            // 分别获取数字需要的火柴数量
            if getNumber(a) + getNumber(b) + getNumber(c) == items - 4  {
                print("\(a) + \(b) = \(c)")
            }
        }
    }
}
game(14)
