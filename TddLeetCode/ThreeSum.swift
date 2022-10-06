//
//  ThreeSum.swift
//  TddLeetCode
//
//  Created by houguanhua on 2022/10/6.
//

import Foundation

class Solution15 {
    func threeSum(_ nums: [Int]) -> [[Int]] {
        var result = [[Int]]()
        
        guard nums.count >= 3 else {
            return []
        }
        
        let sortedNums = nums.sorted()
        
        for i in 0...sortedNums.count - 3 {
            let first = sortedNums[i]
            if i > 0, sortedNums[i-1] == first {
                continue
            }
            
            var kMaxOffset = sortedNums.count - 1
            for j in (i+1)...(sortedNums.count-2) {
                let second = sortedNums[j]
                
                if j > i+1, sortedNums[j-1] == second {
                    continue
                }
                
                if j + 1 > kMaxOffset {
                    break
                }
                
                let target = 0 - first - second
                            
                var lastThird = 0
                for k in ((j+1)...kMaxOffset).reversed() {
                    let third = sortedNums[k]
                    
                    if third == target {
                        if k < kMaxOffset, third == lastThird {
                            continue
                        }
                        
                        result.append([first, second, third])
                        kMaxOffset = k
                        break
                    }
                    lastThird = third
                }
            }
        }
        
        return result
    }
}
