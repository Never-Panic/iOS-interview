//
//  LRU.swift
//  Algorithm
//
//  Created by 刘坤昊 on 2021/3/8.
//

import Foundation

class Node <KeyType, ValType> where KeyType: Hashable {
    var next: Node?
    var pre: Node?
    var val: ValType
    var key: KeyType
    
    init(key: KeyType, val: ValType) {
        self.val = val
        self.key = key
    }
}

class LinkMap <KeyType, ValType> where KeyType: Hashable { // 有哈希表的双向链表
    var head: Node<KeyType, ValType>?
    var tail: Node<KeyType, ValType>?
    var dic = [KeyType: Node<KeyType, ValType>]() // key -> node
    
    // MARK: - 链表操作
    // 添加到链表头
    func add(_ node: Node<KeyType, ValType>) {
        dic[node.key] = node
        
        if let headNode = head {
            headNode.next = node
            node.pre = headNode
            head = node
        } else {
            head = node
            tail = node
        }
    }
    
    // 删除该结点
    func delete(_ node: Node<KeyType, ValType>) {
        if dic[node.key] != nil { // 确实有这个结点
            if let next = node.next {
                next.pre = node.pre
            }
            if let pre = node.pre {
                pre.next = node.next
            }
            // 改变head和tail
            if node === head {
                head = node.pre
            }
            
            if node === tail {
                tail = node.next
            }
            
            dic[node.key] = nil // 释放该结点
        }
    }
    
    func moveToHead(_ node: Node<KeyType, ValType>) {
        if dic[node.key] != nil { // 确实有这个结点
            if let next = node.next {
                next.pre = node.pre
            }
            if let pre = node.pre {
                pre.next = node.next
            }
            // 改变head和tail
            if node === head {
                head = node.pre
            }
            
            if node === tail {
                tail = node.next
            }
            
            head?.next = node
            node.pre = head
            node.next = nil
            head = node
        }
    }
}

class LRU <KeyType, ValType> where KeyType: Hashable {
    var limitedSize: Int
    var list = LinkMap<KeyType, ValType>()
    
    init(limitedSize: Int) {
        assert(limitedSize > 0)
        self.limitedSize = limitedSize
    }
    
    // 加入数据，如果这个数据有了，就放在链表头
    func add(key: KeyType, val: ValType) {
        if let node = list.dic[key] {
            list.moveToHead(node)
        } else {
            list.add(Node(key: key, val: val))
        }
        
        // 数量超出限制，删除尾巴结点
        if list.dic.count > limitedSize {
            list.delete(list.tail!)
        }
    }
    
    func use(key: KeyType) -> ValType? {
        if let node = list.dic[key] {
            list.moveToHead(node)
            return node.val
        }
        return nil
    }
}
