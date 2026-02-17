//
//  RadarChartConfig.swift
//  RadarChart
//
//  Created by Данило Кримлов on 17.02.2026.
//

import SwiftUI

public struct RadarChartConfig {
    public let circleSteps: Int
    public let backgroundConfig: ChartBackgroundConfig
    public var chartConfig: ChartConfig = .init()
    public var linesConfig: ChartLinesConfig = .init()
    public var dataPointsConfig: ChartDataPointsConfig = .init()
    public var fontsConfig: ChartFontsConfig = .init()
}
