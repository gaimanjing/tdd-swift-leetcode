//
//  HotFrom23.swift
//  TddLeetCodeTests
//
//  Created by houguanhua on 2022/10/20.
//

import XCTest

final class HotFrom23: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    func test49_1() throws {
        // Given
        let sut = Solution49()
        
        let strs = ["eat", "tea", "tan", "ate", "nat", "bat"]
        let r = [["bat"],["nat","tan"],["ate","eat","tea"]]
        
        // When
        let result = sut.groupAnagrams(strs)
        
        // Then
        XCTAssertEqual(result, r)
    }
    
    func test49_2() throws {
        // Given
        let sut = Solution49()
        
        let strs = [""]
        let r = [[""]]
        
        // When
        let result = sut.groupAnagrams(strs)
        
        // Then
        XCTAssertEqual(result, r)
    }
    
    func test49_3() throws {
        // Given
        let sut = Solution49()
        
        let strs = ["a"]
        let r = [["a"]]
        
        // When
        let result = sut.groupAnagrams(strs)
        
        // Then
        XCTAssertEqual(result, r)
    }
    
    func test49_100() throws {
        // Given
        let sut = Solution49()
        
        let strs = ["ddddddddddg","dgggggggggg"]
        let r = [["dgggggggggg"],["ddddddddddg"]]
        
        // When
        let result = sut.groupAnagrams(strs)
        
        // Then
        XCTAssertEqual(result, r)
    }

}
