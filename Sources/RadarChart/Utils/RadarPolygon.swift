//
//  RadarPolygon.swift
//  RadarChart
//
//  Created by Данило Кримлов on 17.02.2026.
//

import SwiftUI

internal struct RadarPolygon: Shape {
    var values: AnimatableVector
    var center: CGPoint
    var radius: CGFloat
    
    var animatableData: AnimatableVector {
        get { values }
        set { values = newValue }
    }
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        guard !values.values.isEmpty else { return path }
        
        for (index, value) in values.values.enumerated() {
            let angle = (Double(index) / Double(values.values.count)) * 2 * .pi - .pi / 2
            let valueRadius = radius * CGFloat(value)
            let point = CGPoint(
                x: center.x + valueRadius * cos(angle),
                y: center.y + valueRadius * sin(angle)
            )
            
            if index == 0 {
                path.move(to: point)
            } else {
                path.addLine(to: point)
            }
        }
        path.closeSubpath()
        return path
    }
}
