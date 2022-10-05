//
//  IsMatch.swift
//  TddLeetCode
//
//  Created by houguanhua on 2022/10/5.
//

import Foundation

class Solution10 {
    func isMatch(_ s: String, _ p: String) -> Bool {
        let m = s.count
        let n = p.count
        
        var flag = Array(repeating: Array(repeating: false, count: n+1), count: m+1)
        flag[0][0] = true
        
        let star: Character = "*"
        let dot: Character = "."
        
        func matches(sNth: Int, pChar: Character) -> Bool {
            if sNth == 0 {
                return false
            }
            
            if pChar == dot {
                return true
            }
            
            let index = s.index(s.startIndex, offsetBy: sNth - 1)
            let sChar = s[index]
            
            return sChar == pChar
        }
        
        for i in 0...m {
            var prePChar: Character!
            var j = 0
            for pChar in p {
                j += 1
                
                if pChar == star {
                    if matches(sNth: i, pChar: prePChar){
                        flag[i][j] = flag[i-1][j] || flag[i][j-2]
                    } else {
                        flag[i][j] = flag[i][j-2]
                    }
                    
                } else {
                    if matches(sNth: i, pChar: pChar) {
                        flag[i][j] = flag[i-1][j-1]
                    }
                }
                
                prePChar = pChar
            }
            
        }
        
        return flag[m][n]
    }
}
