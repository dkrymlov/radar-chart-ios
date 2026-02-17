//
//  File.swift
//  RadarChart
//
//  Created by Данило Кримлов on 17.02.2026.
//

import Foundation

internal extension Array<RadarChartDataPoint> {
    static func getMockData() -> [RadarChartDataPoint] {
        return [
            RadarChartDataPoint(id: "love", label: "Love", value: 0.8, emoji: "❤️"),
            RadarChartDataPoint(id: "trust", label: "Trust", value: 0.65, emoji: "🔒"),
            RadarChartDataPoint(id: "intimacy", label: "Intimacy", value: 0.9, emoji: "🔥"),
            RadarChartDataPoint(id: "happiness", label: "Happiness", value: 0.4, emoji: "😊"),
            RadarChartDataPoint(id: "respect", label: "Respect", value: 0.5, emoji: "🤝"),
        ]
    }
}
