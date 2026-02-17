//
//  SwiftUIView.swift
//  RadarChart
//
//  Created by Данило Кримлов on 17.02.2026.
//

import SwiftUI
import Foundation

public struct RadarChartView<CenterContent: View>: View {
    @ObservedObject private var viewModel: RadarChartViewModel
    @State private var isVisible = false
    
    private let centerContent: () -> CenterContent
    
    public init(
        viewModel: RadarChartViewModel,
        @ViewBuilder centerContent: @escaping () -> CenterContent
    ) {
        _viewModel = ObservedObject(wrappedValue: viewModel)
        self.centerContent = centerContent
    }
    
    private var axisCount: Int {
        viewModel.data.count
    }
    
    private var config: RadarChartConfig {
        viewModel.config
    }
    
    private var linesConfig: ChartLinesConfig {
        config.linesConfig
    }
    
    private var chartConfig: ChartConfig {
        config.chartConfig
    }
    
    private var backgroundConfig: ChartBackgroundConfig {
        config.backgroundConfig
    }
    
    private var fontsConfig: ChartFontsConfig {
        config.fontsConfig
    }
    
    private var dataPointsConfig: ChartDataPointsConfig {
        config.dataPointsConfig
    }
    
    public var body: some View {
        GeometryReader { geometry in
            let rect = geometry.frame(in: .local)
            let center = CGPoint(x: rect.midX, y: rect.midY)
            let radius = min(rect.width, rect.height) / 2 * 0.85
            let fontSize = min(rect.width, rect.height) * fontsConfig.fontSizeMultiplier
            let innerRadius = radius / CGFloat(config.circleSteps)
            
            let currentValues = AnimatableVector(values: viewModel.data.map { $0.value })
            
            ZStack {
                drawGrid(center: center, radius: radius)
                
                drawInnerCircle(innerRadius: innerRadius)
                    .scaleEffect(isVisible ? 1 : 0)
                    .opacity(isVisible ? 1 : 0)
                
                RadarPolygon(values: currentValues, center: center, radius: radius)
                    .fill(chartConfig.chartFill)
                    .opacity(isVisible ? 1 : 0)
                
                RadarPolygon(values: currentValues, center: center, radius: radius)
                    .stroke(
                        chartConfig.chartStroke,
                        lineWidth: chartConfig.chartStrokeWidth
                    )
                    .opacity(isVisible ? 1 : 0)
                
                drawDataPoints(center: center, radius: radius)
                    .opacity(isVisible ? 1 : 0)
                
                drawLabels(center: center, radius: radius, fontSize: fontSize)
                    .opacity(isVisible ? 1 : 0)
            }
            .onAppear {
                withAnimation(.easeOut(duration: 0.8)) {
                    self.isVisible = true
                }
            }
        }
    }
    
    private func drawInnerCircle(innerRadius: CGFloat) -> some View {
        ZStack {
            Circle()
                .fill(backgroundConfig.backgroungColor)
                .frame(width: innerRadius * 2, height: innerRadius * 2)
            
            centerContent()
                .frame(width: innerRadius * 0.7, height: innerRadius * 0.7)
                .clipShape(Circle())
            
            Circle()
                .stroke(linesConfig.lineColor, lineWidth: linesConfig.lineWidth)
                .frame(width: innerRadius * 2, height: innerRadius * 2)
        }
    }
    
    private func drawGrid(center: CGPoint, radius: CGFloat) -> some View {
        ZStack {
            ForEach(1...config.circleSteps, id: \.self) { step in
                let stepRadius = radius * (CGFloat(step) / CGFloat(config.circleSteps))
                Circle()
                    .stroke(linesConfig.lineColor, lineWidth: linesConfig.lineWidth)
                    .frame(width: stepRadius * 2, height: stepRadius * 2)
                    .scaleEffect(isVisible ? 1 : 0.1)
                    .opacity(isVisible ? 1 : 0)
                    .animation(.easeOut(duration: 0.5).delay(Double(step) * 0.1), value: isVisible)
            }
            
            Path { path in
                for index in 0..<axisCount {
                    let angle = viewModel.angleForIndex(index)
                    let endPoint = viewModel.pointOnCircle(center: center, radius: radius, angle: angle)
                    path.move(to: center)
                    path.addLine(to: endPoint)
                }
            }
            .trim(from: 0, to: isVisible ? 1 : 0)
            .stroke(linesConfig.lineColor, lineWidth: linesConfig.lineWidth)
            .animation(.easeInOut(duration: 1.0), value: isVisible)
        }
    }
    
    private func drawDataPoints(center: CGPoint, radius: CGFloat) -> some View {
        ForEach(0..<axisCount, id: \.self) { index in
            let item = viewModel.data[index]
            let angle = viewModel.angleForIndex(index)
            let valueRadius = radius * CGFloat(item.value)
            let point = viewModel.pointOnCircle(center: center, radius: valueRadius, angle: angle)
            Circle()
                .fill(dataPointsConfig.pointColor)
                .frame(width: dataPointsConfig.pointSize.width, height: dataPointsConfig.pointSize.height)
                .overlay(Circle().stroke(dataPointsConfig.pointStrokeColor, lineWidth: dataPointsConfig.pointStrokeWidth))
                .position(point)
        }
    }
    
    private func drawLabels(center: CGPoint, radius: CGFloat, fontSize: CGFloat) -> some View {
        ForEach(0..<axisCount, id: \.self) { index in
            let item = viewModel.data[index]
            let angle = viewModel.angleForIndex(index)
            let labelPoint = viewModel.pointOnCircle(center: center, radius: radius * 1.15, angle: angle)
            VStack(spacing: 2) {
                Text(item.label).fontWeight(fontsConfig.fontWeight).foregroundColor(.primary)
                if let icon = item.emoji { Text(icon) }
            }
            .font(.system(size: fontSize))
            .position(labelPoint)
        }
    }
}

