//
//  SwiftUIView.swift
//  RadarChart
//
//  Created by Данило Кримлов on 17.02.2026.
//

import SwiftUI

private struct ExampleChartView: View {
    @StateObject var viewModel: RadarChartViewModel
    
    init() {
        let vm = RadarChartViewModel(
            data: .getMockData(),
            config: .mockConfig()
        )
        _viewModel = StateObject(wrappedValue: vm)
    }
    
    var body: some View {
        ZStack {
            background
                .ignoresSafeArea()
            
            chart
                .frame(width: 350)
        }
    }
    
    private var chart: some View {
        RadarChartView(
            viewModel: viewModel,
            centerContent: {
                chartCenterContent
            }
        )
    }
    
    private var chartCenterContent: some View {
        Image(systemName: "brain.fill")
            .resizable()
            .scaledToFit()
            .foregroundStyle(.black)
    }
    
    private var background: LinearGradient {
        .linearGradient(
            colors: [
                .green.opacity(0.2),
                .red.opacity(0.2)
            ],
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
    }
}

#Preview {
    ExampleChartView()
}
