

import UIKit

// 桶排序的思想，是先创建桶，即将所有可能的序列都创建好，然后将待排序的目标一一放入桶中


func bucketSort(unOrderedList list: [Int]) -> [Int] {
    var orderList: [Int] = Array<Int>(count: 1000, repeatedValue: 0)
    for item in list {
        orderList[item] += 1
    }
    
    orderList
    
    var resList: [Int] = []
    
    for index in 0...orderList.count-1 {
        while orderList[index] > 0 {
            resList.append(index)
            orderList[index] -= 1
        }
    }
    return resList
}


let unOrderedList = [12,84,275,173,123,992,7,12,123]

let orderedList = bucketSort(unOrderedList: unOrderedList)

print(orderedList)
