//
//  1TwoSum.swift
//  TddLeetCode
//
//  Created by houguanhua on 2022/9/30.
//

import Foundation

class Solution1 {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var result = [Int]()
        
        var map = [Int: Int]()
        
        for (index, num) in nums.enumerated() {
            if let firstIndex = map[num] {
                result.append(firstIndex)
                result.append(index)
                break
            } else {
                map[target-num] = index
            }
        }
        
        return result
    }
}
