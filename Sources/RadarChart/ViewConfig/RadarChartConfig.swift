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
    public var chartConfig: ChartConfig
    public var linesConfig: ChartLinesConfig
    public var dataPointsConfig: ChartDataPointsConfig
    public var fontsConfig: ChartFontsConfig
    
    public init(
        circleSteps: Int,
        backgroundConfig: ChartBackgroundConfig,
        chartConfig: ChartConfig = .init(),
        linesConfig: ChartLinesConfig = .init(),
        dataPointsConfig: ChartDataPointsConfig = .init(),
        fontsConfig: ChartFontsConfig = .init()
    ) {
        self.circleSteps = circleSteps
        self.backgroundConfig = backgroundConfig
        self.chartConfig = chartConfig
        self.linesConfig = linesConfig
        self.dataPointsConfig = dataPointsConfig
        self.fontsConfig = fontsConfig
    }
}
