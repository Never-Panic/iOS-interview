//
//  HashTable.swift
//  Algorithm
//
//  Created by 刘坤昊 on 2021/3/8.
//

import Foundation

class HashTable<KeyType, ValueType> where KeyType: Hashable {
    typealias Item = (key: KeyType, val: ValueType)
    typealias Bucket = [Item]
    
    private var buckets: [Bucket]
    private let capacity: Int
    var count = 0
    var isEmpty: Bool { count==0 }
    
    init(capacity: Int) {
        assert(capacity > 0)
        self.capacity = capacity
        buckets = [Bucket](repeating: [], count: capacity)
    }
    
    private func index(ofKey key: KeyType) -> Int{
        abs(key.hashValue) % capacity
    }
    
    func value(forKey key: KeyType) -> ValueType? {
        let i = index(ofKey: key)
        
        for item in buckets[i] {
            if item.key == key {
                return item.val
            }
        }
        return nil
    }
    
    func updateValue(_ value: ValueType ,forKey key: KeyType) {
        let i = index(ofKey: key)
        
        for (index, item) in buckets[i].enumerated() {
            if item.key == key {
                buckets[i][index].val = value
                return
            }
        }
        
        // 没找到，加上就好
        buckets[i].append((key: key, val: value))
        count += 1
    }
    
    func removeValue(forKey key: KeyType) -> ValueType? {
        let i = index(ofKey: key)
        
        for (index, item) in buckets[i].enumerated() {
            if item.key == key {
                buckets[i].remove(at: index)
                count -= 1
                return item.val
            }
        }
        
        return nil
    }
    
    
}
