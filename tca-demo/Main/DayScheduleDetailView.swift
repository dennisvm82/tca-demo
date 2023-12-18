//
//  DayScheduleDetailView.swift
//  tca-demo
//
//  Created by Dennis van Mazijk on 2023/12/10.
//

import SwiftUI

struct DayScheduleDetailView: View {
    @EnvironmentObject var viewModel: DayScheduleViewModel
    
    let schedule: DaySchedule
    
    var body: some View {
        List {
            ForEach(Status.allCases, id: \.self) { status in
                DayScheduleDetailRow(status: status, isSelected: status == viewModel.selectedStatus)
                    .onTapGesture {
                        viewModel.updateSelectedStatus(for: schedule.day, with: status)
                    }
            }
        }
        .onAppear { viewModel.selectedStatus = schedule.status}
        .navigationTitle(schedule.day.name)
    }
}

struct DayScheduleDetailRow: View {
    var status: Status
    var isSelected: Bool
    
    var body: some View {
        HStack {
            SquareView(color: status.color, size: 15)
            Text(status.string)
            Spacer()
            
            if isSelected {
                Image(systemName: "checkmark")
                    .foregroundStyle(.blue)
            }
        }
        .contentShape(Rectangle()) // Make the whole row tappable
    }
}
