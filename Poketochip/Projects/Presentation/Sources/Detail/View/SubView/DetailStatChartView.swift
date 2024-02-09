//
//  DetailStatChartView.swift
//  Presentation
//
//  Created by 윤지호 on 1/25/24.
//

import SwiftUI
import Charts

struct DetailStatChartView: View {
    @ObservedObject var statStore = StateStore()

    var body: some View {
        Chart(statStore.stat) { stat in
            BarMark(
                xStart: .value("Stat", 0),
                xEnd: .value("Stat", 260),
                y: .value("Type", stat.type.string),
                height: 19
            )
            .foregroundStyle(.gray)
            .cornerRadius(6)

            BarMark(
                xStart: .value("Stat", 0),
                xEnd: .value("Stat", stat.stat),
                y: .value("Type", stat.type.rawValue),
                height: 19
            )
            .cornerRadius(6)
            .foregroundStyle(by: .value("Type", stat.type.string))
            .annotation(position: .leading, alignment: .leading) {
                Text("\(stat.type.string)")
                    .frame(width: 85, alignment: .leading)
            }
            .annotation(position: .trailing) {
                Text("\(stat.stat)")
            }
            
        }
        .chartLegend(.hidden)
        .chartXAxis(.hidden)
        .chartYAxis(.hidden)
    }
}
