//
//  NumKitClipToBoundsTests.swift
//  NumKitTests
//
//  Created by Jan Tomec on 24/04/2019.
//  Copyright © 2019 Jan Tomec. All rights reserved.
//

import XCTest
@testable import NumKit

class NumKitClipToBoundsTests: XCTestCase {
    
    func test0() {
        // test bottom
        XCTAssertEqual(clipToBounds(-1, bottom: 0, top: 2), 0)
    }
    func test1() {
        // test top
        XCTAssertEqual(clipToBounds(4, bottom: 0, top: 2), 2)
    }
    func test2() {
        // test center
        XCTAssertEqual(clipToBounds(1, bottom: 0, top: 2), 1)
    }
}
