//
//  LongestPalindrome.swift
//  TddLeetCode
//
//  Created by houguanhua on 2022/10/2.
//

import Foundation

class Solution5 {
    func longestPalindrome(_ s: String) -> String {
        if s.isEmpty || s.count < 2 {
            return s
        }
        
        let count = s.count
        
        var flag = Array(repeating: Array(repeating: false, count: count), count: count)
        for i in 0..<count {
            flag[i][i] = true
        }
        
        var begin = 0
        var maxLen = 1
        
        let utf8CString = s.utf8CString
        
        for len in 2...count {
            for i in 0..<count {
                let j = i + len - 1
                if j >= count {
                    break
                }
                
                if utf8CString[i] != utf8CString[j] {
                    flag[i][j] = false
                } else {
                    if j - i < 3 {
                        flag[i][j] = true
                    } else {
                        flag[i][j] = flag[i+1][j-1]
                    }
                }
                
                if flag[i][j], len > maxLen {
                    maxLen = len
                    begin = i
                }
            }
        }
        
        let beginIndex = s.index(s.startIndex, offsetBy: begin)
        let endIndex = s.index(beginIndex, offsetBy: maxLen-1)
        let range = beginIndex...endIndex
        
        return String(s[range])
    }
}
