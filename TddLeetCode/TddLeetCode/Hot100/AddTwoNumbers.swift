//
//  AddTwoNumbers.swift
//  TddLeetCode
//
//  Created by houguanhua on 2022/9/30.
//

import Foundation

class Solution2 {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        guard let l1 = l1 else {
            return l2
        }
        
        guard let l2 = l2 else {
            return l1
        }
        
        var node1: ListNode? = l1
        var node2: ListNode? = l2
        
        var nextValueToAdd = 0
        
        var result: ListNode!
        var node: ListNode!
        
        while node1 != nil || node2 != nil || nextValueToAdd > 0 {
            var sum = nextValueToAdd
            if let v1 = node1?.val {
                sum += v1
            }
            if let v2 = node2?.val {
                sum += v2
            }
            
            let nextNode = ListNode(sum % 10)
            if result == nil {
                result = nextNode
            } else {
                node.next = nextNode
            }
            node = nextNode
            
            node1 = node1?.next
            node2 = node2?.next
            nextValueToAdd = sum / 10
        }

        return result
    }
}
