//
//  SearchRange.swift
//  TddLeetCode
//
//  Created by houguanhua on 2022/10/10.
//

import Foundation

class Solution34 {
    func searchRange(_ nums: [Int], _ target: Int) -> [Int] {
        var result = [Int]()
        var startIndex = -1
        var endIndex = -1
        
        let count = nums.count
        func binarySeartch(low: Bool) -> Int {
            var l = 0
            var r = count - 1
            var result = count
            
            while l <= r {
                let mid = (l + r) / 2
                let midNum = nums[mid]
                
                if midNum > target || (low && midNum >= target) {
                    result = mid
                    
                    r = mid - 1
                    
                } else {
                    l = mid + 1
                }
            }
            
            return result
        }
        
        startIndex = binarySeartch(low: true)
        endIndex = binarySeartch(low: false) - 1
        
        if startIndex <= endIndex && endIndex < count && nums[startIndex] == target && nums[endIndex] == target {
            result.append(startIndex)
            result.append(endIndex)
        } else {
            result.append(-1)
            result.append(-1)
        }

        return result
    }
}
