//
//  ListNode.swift
//  TddLeetCode
//
//  Created by houguanhua on 2022/10/7.
//

import Foundation

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

func createList(intArray: [Int]) -> ListNode? {
    let result: ListNode? = intArray.map { num in
        ListNode(num)
    }.reduce(nil) { partialResult, node in
        partialResult?.next = node
        return partialResult
    }
    
    return result
}
    
extension ListNode: Equatable {
    public static func == (lhs: ListNode, rhs: ListNode) -> Bool {
        return lhs.val == rhs.val && lhs.next == rhs.next
    }
}
