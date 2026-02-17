//
//  RadarChartDataPoint.swift
//  RadarChart
//
//  Created by Данило Кримлов on 17.02.2026.
//

import Foundation

public struct RadarChartDataPoint: RadarChartDataPointType {
    public let id: String
    public let label: String
    public let emoji: String?
    public var value: Double
    
    init(id: String, label: String, value: Double, emoji: String? = nil) {
        self.id = id
        self.label = label
        self.value = value
        self.emoji = emoji
    }
}
