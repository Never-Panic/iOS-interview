//
//  Sort.swift
//  Algorithm
//
//  Created by 刘坤昊 on 2021/3/7.
//

import Foundation


struct Sort {
    // 冒泡排序
    static func BubblingSort (nums: [Int]) -> [Int] {
        var nums = nums
        for i in 1...nums.count-1 { // 定位交换的最后一个数
            for j in 0...nums.count-i-1 { // 定位交换的数
                if nums[j] > nums[j+1] {
                    nums.swapAt(j, j+1)
                }
            }
        }
        return nums
    }
    
    // 归并排序
    static func MergeSort (nums: [Int]) -> [Int] {
        if nums.count <= 1 {
            return nums
        }
        let midIndex = nums.count/2
        let left = Array(nums[0...midIndex])
        let right = Array(nums[(midIndex+1)...])
        
        return merge(left: MergeSort(nums: left), right: MergeSort(nums: right))
    }
    
    static func merge(left: [Int], right: [Int]) -> [Int] {
        var ans = [Int]()
        var lIndex = 0, rIndex = 0
        
        while lIndex < left.count && rIndex < right.count {
            if left[lIndex] > right[rIndex] {
                ans.append(right[rIndex])
                rIndex += 1
            } else {
                ans.append(left[lIndex])
                lIndex += 1
            }
        }
        
        while rIndex < right.count {
            ans.append(right[rIndex])
            rIndex += 1
        }
        
        while lIndex < left.count {
            ans.append(left[lIndex])
            lIndex += 1
        }
        
        return ans
    }
    
    // 快速排序
    static func QuickSort (nums: inout [Int], left: Int, right: Int) {
        if left >= right {
            return
        }
        
        var i = left, j = right, x = nums[left]
        while i < j {
            while i < j, nums[j] > x {
                j -= 1
            }
            if i < j {
                nums[i] = nums[j]
            }
            
            while i < j, nums[i] <= x {
                i += 1
            }
            if i < j {
                nums[j] = nums[i]
            }
        }
        nums[i] = x
        QuickSort(nums: &nums, left: 0, right: i-1)
        QuickSort(nums: &nums, left: i+1, right: right)
    }
}
