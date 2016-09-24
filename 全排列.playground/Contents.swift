//: Playground - noun: a place where people can play

import Cocoa

var str = "Hello, playground"

func fullArray(number: String) -> [String]{
    if number.characters.count <= 1 {
        return [number]
    }
    
    var res = [String]()
    
    // 取每一个字符，然后让剩下的全排列
    for index in 0..<number.characters.count {
        let prechar = number[number.startIndex.advancedBy(index)]
        print("\nprechar: \(prechar) from : \(number)")
        
        // other
        let otherLeft = number.substringWithRange(number.startIndex..<number.startIndex.advancedBy(index))
        print("otherLeft: \(otherLeft)")
        
        let otherRight = number.substringWithRange(number.startIndex.advancedBy(index + 1)..<number.endIndex)
        print("otherRight: \(otherRight)")
        
        for item in fullArray(otherLeft + otherRight) {
            print("\(prechar) + \(item)")
            res.append(String(prechar) + item)
            
        }
    }
    return res
}

fullArray("1234")


