//
//  Permute.swift
//  TddLeetCode
//
//  Created by houguanhua on 2022/10/13.
//

import Foundation

class Solution46 {
    func permute(_ nums: [Int]) -> [[Int]] {
        var result = [[Int]]()
        
        let count = nums.count
        var flag = Array(repeating: false, count: count)
        
        var stack = [Int]()
        
        func f() {
            for i in 0 ..< count {
                if flag[i] == false {
                    stack.append(nums[i])
                    flag[i] = true
                    
                    if stack.count == count {
                        result.append(stack)
                    } else {
                        f()
                    }
                    
                    stack.removeLast()
                    flag[i] = false
                }
            }
        }
        
        f()
        
        return result
    }
}
