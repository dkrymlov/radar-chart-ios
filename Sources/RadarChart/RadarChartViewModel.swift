//
//  RadarChartViewModel.swift
//  RadarChart
//
//  Created by Данило Кримлов on 17.02.2026.
//

import Foundation
import SwiftUI

@MainActor
public final class RadarChartViewModel: ObservableObject {
    @Published public var data: [RadarChartDataPoint] = []
    
    internal let config: RadarChartConfig
    
    public init(
        data: [RadarChartDataPoint],
        config: RadarChartConfig
    ) {
        self.data = data.map { point in
            .init(id: point.id, label: point.label, value: 0.5, emoji: point.emoji)
        }
        self.config = config
        self.showActualData(data)
    }
    
    public func rewriteData(data: [RadarChartDataPoint]) {
        withAnimation(.easeInOut(duration: 0.8)) {
            self.data = data
        }
    }
    
    public func modifyData(id: String, value: Double) {
        guard let index = self.data.firstIndex(where: { $0.id == id }) else { return }

        var temp = self.data[index]
        temp.value = value
        
        withAnimation(.easeInOut(duration: 0.8)) {
            self.data[index] = temp
        }
    }
    
    internal func angleForIndex(_ index: Int) -> Double {
        return (Double(index) / Double(data.count)) * 2 * .pi - .pi / 2
    }
    
    internal func pointOnCircle(center: CGPoint, radius: CGFloat, angle: Double) -> CGPoint {
        return CGPoint(x: center.x + radius * cos(angle), y: center.y + radius * sin(angle))
    }
    
    private func showActualData(_ data: [RadarChartDataPoint]) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0, execute: {
            self.rewriteData(data: data)
        })
    }
}
