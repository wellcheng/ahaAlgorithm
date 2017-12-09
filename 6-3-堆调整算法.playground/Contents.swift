//: Playground - noun: a place where people can play

import UIKit




func work () {
    
    // have some numbers
    let numbers = [-1, 99, 5, 36, 7, 22, 17, 92, 12, 2, 19, 25, 28, 1, 46]
    print("count : \(numbers.count)")
    
    // create one heap
    var heap = createHeap(withNumbers: numbers)
    print("result heap \(heap)")
    
    var topArr = [Int]();
    for idx in 1..<heap.count  {
        // print by order desc
        let res = deleteHeapTop(heap: heap)
        heap = res.heap
        topArr.append(res.top)
    }
    
    print(topArr)
    
    
}

func createHeap(withNumbers numbers:[Int]) -> [Int] {
    
    // copy numbers with first heap
    var heap = numbers;
    
    // amout of heap
    let count = numbers.count;
    
    //
    let lastRoot = Int(count / 2)
    
    // 从最后一个非叶子结点开始，一次向下调整
    for idx in (1...lastRoot).reversed() {
        print("\n----\nsiftDownHeap with idx \(idx) = \(heap[idx])\n----\n")
        heap = siftDownHeap(heap: heap, startNode: idx)
    }
    
    return heap
}

// 向下调整一个 heap
func siftDownHeap(heap:[Int], startNode node:Int) -> [Int] {
    
    // 从第 i 个结点开始调整
    var i = node
    let count = heap.count
    var done = false
    var resHeap = heap
    
    
    
    while i * 2 < count && !done {
        //
        print("\nfrom \(i) = \(resHeap[i])")
        
        var smallerNode = i;
        
        let lChildNode = i * 2;
        if resHeap[i] > resHeap[lChildNode]{
            // 比左子节点要小
            smallerNode = lChildNode
        }
        
        let rChildNode = i * 2 + 1;
        if  rChildNode < count && resHeap[smallerNode] > resHeap[rChildNode] {
            // 右节点比 smaller 要小
            smallerNode = rChildNode;
        } else {
            
        }
        
        
        if smallerNode == i {
            // 最小的节点仍然是自己, i 结点是一个最小的
            done = true
            print("already \(resHeap[i])")
        } else {
            // swap with smaller node
            print("swap small \(smallerNode) -> |\(resHeap[smallerNode])| with top \(i) -> |\(resHeap[i])|\npreswap \(resHeap)")
            resHeap.swapAt(smallerNode, i)
            print("swaped: \(resHeap)")
            i = smallerNode
        }
    }
    
    return resHeap
}

func deleteHeapTop(heap: [Int]) -> (top: Int, heap: [Int]) {
    var resHeap = heap
    let top = resHeap[1]
    let lastIdx = heap.count - 1
    resHeap[1] = resHeap[lastIdx]
    resHeap.remove(at: lastIdx)
    return (top, siftDownHeap(heap: resHeap, startNode: 1))
}


work()

