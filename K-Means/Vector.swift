//
//  Vector.swift
//  K-Means
//
//  Created by Justin Purnell on 9/26/16.
//  Copyright © 2016 Justin Purnell. All rights reserved.
//

import Foundation

struct Vector: CustomStringConvertible, Equatable {
    private(set) var length = 0
    private(set) var data: [Double]
    
    init(_ data: [Double]) {
        self.data = data
        self.length = data.count
    }
    
    var description: String {
        return "Vector (\(data))"
    }
    
    func distanceTo(other: Vector) -> Double {
        var result = 0.0
        for idx in 0..<length {
            result += pow(data[idx] - other.data[idx], 2.0)
        }
        return sqrt(result)
    }
}

func == (lhs: Vector, rhs: Vector) -> Bool {
    for idx in 0..<lhs.length {
        if lhs.data[idx] != rhs.data[idx] {
            return false
        }
    }
    return true
}

func + (lhs: Vector, rhs: Vector) -> Vector {
    var results = [Double]()
    for idx in 0..<lhs.length {
        results.append(lhs.data[idx] + rhs.data[idx])
    }
    return Vector(results)
}

func += (lhs: inout Vector, rhs: Vector) {
    lhs = lhs + rhs
}

func - (lhs: Vector, rhs: Vector) -> Vector {
    var results = [Double]()
    for idx in 0..<lhs.length{
        results.append(lhs.data[idx] - rhs.data[idx])
    }
    return Vector(results)
}

func -= (lhs: inout Vector, rhs: Vector) {
    lhs = lhs - rhs
}

func / (lhs: Vector, rhs: Double) -> Vector {
    var results = [Double](repeating: 0, count: lhs.length)
    for (idx, value) in lhs.data.enumerated() {
        results[idx] = value / rhs
    }
    return Vector(results)
}

func /= (lhs: inout Vector, rhs: Double) {
    lhs = lhs / rhs
}
