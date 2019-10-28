//
//  ArrayExtensions.swift
//  NumKit
//
//  Created by Jan Tomec on 21/04/2019.
//  Copyright © 2019 Jan Tomec. All rights reserved.
//

import Foundation

public extension Array where Element: AdditiveArithmetic {
    mutating func add(_ number: Element) {
        self = self.map({ $0 + number })
    }
    mutating func add(_ arr: Array<Element>) {
        self = zip(self, arr).map({ $0 + $1 })
    }
}

public extension Array where Element: Numeric {
    mutating func multiply(_ number: Element) {
        self = self.map({ $0 * number })
    }
    mutating func multiply(_ arr: Array<Element>) {
        self = zip(self, arr).map({ $0 * $1 })
    }
    var sum: Element {
        get {
            return self.reduce(0, { x, y in
                x + y
            })
        }
    }
}

public extension Array {
    func select(with selector: [Bool]) -> [Element] {
        return self.enumerated().filter({ selector[$0.offset] }).map({ $0.element })
    }
    func select(with selector: [Int]) -> [Element] {
        return selector.map({ self[$0] })
    }
}

public extension Array where Element: FloatingPoint {
    var mean: Element {
        get {
            return self.reduce(0, { x, y in
                x + y
            }) / Element(self.count)
        }
    }
}

public extension Array where Element: Comparable {
    /// This function finds the minimum in array and returns its index. If array is empty it returns `nil`.
    ///
    /// Usage:
    ///
    ///     linspace(from: 1, to: 5, n: 4).argmin() // 0
    ///
    /// - Returns: Index of array minimum or `nil`.
    func argmin() -> Int? {
        if let m = self.min() {
            return self.firstIndex(of: m)
        } else {
            return nil
        }
    }
    /// This function finds the maximum in array and returns its index. If array is empty it returns `nil`.
    ///
    /// Usage:
    ///
    ///     linspace(from: 1, to: 5, n: 4).argmin() // 0
    ///
    /// - Returns: Index of array minimum or `nil`.
    func argmax() -> Int? {
        if let m = self.max() {
            return self.firstIndex(of: m)
        } else {
            return nil
        }
    }
    
}

/// This function creates new array.
///
/// - Warning: i2 may be are may not be included regardles ofthe property includeLast - it also depends on the step.
///
/// Usage:
///
///     let x: [Double] = arange(from: 1, to: 5, step: 1.2, includeLast: true)
///
/// - Parameter i1: Starting number, included
/// - Parameter i2: Ending number, might not be included.
/// - Parameter step: Step.
/// - Parameter includeLast: If true, creating loop goes to <= i2, else it goes to < i2.
///
/// - Returns: Array<T>.
public func arange<T: Comparable & SignedNumeric> (from i1: T, to i2: T, step: T = 1, includeLast: Bool = false) -> [T] {
    var list = [T]()
    var i: T = 0
    if includeLast {
        while abs(i1+i*step) <= abs(i2) {
            let e1: T = abs(i1+i*step - i2)
            let e2: T = abs(i1+(i-1)*step - i2)
            if e1 >= e2 {
                break
            }
            list.append(i1+i*step)
            i += 1
        }
    } else {
        while abs(i1+i*step) < abs(i2) {
            let e1: T = abs(i1+i*step - i2)
            let e2: T = abs(i1+(i-1)*step - i2)
            if e1 >= e2 {
                break
            }
            list.append(i1+i*step)
            i += 1
        }
    }
    
    return list
    
}

/// This function creates new array.
///
/// - Warning: i2 is included.
///
/// Usage:
///
///     let x: [Double] = linspace(from: 1, to: 5, n: 4)
///
/// - Parameter i1: Starting number, included
/// - Parameter i2: Ending number, might not be included.
/// - Parameter n: Number of elements in new array
///
/// - Returns: Array<T>.
public func linspace<T: Comparable & FloatingPoint> (from i1: T, to i2: T, n: Int) -> [T] {
    let dx = (i2 - i1) / (T(n)-1)
    
    return arange(from: i1, to: i2, step: dx, includeLast: true)
    
}
