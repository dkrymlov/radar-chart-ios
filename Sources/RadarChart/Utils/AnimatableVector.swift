//
//  AnimatableVector.swift
//  RadarChart
//
//  Created by Данило Кримлов on 17.02.2026.
//

import SwiftUI

internal struct AnimatableVector: VectorArithmetic {
    var values: [Double]
    
    static let zero = AnimatableVector(values: [])
    
    static func += (lhs: inout AnimatableVector, rhs: AnimatableVector) {
        let count = min(lhs.values.count, rhs.values.count)
        for i in 0..<count { lhs.values[i] += rhs.values[i] }
    }
    
    static func -= (lhs: inout AnimatableVector, rhs: AnimatableVector) {
        let count = min(lhs.values.count, rhs.values.count)
        for i in 0..<count { lhs.values[i] -= rhs.values[i] }
    }
    
    static func + (lhs: AnimatableVector, rhs: AnimatableVector) -> AnimatableVector {
        var result = lhs; result += rhs; return result
    }
    
    static func - (lhs: AnimatableVector, rhs: AnimatableVector) -> AnimatableVector {
        var result = lhs; result -= rhs; return result
    }
    
    mutating func scale(by rhs: Double) {
        for i in 0..<values.count { values[i] *= rhs }
    }
    
    var magnitudeSquared: Double {
        values.reduce(0) { $0 + $1 * $1 }
    }
    
    static func == (lhs: AnimatableVector, rhs: AnimatableVector) -> Bool {
        lhs.values == rhs.values
    }
}
