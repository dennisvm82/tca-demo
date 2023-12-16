//
//  DayScheduleListView.swift
//  tca-demo
//
//  Created by Dennis van Mazijk on 2023/12/10.
//

import SwiftUI

struct DayScheduleListView: View {
    @EnvironmentObject var viewModel: DayScheduleViewModel
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.scheduleArray, id: \.id) { daySchedule in
                    NavigationLink(value: daySchedule) {
                        DayScheduleListRow(daySchedule: daySchedule)
                    }
                }
            }
            .navigationTitle("Schedule")
            .navigationDestination(for: DaySchedule.self) { daySchedule in
                DayScheduleDetailView(daySchedule: daySchedule)
            }
        }
    }
}

struct DayScheduleListRow: View {
    var daySchedule: DaySchedule
    
    var body: some View {
        HStack {
            Text(daySchedule.day.name)
            Spacer()
            SquareView(color: daySchedule.schedule.color, size: 15)
        }
    }
}
