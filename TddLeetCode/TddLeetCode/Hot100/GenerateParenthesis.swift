//
//  GenerateParenthesis.swift
//  TddLeetCode
//
//  Created by houguanhua on 2022/10/7.
//

import Foundation

class Solution22 {
    func generateParenthesis(_ n: Int) -> [String] {
        typealias RemainItems = (left: Int, right: Int)
        
        func generate(head: String, open: Int, remainItems: RemainItems) -> [String] {
            if remainItems.left == 0 && remainItems.right == 0 {
                return [head]
            }
            
            var result = [String]()
            
            // append left: (
            if remainItems.left > 0 {
                result.append(contentsOf: generate(head: head + "(",
                                                   open: open + 1,
                                                   remainItems: RemainItems(left: remainItems.left - 1, right: remainItems.right)))
            }
            // append right: )
            if open > 0 && remainItems.right > 0 {
                result.append(contentsOf: generate(head: head + ")",
                                                   open: open - 1,
                                                   remainItems: RemainItems(left: remainItems.left, right: remainItems.right - 1)))
            }
            
            return result
        }
        
        
        return generate(head: "", open: 0, remainItems: RemainItems(left: n, right: n))
    }
}
