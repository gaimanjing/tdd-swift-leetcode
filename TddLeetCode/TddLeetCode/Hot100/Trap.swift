//
//  Trap.swift
//  TddLeetCode
//
//  Created by houguanhua on 2022/10/12.
//

import Foundation

class Solution42 {
    func trap(_ height: [Int]) -> Int {
        var result = 0
        
        let count = height.count
        if count < 3 {
            return 0
        }
        
        var leftMax = Array(repeating: 0, count: count)
        var rightMax = Array(repeating: 0, count: count)
        leftMax[0] = height[0]
        var i = 1
        while i < count {
            leftMax[i] = max(leftMax[i-1], height[i])
            
            i += 1
        }
        
        rightMax[count-1] = height[count-1]
        var j = count - 2
        while j >= 0 {
            rightMax[j] = max(rightMax[j+1], height[j])
            
            j -= 1
        }
        
        for k in 0 ..< count {
            let x = min(leftMax[k], rightMax[k]) - height[k]
            result += x
        }
        
        return result
    }
}
