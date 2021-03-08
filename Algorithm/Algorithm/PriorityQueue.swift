//
//  PriorityQueue.swift
//  Algorithm
//
//  Created by 刘坤昊 on 2021/3/7.
//

import Foundation


struct PriorityQueue { // 用大堆实现
    
    private var arr: [Int]
    private var size: Int = 0
    
    init(size: Int) {
        arr = [Int](repeating: 0, count: size)
    }
    
    public func max () -> Int? {
        size==0 ? nil : arr[0]
    }
    
    public mutating func maxAndRemove () -> Int? {
        if size == 0 {
            return nil
        }
        
        let max = arr[0]
        arr[0] = arr[size-1]
        size -= 1
        sink(index: 0, val: arr[0])
        return max
    }
    
    public mutating func add (num: Int)  {
        arr[size] = num
        size += 1
        float(index: size-1, val: num)
    }
    
    // MARK: -堆操作
    private mutating func sink (index: Int, val: Int) {
        var index = index
        while (index+1)*2 - 1 <= size - 1 { // 还有子节点
            var maxChildIndex = (index+1)*2 - 1
            if arr[maxChildIndex] < arr[maxChildIndex+1] && (index+1)*2 <= size - 1 { // 查看是否存在比该节点还大的子节点
                maxChildIndex += 1
            }
            
            if arr[maxChildIndex] < val {
                break
            }
            
            arr.swapAt(maxChildIndex, index)
            index = maxChildIndex
        }
    }
    
    private mutating func float (index: Int, val: Int) {
        var index = index
        while index > 0 { // 有父节点
            let parentIndex = (index-1)/2
            
            if arr[parentIndex] > val {
                break
            }
            
            arr.swapAt(parentIndex, index)
            index = parentIndex
        }
    }
    
}
