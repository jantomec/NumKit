import XCTest
@testable import NumKit

final class NumKitTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(NumKit().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
