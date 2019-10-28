//
//  NumKitDotProductTests.swift
//  NumKitTests
//
//  Created by Jan Tomec on 23/04/2019.
//  Copyright © 2019 Jan Tomec. All rights reserved.
//

import XCTest
@testable import NumKit

class NumKitDotProductTests: XCTestCase {
    
    func test0() {
        // test vector.vector
        let a = [1.0, 2.0]
        let b = [3.0, 4.0]
        XCTAssertEqual(dotProduct(a, b), a[0]*b[0] + a[1]*b[1])
    }
    func test1() {
        // test matrix.vector
        let a = [[1.0, 2.0], [1.0, 2.0]]
        let b = [3.0, 4.0]
        let a0 = a[0]
        let r = dotProduct(a0, b)
        XCTAssertEqual(dotProduct(a, b), [r, r])
    }
}
