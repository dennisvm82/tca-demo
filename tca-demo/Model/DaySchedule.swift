//
//  DaySchedule.swift
//  tca-demo
//
//  Created by Dennis van Mazijk on 2023/12/10.
//

import SwiftUI

struct DaySchedule: Decodable, Identifiable, Hashable {
    var id = UUID()
    var day: Day
    var status: Status
    
    enum CodingKeys: String, CodingKey {
        case day
        case status
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        day = try values.decode(Day.self, forKey: .day)
        status = try values.decode(Status.self, forKey: .status)
    }
}

enum Day: String, Decodable {
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

enum Status: String, Decodable, CaseIterable {
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
