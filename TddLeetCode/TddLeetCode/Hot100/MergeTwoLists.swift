//
//  MergeTwoLists.swift
//  TddLeetCode
//
//  Created by houguanhua on 2022/10/7.
//

import Foundation

class Solution21 {
    func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
        let dummyHead: ListNode? = ListNode()
        
        if list1 == nil {
            return list2
        }
        
        if list2 == nil {
            return list1
        }
        
        var n1 = list1
        var n2 = list2
        var tail = dummyHead
        
        while n1 != nil || n2 != nil {
            if n1 == nil {
                tail?.next = n2
                break
            }
            
            if n2 == nil {
                tail?.next = n1
                break
            }
            
            if n1!.val < n2!.val {
                tail?.next = n1
                tail = n1
                
                n1 = n1?.next
                
            } else {
                tail?.next = n2
                tail = n2
                
                n2 = n2?.next
                
            }
        }
        
        return dummyHead?.next
    }
}
