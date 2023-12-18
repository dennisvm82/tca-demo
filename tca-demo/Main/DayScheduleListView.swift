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
                ForEach(viewModel.scheduleArray, id: \.id) { schedule in
                    NavigationLink(value: schedule) {
                        DayScheduleListRow(schedule: schedule)
                    }
                }
            }
            .navigationTitle("Schedule")
            .navigationDestination(for: DaySchedule.self) { schedule in
                DayScheduleDetailView(schedule: schedule)
            }
        }
    }
}

struct DayScheduleListRow: View {
    var schedule: DaySchedule
    
    var body: some View {
        HStack {
            Text(schedule.day.name)
            Spacer()
            SquareView(color: schedule.status.color, size: 15)
        }
    }
}
