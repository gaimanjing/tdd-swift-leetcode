//
//  MaxArea.swift
//  TddLeetCode
//
//  Created by houguanhua on 2022/10/6.
//

import Foundation

class Solution11 {
    func maxArea(_ height: [Int]) -> Int {
        var result = 0
        
        guard height.count >= 2 else {
            return 0
        }
        
        var left = 0
        var right = height.count - 1
        
        repeat {
            let minHeight = min(height[left], height[right])
            let area = minHeight * (right - left)
            if area > result {
                result = area
            }
            
            if height[left] < height[right] {
                left += 1
            } else {
                right -= 1
            }
        } while left <= right - 1

        return result
    }
}
