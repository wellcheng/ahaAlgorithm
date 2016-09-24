//: Playground - noun: a place where people can play

import UIKit

//
let n = 3
var box: [Int] = Array(count: 3, repeatedValue: 0)

var book: [Int] = Array(count: 3, repeatedValue: 0)

func dfs(step: Int) {
    
    // 边界，第 n 个盒子，说明 0...n-1 已经放入了 poke
    if step == n {
        print("\tone answer: \(box)")
        return
    }
    
    // 此时应该查看所有的牌，看哪一张在手上
    for i in 0...n-1 {
        // 判断扑克在手上吗
        print("poke in hand \(book) step : \(step) time: \(i)")
        if book[i] == 0 {
            
            box[step] = i
            print("set poke \(i) in box setp \(step)")
            
            book[i] = 1
            dfs(step + 1)
            
            print("get poke \(i) step : \(step) time: \(i)")
            // 收回刚才的牌，再次进入下次尝试
            book[i] = 0
            
        } else {
            //            print("poke \(i) already use")
        }
    }
}

dfs(0)





