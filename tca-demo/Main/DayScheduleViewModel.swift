//
//  DayScheduleViewModel.swift
//  tca-demo
//
//  Created by Dennis van Mazijk on 2023/12/16.
//

import SwiftUI

final class DayScheduleViewModel: ObservableObject {
    @Published var scheduleArray: [DaySchedule] = []
    @Published var selectedStatus: Status?
    
    init() {
        scheduleArray = [
            DaySchedule(day: .monday, status: .busy),
            DaySchedule(day: .tuesday, status: .busy),
            DaySchedule(day: .wednesday, status: .busy),
            DaySchedule(day: .thursday, status: .veryBusy),
            DaySchedule(day: .friday, status: .veryBusy),
            DaySchedule(day: .saturday, status: .free),
            DaySchedule(day: .sunday, status: .free)
        ]
    }
    
    func updateSelectedStatus(for day: Day, with status: Status) {
        if let index = scheduleArray.firstIndex(where: { $0.day == day }) {
            scheduleArray[index].status = status
        }
        selectedStatus = status
    }
}
