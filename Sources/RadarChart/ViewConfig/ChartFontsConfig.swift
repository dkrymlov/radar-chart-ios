//
//  ChartFontsConfig.swift
//  RadarChart
//
//  Created by Данило Кримлов on 17.02.2026.
//

import SwiftUI

public struct ChartFontsConfig {
    public var fontSizeMultiplier: CGFloat
    public var fontWeight: Font.Weight
    
    public init(
        fontSizeMultiplier: CGFloat = 0.045,
        fontWeight: Font.Weight = .semibold
    ) {
        self.fontSizeMultiplier = fontSizeMultiplier
        self.fontWeight = fontWeight
    }
}
