//
//  DayScheduleViewModel.swift
//  tca-demo
//
//  Created by Dennis van Mazijk on 2023/12/16.
//

import SwiftUI

final class DayScheduleViewModel: ObservableObject {
    @Published var scheduleArray: [DaySchedule] = []
    @Published var selectedSchedule: Schedule?
    
    init() {
        scheduleArray = [
            DaySchedule(day: .monday, schedule: .busy),
            DaySchedule(day: .tuesday, schedule: .busy),
            DaySchedule(day: .wednesday, schedule: .busy),
            DaySchedule(day: .thursday, schedule: .veryBusy),
            DaySchedule(day: .friday, schedule: .veryBusy),
            DaySchedule(day: .saturday, schedule: .free),
            DaySchedule(day: .sunday, schedule: .free)
        ]
    }
    
    func updateSelectedSchedule(for day: Day, with schedule: Schedule) {
        if let index = scheduleArray.firstIndex(where: { $0.day == day }) {
            scheduleArray[index].schedule = schedule
        }
        selectedSchedule = schedule
    }
}
