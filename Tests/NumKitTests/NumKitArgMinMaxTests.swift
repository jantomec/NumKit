//
//  File.swift
//  
//
//  Created by Jan Tomec on 28/10/2019.
//

import XCTest
@testable import NumKit

class NumKitArgMinTests: XCTestCase {
    
    func test0() {
        // test regular array
        XCTAssertEqual([3,2,1,4,5,6].argmin(), 2)
    }
    func test1() {
        // test empty array
        XCTAssertEqual([Int]().argmin(), nil)
    }
    func test2() {
        // test repeating elements
        XCTAssertEqual([3,2,1,4,5,6,1].argmin(), 2)
    }
}

class NumKitArgMaxTests: XCTestCase {
    
    func test0() {
        // test regular array
        XCTAssertEqual([3,2,1,4,5,6].argmax(), 5)
    }
    func test1() {
        // test empty array
        XCTAssertEqual([Int]().argmin(), nil)
    }
    func test2() {
        // test repeating elements
        XCTAssertEqual([3,2,1,4,5,6,1,6].argmax(), 5)
    }
}
