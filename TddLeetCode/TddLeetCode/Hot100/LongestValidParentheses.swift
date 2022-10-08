//
//  LongestValidParentheses.swift
//  TddLeetCode
//
//  Created by houguanhua on 2022/10/8.
//

import Foundation

class Solution32 {
    func longestValidParentheses(_ s: String) -> Int {
        let count = s.count
        if count < 2 {
            return 0
        }
            
        var result = 0
        
        let us = s.utf8CString
        
        let left = "(".utf8CString[0]
        let right = ")".utf8CString[0]
        
        var dp = Array(repeating: 0, count: count)
        
        for i in 1..<count {
            let tail = us[i]
            let preTail = us[i-1]
            
            if tail == right {
                if preTail == left {
                    dp[i] += 2
                    if i-2 >= 0 {
                        dp[i] += dp[i-2]
                    }
                } else {
                    let j = i - dp[i-1] - 1
                    if j >= 0 && us[j] == left {
                        dp[i] += dp[i-1] + 2
                        
                        let k = j - 1
                        if k >= 0 {
                            dp[i] += dp[k]
                        }
                    }
                }
            }
        }
        
        result = dp.reduce(0, { partialResult, dp in
            return max(partialResult, dp)
        })
        
        return result
    }
}
