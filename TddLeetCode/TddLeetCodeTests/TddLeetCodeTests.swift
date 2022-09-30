//
//  TddLeetCodeTests.swift
//  TddLeetCodeTests
//
//  Created by houguanhua on 2022/9/30.
//

import XCTest

final class TddLeetCodeTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    // MARK: - 1 twoSum
    func test1() throws {
        // Given
        let sut = Solution1()
        
        let nums = [2, 7, 11, 15]
        let target = 9
        
        // When
        let result = sut.twoSum(nums, target)
        
        // Then
        XCTAssertEqual(result, [0, 1])
    }
    
    func test2() throws {
        // Given
        let sut = Solution1()
        
        let nums = [3, 2, 4]
        let target = 6
        
        // When
        let result = sut.twoSum(nums, target)
        
        // Then
        XCTAssertEqual(result, [1, 2])
    }
    
    func test3() throws {
        // Given
        let sut = Solution1()
        
        let nums = [3, 3]
        let target = 6
        
        // When
        let result = sut.twoSum(nums, target)
        
        // Then
        XCTAssertEqual(result, [0, 1])
    }

    // MARK: - 2 Add two numbers
    func createList(intArray: [Int]) -> ListNode? {
        let result: ListNode? = intArray.map { num in
            ListNode(num)
        }.reduce(nil) { partialResult, node in
            partialResult?.next = node
            return partialResult
        }
        
        return result
    }
    
    func test2_1() throws {
        // Given
        let sut = Solution2()
        
        let l1 = createList(intArray: [2,4,3])
        let l2 = createList(intArray: [5,6,4])
        
        // When
        let result = sut.addTwoNumbers(l1, l2)
        
        // Then
        XCTAssertEqual(result, createList(intArray: [0, 1]))
    }
    
    func test2_2() throws {
        // Given
        let sut = Solution2()
        
        let l1 = createList(intArray: [0])
        let l2 = createList(intArray: [0])

        // When
        let result = sut.addTwoNumbers(l1, l2)
        
        // Then
        XCTAssertEqual(result, createList(intArray: [0]))
    }
    
    func test2_3() throws {
        // Given
        let sut = Solution2()
        
        let l1 = createList(intArray: [9,9,9,9,9,9,9])
        let l2 = createList(intArray: [9,9,9,9])
        
        // When
        let result = sut.addTwoNumbers(l1, l2)
        
        // Then
        XCTAssertEqual(result, createList(intArray: [8,9,9,9,0,0,0,1]))
    }

}

