//
//  DaySchedule.swift
//  tca-demo
//
//  Created by Dennis van Mazijk on 2023/12/10.
//

import SwiftUI

struct DaySchedule: Identifiable, Hashable {
    var id = UUID()
    var day: Day
    var schedule: Schedule
}

enum Day {
    case monday, tuesday, wednesday, thursday, friday, saturday, sunday
    
    var name: String {
        switch self {
        case .monday:
            "Monday"
        case .tuesday:
            "Tuesday"
        case .wednesday:
            "Wednesday"
        case .thursday:
            "Thursday"
        case .friday:
            "Friday"
        case .saturday:
            "Saturday"
        case .sunday:
            "Sunday"
        }
    }
}

enum Schedule {
    case free, busy, veryBusy
    
    var string: String {
        switch self {
        case .free:
            "Free"
        case .busy:
            "Busy"
        case .veryBusy:
            "Very busy"
        }
    }
    
    var color: Color {
        switch self {
        case .free:
            .scheduleFreeColor
        case .busy:
            .scheduleBusyColor
        case .veryBusy:
            .scheduleVeryBusyColor
        }
    }
}
