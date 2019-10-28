//
//  NumKitTests.swift
//  NumKitTests
//
//  Created by Jan Tomec on 21/04/2019.
//  Copyright © 2019 Jan Tomec. All rights reserved.
//

import XCTest
@testable import NumKit

class NumKitArangeTests: XCTestCase {

    func test0() {
        // test that arange returns expected number of elements in array
        XCTAssertEqual(arange(from: 2, to: 5, step: 1/3, includeLast: false).count, 0)
    }
    func test1() {
        // test that arange returns expected number of elements in array
        XCTAssertEqual(arange(from: 2, to: 5, step: 1.0/3, includeLast: false).count, 9)
    }
    func test2() {
        // test that arange returns expected number of elements in array
        XCTAssertEqual(arange(from: 2, to: 5, step: 1.0/3, includeLast: true).count, 10)
    }
    func test3() {
        // test that arange returns expected number of elements in array
        XCTAssertEqual(arange(from: 0, to: 0, step: 1.0/3, includeLast: true).count, 1)
    }
    func test4() {
        // test that arange returns expected number of elements in array
        XCTAssertEqual(arange(from: 1, to: 0, step: 1.0/3, includeLast: true).count, 0)
    }
    func test5() {
        // test that arange returns expected number of elements in array
        XCTAssertEqual(arange(from: 1, to: 3, step: 3, includeLast: true).count, 1)
    }
    
    func test6() {
        // test that arange returns expected number of elements in array
        XCTAssertEqual(arange(from: 1, to: 3, step: -1, includeLast: true).count, 0)
    }
    
    func test7() {
        // test that arange returns expected number of elements in array
        XCTAssertEqual(arange(from: -1, to: 3, step: 1, includeLast: true).count, 5)
    }
    
    func test8() {
        // test that arange returns expected number of elements in array
        XCTAssertEqual(arange(from: -1, to: -3, step: -1, includeLast: true).count, 3)
    }
    
    func test9() {
        // test that arange returns expected number of elements in array
        XCTAssertEqual(arange(from: -1, to: -3, step: -1, includeLast: false).count, 2)
    }

}
