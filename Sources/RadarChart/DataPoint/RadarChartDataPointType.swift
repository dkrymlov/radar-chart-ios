//
//  RadarChartDataPointType.swift
//  RadarChart
//
//  Created by Данило Кримлов on 17.02.2026.
//

import Foundation

public protocol RadarChartDataPointType: Identifiable, Codable {
    var id: String { get }
    var label: String { get }
    var value: Double { get set }
    var emoji: String? { get }
}

