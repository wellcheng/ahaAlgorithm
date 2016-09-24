//: Playground - noun: a place where people can play

import UIKit

extension String {
    
    subscript (i: Int) -> Character {
        return self[self.startIndex.advancedBy(i)]
    }
    
    subscript (i: Int) -> String {
        return String(self[i] as Character)
    }
    
    subscript (r: Range<Int>) -> String {
        let start = startIndex.advancedBy(r.startIndex)
        let end = start.advancedBy(r.endIndex - r.startIndex)
        return self[Range(start ..< end)]
    }
}


func palindrome(string: String) -> Bool {
    
    var str = string
    
    let length = string.characters.count
    if length % 2 != 0 {
        // get mid char of string ,and remove it
        let mid = length / 2
        str = string[0..<mid] + str[(mid + 1)..<length]
    }
    
    let len = str.characters.count
    let mid = len / 2
    
    // get top half string, push to stack
    var stackStr: [String] = []
    for index in 0..<mid {
        stackStr.append(str[index])
    }
    
    // compare 
    for comIndex in mid..<len {
        
        if stackStr.count <= 0 {
            return false
        }
        if stackStr.removeLast() != str[comIndex] {
            return false
        }
    }
    
    return true
}


print(palindrome("([(([("))


