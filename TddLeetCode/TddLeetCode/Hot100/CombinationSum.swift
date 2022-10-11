//
//  CombinationSum.swift
//  TddLeetCode
//
//  Created by houguanhua on 2022/10/11.
//

import Foundation

class Solution39 {
    func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
        func f(stack: [Int], startIndex: Int, target: Int) -> [[Int]] {
            var result = [[Int]]()
            
            if startIndex == candidates.count {
                return result
            }
            
            
            let num = candidates[startIndex]
            var newStack = stack
            newStack.append(num)
            
            if num == target {
                result.append(newStack)
            } else if num < target {
                result.append(contentsOf: f(stack: newStack, startIndex: startIndex, target: target - num))
            }
            
            result.append(contentsOf: f(stack: stack, startIndex: startIndex + 1, target: target))
            
            return result
        }
        
        return f(stack: [], startIndex: 0, target: target)
    }
}
