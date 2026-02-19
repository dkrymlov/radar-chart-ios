//
//  ChartConfig.swift
//  RadarChart
//
//  Created by Данило Кримлов on 17.02.2026.
//

import SwiftUI

public struct ChartConfig {
    public var chartFill: LinearGradient
    public var chartStroke: Color = .green.opacity(0.5)
    public var chartStrokeWidth: CGFloat = 1.0
    
    public init(
        chartFill: LinearGradient = LinearGradient(colors: [
            .green.opacity(0.6),
            .red.opacity(0.2)
        ], startPoint: .topLeading, endPoint: .bottomTrailing),
        chartStroke: Color = .green.opacity(0.5),
        chartStrokeWidth: CGFloat = 1.0
    ) {
        self.chartFill = chartFill
        self.chartStroke = chartStroke
        self.chartStrokeWidth = chartStrokeWidth
    }
}
