//
//  FindMedianSortedArrays.swift
//  TddLeetCode
//
//  Created by houguanhua on 2022/10/1.
//

import Foundation

class Solution4 {
    func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
        var nums = [Int]()
        var index1 = 0
        var index2 = 0
        while index1 < nums1.count || index2 < nums2.count {
            if index1 < nums1.count {
                let n1 = nums1[index1]
                
                if index2 < nums2.count, nums2[index2] < n1 {
                    nums.append(nums2[index2])
                    index2 += 1
                } else {
                    nums.append(nums1[index1])
                    index1 += 1
                }
            } else {
                if index2 < nums2.count {
                    nums.append(nums2[index2])
                    index2 += 1
                } else {
                    break
                }
            }
        }
        
        var result: Double = 0
        let count = nums.count
        if count % 2 == 1 {
            // 1: 0
            // 3: 1
            // 5: 2
            // 7: 3
            let middleIndex1 = count / 2
            
            result = Double(nums[middleIndex1])
            
        } else {
            // 2: 0 & 1
            // 4: 1 & 2
            // 6: 2 & 3
            let middleIndex1 = count / 2 - 1
            let middleIndex2 = middleIndex1 + 1
            
            result = Double(nums[middleIndex1])
            result += Double(nums[middleIndex2])
            result /= 2
        }
        

        return result
    }
}
