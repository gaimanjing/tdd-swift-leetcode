//
//  LetterCombinations.swift
//  TddLeetCode
//
//  Created by houguanhua on 2022/10/6.
//

import Foundation

class Solution17 {
    func letterCombinations(_ digits: String) -> [String] {
        let map: [Character: String] = [
            "2": "abc",
            "3": "def",
            "4": "ghi",
            "5": "jkl",
            "6": "mno",
            "7": "pqrs",
            "8": "tuv",
            "9": "wxyz",
        ]
        
        func backTrack(head: String, digits: String) -> [String] {
            var result = [String]()
            
            if let digit = digits.first {
                let chars = map[digit]!
                
                for char in chars {
                    var record = head
                    record.append(char)
                    let results = backTrack(head: record, digits: String(digits.dropFirst()))
                    result.append(contentsOf: results)
                }
            } else if !head.isEmpty {
                result.append(head)
            }
            
            return result
        }
        
        return backTrack(head: "", digits: digits)
    }
}
