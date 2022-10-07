//
//  RemoveNthFromEnd.swift
//  TddLeetCode
//
//  Created by houguanhua on 2022/10/7.
//

import Foundation


class Solution19 {
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        let dummyNode: ListNode? = ListNode()
        dummyNode?.next = head
        
        var first = dummyNode
        var preRemovedNode = dummyNode
        for _ in 0...n {
            first = first?.next
        }
        
        while first != nil {
            first = first?.next
            preRemovedNode = preRemovedNode?.next
        }
        
        preRemovedNode?.next = preRemovedNode?.next?.next
        
        return dummyNode?.next
    }
}
