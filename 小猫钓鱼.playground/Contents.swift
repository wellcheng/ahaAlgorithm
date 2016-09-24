//: Playground - noun: a place where people can play

import Cocoa

// Queue
struct Queue {
    var data: [Int] = []
    
    mutating func enqueueItem(item: Int) {
        data.append(item)
    }
    
    mutating func dequeue() -> Int? {
        if data.count > 0 {
            return data.removeFirst()
        }else {
            return nil
        }
    }
}


// Stack
struct Stack {
    var data = [Int]()
    
    mutating func pushItem(item: Int) -> [Int]{
        for index in 0..<data.count {
            if data[index] == item {
                let range = index ..< data.count
                let res = Array<Int>(data[range]) + [item]
                data.removeRange(range)
                print("get \(res.reverse())")
                return res.reverse()
            }
        }
        data.append(item)
        return []
    }
    
    mutating func pop() -> Int? {
        if data.count > 0 {
            return data.removeLast()
        }else {
            return nil
        }
    }
}


// xiao heng
var hengQueue = Queue(data: [2,4,1,2,5,6])
var haQueue = Queue(data: [3,1,3,5,6,4])
var gameStack = Stack()

// game start
var gameEnd = false
while(!gameEnd) {
    if let paper = hengQueue.dequeue() {
        for p in gameStack.pushItem(paper) {
            hengQueue.enqueueItem(p)
        }
    }else {
        gameEnd = true
    }
    
    if let paper = haQueue.dequeue() where !gameEnd{
        for p in gameStack.pushItem(paper) {
            haQueue.enqueueItem(p)
        }
    }else {
        gameEnd = true
    }
    
    print(hengQueue.data)
    print(haQueue.data)
    print(gameStack.data)
    print("\n")
}



//gameStack.pushItem(hengQueue)





