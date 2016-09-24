//: Playground - noun: a place where people can play

import UIKit

// 冒泡排序的思想：每次找到一个最小的数，然后将其排序到最后面或者最前面

func bubbleSort(array: [Int]) -> [Int] {
    
    var arr = array
    
    // 重复 count 次，每次找到一个最小的放在最后
    for index in 0...arr.count-1 {
        
        var currentIndex = 0
        // 从第一个元素开始，不断进行比较，找到最小的元素，然后放到最后面
        // 如果当前已经找到了几个小的在后面，那么最后的这些就不必再排序了
        // 已经排序好的元素位置 = arr.count - index - 1
        while currentIndex < arr.count - index - 1 {
            if arr[currentIndex] < arr[currentIndex + 1] {
                // 如果当前的这个元素要比后面的元素小，就交换一下
                let temp = arr[currentIndex]
                arr[currentIndex] = arr[currentIndex + 1]
                arr[currentIndex + 1] = temp
            }
            currentIndex += 1
        }
    }
    
    return arr
}


let unorder = [2,3,9,1,22,4,7,4,8,9,4,3]
let order = bubbleSort(unorder)

print(order)
