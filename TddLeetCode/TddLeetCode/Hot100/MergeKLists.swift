//
//  MergeKLists.swift
//  TddLeetCode
//
//  Created by houguanhua on 2022/10/7.
//

import Foundation

class Solution23 {
    func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
        var validList = lists.compactMap({$0})
        if validList.isEmpty {
            return nil
        }
        
        let result: ListNode? = ListNode()
        var tail = result
        
        while !validList.isEmpty {
            var minNode: ListNode?
            
            for aHead in validList {
                if minNode == nil {
                    minNode = aHead
                    continue
                }
                
                if aHead.val < minNode!.val  {
                    minNode = aHead
                }
            }
            
            tail?.next = minNode
            tail = minNode
            
            validList = validList.compactMap({ aHead in
                if minNode === aHead {
                    return aHead.next
                } else {
                    return aHead
                }
            })
        }
        
        return result?.next
    }
}
