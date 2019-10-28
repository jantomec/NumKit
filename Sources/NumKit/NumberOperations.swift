//
//  NumberOperations.swift
//  NumKit
//
//  Created by Jan Tomec on 21/04/2019.
//  Copyright © 2019 Jan Tomec. All rights reserved.
//

import Foundation
import CoreGraphics

precedencegroup ExponentiativePrecedence {
    associativity: right
    higherThan: MultiplicationPrecedence
}

infix operator **: ExponentiativePrecedence
public func ** (radix: Double, power: Double) -> Double {
    return pow(radix, power)
}
public func ** (radix: Int, power: Int) -> Int {
    return Int(pow(Double(radix), Double(power)))
}
public func ** (radix: Float, power: Float) -> Float {
    return Float(pow(Double(radix), Double(power)))
}
public func ** (radix: CGFloat, power: CGFloat) -> CGFloat {
    return CGFloat(pow(Double(radix), Double(power)))
}
public func ** (radix: Double, power: Int) -> Double {
    return pow(radix, Double(power))
}
public func ** (radix: CGFloat, power: Int) -> CGFloat {
    return CGFloat(pow(Double(radix), Double(power)))
}

public extension Double {
    func rounded(to decPlaces: Int) -> Double {
        let exp = Double(pow(10, Double(decPlaces)))
        return (self*exp).rounded() / exp
    }
}

public func scientificNumberForm(_ number: Double, decimalPlaces: Int) -> (number: Double, exponent: Int) {
    var x = number
    var exp: Int = 0
    if x == 0 {
        return (x, 0)
    } else if abs(x) < 1 {
        while abs(x.rounded(.towardZero)) <= 1 {
            x *= 10
            exp -= 1
        }
    } else if abs(x) > 10 {
        while abs(x.rounded(.towardZero)) >= 10 {
            x *= 1/10
            exp += 1
        }
    }
    return (x.rounded(to: decimalPlaces), exp)
}

public func scientificNumberForm(_ description: (number: Double, exponent: Int)) -> Double {
    return description.number * 10**Double(description.exponent)
}

public func clipToBounds<T: Comparable>(_ number: T, bottom: T, top: T) -> T {
    if number < bottom {
        return bottom
    } else if number > top {
        return top
    } else {
        return number
    }
}
