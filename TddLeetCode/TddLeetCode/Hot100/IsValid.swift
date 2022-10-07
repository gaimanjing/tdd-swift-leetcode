//
//  IsValid.swift
//  TddLeetCode
//
//  Created by houguanhua on 2022/10/7.
//

import Foundation

class Solution20 {
    func isValid(_ s: String) -> Bool {
        var stack = [Character]()
        let map: [Character: Character] = [")": "(", "]": "[", "}": "{"]
        
        for char in s {
            if let matchChar = map[char], matchChar == stack.last {
                stack.removeLast()
                continue
            }
            
            stack.append(char)
        }
        
        return stack.isEmpty
    }
}
