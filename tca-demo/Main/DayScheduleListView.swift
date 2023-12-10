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
        NavigationView {
            List {
                ForEach(scheduleArray, id: \.id) { daySchedule in
                    NavigationLink(destination: DayScheduleDetailView(daySchedule: daySchedule)) {
                        DayScheduleRow(daySchedule: daySchedule)
                    }
                }
            }
            .navigationTitle("Schedule")
        }
    }
}

struct DayScheduleRow: View {
    var daySchedule: DaySchedule
    
    var body: some View {
        HStack {
            Text(daySchedule.day.name)
            Spacer()
            Rectangle()
                .fill(daySchedule.schedule.color)
                .frame(width: 15, height: 15)
        }
    }
}

#Preview {
    DayScheduleListView()
}
