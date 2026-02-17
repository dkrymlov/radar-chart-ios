//
//  File.swift
//  RadarChart
//
//  Created by Данило Кримлов on 17.02.2026.
//

import Foundation

internal extension RadarChartConfig {
    static func mockConfig() -> RadarChartConfig {
        return RadarChartConfig(
            circleSteps: 4,
            backgroundConfig: .init(backgroungColor: .clear)
        )
    }
}
