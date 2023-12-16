//
//  DayScheduleListView.swift
//  tca-demo
//
//  Created by Dennis van Mazijk on 2023/12/10.
//

import SwiftUI

struct DayScheduleListView: View {
    let scheduleArray = [
        DaySchedule(day: .monday, schedule: .busy),
        DaySchedule(day: .tuesday, schedule: .busy),
        DaySchedule(day: .wednesday, schedule: .busy),
        DaySchedule(day: .thursday, schedule: .veryBusy),
        DaySchedule(day: .friday, schedule: .veryBusy),
        DaySchedule(day: .saturday, schedule: .free),
        DaySchedule(day: .sunday, schedule: .free)
    ]

    var body: some View {
        NavigationStack {
            List {
                ForEach(scheduleArray, id: \.id) { daySchedule in
                    NavigationLink(value: daySchedule) {
                        DayScheduleRow(daySchedule: daySchedule)
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

struct DayScheduleRow: View {
    var daySchedule: DaySchedule
    
    var body: some View {
        HStack {
            Text(daySchedule.day.name)
            Spacer()
            SquareView(color: daySchedule.schedule.color, size: 15)
        }
    }
}

#Preview {
    DayScheduleListView()
}
