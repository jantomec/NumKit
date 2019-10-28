//
//  MathematicalFunctions.swift
//  NumKit
//
//  Created by Jan Tomec on 23/04/2019.
//  Copyright © 2019 Jan Tomec. All rights reserved.
//

import Foundation

public func dotProduct<T: Numeric>(_ vector1: [T], _ vector2: [T]) -> T {
    return zip(vector1, vector2).reduce(0) {
        (result, element) in
        result + element.0 * element.1
    }
}

public func dotProduct<T: Numeric>(_ matrix: [[T]], _ vector: [T]) -> [T] {
    return matrix.map {
        dotProduct($0, vector)
    }
}

public func dotProduct<T: Numeric>(_ matrix1: [[T]], _ matrix2: [[T]]) -> [[T]] {
    return matrix2.map {
        dotProduct(matrix1, $0)
    }
}

public struct TransformationMatrix {
    public var value: [[Double]]
    init(_ matrix: [[Double]]) {
        let message = "Matrix should be 4x4 in size, found \(matrix.count)x\(matrix[0].count)"
        assert(matrix.count == 4, message)
        matrix.forEach {
            assert($0.count == 4, message)
        }
        value = matrix
    }
}

extension TransformationMatrix: CustomStringConvertible {
    public var description: String {
        return "T[\(self.value[0]),\n  \(self.value[1]),\n  \(self.value[2]),\n  \(self.value[3])]"
    }
    
    
}

public func TranslationMatrix(vector: [Double]) -> TransformationMatrix {
    let message = "Vector should be 3 in size, found \(vector.count)"
    assert(vector.count == 3, message)
    let x = vector[0],
        y = vector[1],
        z = vector[2]
    let mtrx: [[Double]] = [[1, 0, 0, x],
                            [0, 1, 0, y],
                            [0, 0, 1, z],
                            [0, 0, 0, 1]]
    return TransformationMatrix(mtrx)
}

public func ScalingMatrix(vector: [Double]) -> TransformationMatrix {
    let message = "Vector should be 3 in size, found \(vector.count)"
    assert(vector.count == 3, message)
    let x = vector[0],
        y = vector[1],
        z = vector[2]
    let mtrx: [[Double]] = [[x, 0, 0, 0],
                            [0, y, 0, 0],
                            [0, 0, z, 0],
                            [0, 0, 0, 1]]
    return TransformationMatrix(mtrx)
}

public func ReflectionMatrix(point: [Double]) -> TransformationMatrix {
    let message = "Point should be 3 in size, found \(point.count)"
    assert(point.count == 3, message)
    let x = point[0],
        y = point[1],
        z = point[2]
    let mtrx: [[Double]] = [[-1, 0, 0, 2*x],
                            [0, -1, 0, 2*y],
                            [0, 0, -1, 2*z],
                            [0, 0, 0, 1]]
    return TransformationMatrix(mtrx)
}

public func RotationMatrix(angles: [Double]) -> TransformationMatrix {
    let message = "Angles should be 3 in size, found \(angles.count)"
    assert(angles.count == 3, message)
    let a = angles[0],
        b = angles[1],
        c = angles[2]
    
    let rx = [[1, 0, 0, 0],
              [0, cos(a), -sin(a), 0],
              [0, sin(a), cos(a), 0],
              [0, 0, 0, 1]]
    let ry = [[cos(b), 0, sin(b), 0],
              [0, 1, 0, 0],
              [-sin(b), 0, cos(b), 0],
              [0, 0, 0, 1]]
    let rz = [[cos(c), -sin(c), 0, 0],
              [sin(c), cos(c), 0, 0],
              [0, 0, 1, 0],
              [0, 0, 0, 1]]
    
    let rxy = dotProduct(rx, ry)
    let mtrx: [[Double]] = dotProduct(rxy, rz)
    return TransformationMatrix(mtrx)
}

public func RotationMatrix(axis: [Double], angle a: Double) -> TransformationMatrix {
    let message = "Axis should be 3 in size, found \(axis.count)"
    assert(axis.count == 3, message)
    let l = axis[0],
        m = axis[1],
        n = axis[2]
    let c = cos(a),
        s = sin(a)
    let mtrx: [[Double]] = [[l**2*(1-c)+c, m*l*(1-c)-n*s, n*l*(1-c)+m*s, 0],
                            [l*m*(1-c)+n*s, m**2*(1-c)+c, n*m*(1-c)-l*s, 0],
                            [l*n*(1-c)-m*s, m*n*(1-c)+l*s, n**2*(1-c)+c, 0],
                            [0, 0, 0, 1]]
    return TransformationMatrix(mtrx)
}
