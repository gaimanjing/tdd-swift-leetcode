//
//  LengthOfLongestSubstring.swift
//  TddLeetCode
//
//  Created by houguanhua on 2022/10/1.
//

import Foundation

class Solution3 {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        guard !s.isEmpty else {
            return 0
        }
        
        let utf8CString = s.utf8CString
        var result = 0
        var map = [CChar: Bool]()
        var headOffset = 0
        var tailOffset = 0
        
        repeat {
            let tail = utf8CString[tailOffset]
            
            while map[tail] == true {
                let head = utf8CString[headOffset]
                
                map[head] = false
                headOffset += 1
            }
            map[tail] = true
            
            
            result = max(result, (tailOffset - headOffset + 1))
            tailOffset += 1
        } while tailOffset < utf8CString.count - 1  // zero terminated
        
        return result
    }
    
    func lengthOfLongestSubstring_badPerformance(_ s: String) -> Int {
        guard !s.isEmpty else {
            return 0
        }
        var result = 0
        var map = [Character: Bool]()
        var headOffset = 0
        var tailOffset = 0
        
        repeat {
            let tailIndex = s.index(s.startIndex, offsetBy: tailOffset)
            let tail = s[tailIndex]
            
            while map[tail] == true {
                let headIndex = s.index(s.startIndex, offsetBy: headOffset)
                let head = s[headIndex]
                
                map[head] = false
                headOffset += 1
            }
            map[tail] = true
            
            result = max(result, (tailOffset - headOffset + 1))
            
            tailOffset += 1
        } while tailOffset + 1 <= s.count
        
        return result
    }
}
