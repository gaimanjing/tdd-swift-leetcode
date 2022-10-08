//
//  NextPermutation.swift
//  TddLeetCode
//
//  Created by houguanhua on 2022/10/8.
//

import Foundation

class Solution31 {
    func nextPermutation(_ nums: inout [Int]) {
        let count = nums.count
        if count < 2 {
            return
        }
        
        var i = count - 2
        while i >= 0 {
            if nums[i] < nums[i+1] {
                break
            }
            
            i -= 1
        }
        
        if i >= 0 {
            var j = count - 1
            while j > i {
                if nums[j] > nums[i] {
                    break
                }
                
                j -= 1
            }
            
            if j > i {
                (nums[i], nums[j]) = (nums[j], nums[i])
                reverse(from: i+1, to: count-1)
                return
            }
        }
        
        reverse(from: 0, to: count-1)
        
        func reverse(from: Int, to: Int) {
            var i = from
            var j = to
            
            while i < j {
                (nums[i], nums[j]) = (nums[j], nums[i])
                i += 1
                j -= 1
            }
        }
    }
}
