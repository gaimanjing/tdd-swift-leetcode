//
//  Search.swift
//  TddLeetCode
//
//  Created by houguanhua on 2022/10/9.
//

import Foundation

class Solution33 {
    func search(_ nums: [Int], _ target: Int) -> Int {
        if nums.isEmpty {
            return -1
        }
        
        let count = nums.count
        
        var i = 0
        var j = count - 1
        while i <= j {
            let mid = i + (j - i) / 2
            if nums[mid] == target {
                return mid
            }
            
            if nums[i] <= nums[mid] {
                if nums[i] <= target && target < nums[mid] {
                    j = mid - 1
                } else {
                    i = mid + 1
                }
                
            } else {
                if nums[mid] < target && target <= nums[j] {
                    i = mid + 1
                } else {
                    j = mid - 1
                }
            }
            
        }
        
        return -1
    }
}
