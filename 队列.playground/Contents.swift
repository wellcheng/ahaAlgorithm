//: Playground - noun: a place where people can play

import UIKit

func decrypt(qqNumber:[Int]) -> [Int] {
    var numbers = qqNumber
    var delNums:[Int] = []
    
    while numbers.count >= 2 {
        // delete front num
        delNums.append(numbers.removeFirst())
        
        // move the sencond num at end of numbers
        numbers.append(numbers.removeFirst())
    }
    
    if let lastNum = numbers.first {
        delNums.append(lastNum)
    }
    
    return delNums
}


let qq = [6,3,1,7,5,8,9,2,4]

print(decrypt(qq))


