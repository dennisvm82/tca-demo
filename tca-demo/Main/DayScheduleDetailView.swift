//
//  DayScheduleDetailView.swift
//  tca-demo
//
//  Created by Dennis van Mazijk on 2023/12/10.
//

import SwiftUI

struct DayScheduleDetailView: View {
    @EnvironmentObject var viewModel: DayScheduleViewModel
    
    let daySchedule: DaySchedule
    
    var body: some View {
        List {
            ForEach(Schedule.allCases, id: \.self) { schedule in
                DayScheduleDetailRow(schedule: schedule, isSelected: schedule == viewModel.selectedSchedule)
                    .onTapGesture {
                        viewModel.updateSelectedSchedule(for: daySchedule.day, with: schedule)
                    }
            }
        }
        .onAppear { viewModel.selectedSchedule = daySchedule.schedule }
        .navigationTitle(daySchedule.day.name)
    }
}

struct DayScheduleDetailRow: View {
    var schedule: Schedule
    var isSelected: Bool
    
    var body: some View {
        HStack {
            SquareView(color: schedule.color, size: 15)
            Text(schedule.string)
            Spacer()
            
            if isSelected {
                Image(systemName: "checkmark")
                    .foregroundStyle(.blue)
            }
        }
        .contentShape(Rectangle())
    }
}
