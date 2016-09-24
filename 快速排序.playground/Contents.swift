//: Playground - noun: a place where people can play

import UIKit

func quickSort(array: [Int]) -> [Int] {
    var arr = array
    
    let left = 0
    let right = arr.count - 1
    
print("\n\nsort: \(arr)\n")
    // 左边游标都已经跑到右边去了，那么就是已经是排好序的
    if arr.count == 1 {
        print("only one returned")
        return arr
    }
    let basal = arr[left]
    var lCursor = left
    var rCursor = right
    
    // 当左右游标不相遇时，一直进行查找替换
    while lCursor != rCursor {
        while arr[rCursor] >= basal && lCursor < rCursor{
            // 右边的游标大于等于 base，并且左右游标不相遇时，右边的游标需要继续左移
            rCursor -= 1
        }
        print("rCursor = \(rCursor)")
        while arr[lCursor] <= basal && lCursor < rCursor {
            // 左边的游标持续右移
            lCursor += 1
        }
        print("lCursor = \(lCursor)")
        
        
        // 在这里，左右都找到了合适的值，当它们没有相遇时
        if lCursor < rCursor {
            let temp = arr[lCursor]
            arr[lCursor] = arr[rCursor]
            arr[rCursor] = temp
            print("swap:\(arr)\n")
        }
        
    }
    
    // 现在游标已经相遇，基数需要交换
    arr[left] = arr[rCursor]
    arr[rCursor] = basal
    print("swap:\(arr)\n")
    
    
    // 然后分别对左右两边进行排序
    if arr.count <= 2 {
        return arr
    }
    let leftArr = quickSort(Array(arr[left...lCursor-1]))
    let rightArr = quickSort(Array(arr[rCursor+1...right]))
    
    var resList: [Int] = []
    resList += leftArr
    resList.append(arr[rCursor])
    resList += rightArr
    
    return resList
}


var list = [6, 1, 2, 7, 9, 3, 4, 5, 10, 8]
print(quickSort(list))

