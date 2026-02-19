//
//  ChartDataPointsConfig.swift
//  RadarChart
//
//  Created by Данило Кримлов on 17.02.2026.
//

import SwiftUI

public struct ChartDataPointsConfig {
    public var pointSize: CGSize
    public var pointColor: Color
    public var pointStrokeColor: Color
    public var pointStrokeWidth: CGFloat
    
    public init(
        pointSize: CGSize = .init(width: 8, height: 8),
        pointColor: Color = .yellow,
        pointStrokeColor: Color = .white,
        pointStrokeWidth: CGFloat = 2.0
    ) {
        self.pointSize = pointSize
        self.pointColor = pointColor
        self.pointStrokeColor = pointStrokeColor
        self.pointStrokeWidth = pointStrokeWidth
    }
}
