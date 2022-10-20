//
//  GroupAnagrams.swift
//  TddLeetCode
//
//  Created by houguanhua on 2022/10/20.
//

import Foundation


class Solution49 {
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        var result = [[String]]()
        var stringAddedMap = [String: Bool]()
        var stringCharCountMap = [String: [Character: Int]]()
        
        let count = strs.count
        
        func countCharCount(str: String) -> [Character: Int] {
            if let map = stringCharCountMap[str] {
                return map
            }
            
            var map = [Character: Int]()
            for char in str {
                map[char] = (map[char] ?? 0) + 1
            }
            
            stringCharCountMap[str] = map
            
            return map
        }
        
        func isCharCountEqual(left: [Character: Int], right: [Character: Int]) -> Bool {
            if left.keys.count != right.keys.count {
                return false
            }
            
            for (key, v2) in right {
                guard let v1 = left[key] else {
                    return false
                }
                
                if v1 != v2 {
                    return false
                }
            }
            
            return true
        }
        
        for i in 0 ..< count {
            let firstString = strs[i]
            
            if stringAddedMap[firstString] == true {
                continue
            }
            
            let firstCharCountMap = countCharCount(str: firstString)
            
            var aGroup = [String]()
            aGroup.append(firstString)
            
            for j in i+1 ..< count {
                let secondString = strs[j]
                
                let secondCharCountMap = countCharCount(str: secondString)
                
                if isCharCountEqual(left: firstCharCountMap, right: secondCharCountMap) {
                    aGroup.append(secondString)
                    stringAddedMap[secondString] = true
                }
            }
            
            result.append(aGroup)
        }
        
        result = result.map({ list in
            return list.sorted()
        }).sorted(by: { list1, list2 in
            if list1.count == list2.count {
                return list1.first! > list2.first!
                
            } else {
                return list1.count < list2.count
            }
        })
        
        return result
    }
}
