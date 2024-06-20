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
            .Day.monday
        case .tuesday:
            .Day.tuesday
        case .wednesday:
            .Day.wednesday
        case .thursday:
            .Day.thursday
        case .friday:
            .Day.friday
        case .saturday:
            .Day.saturday
        case .sunday:
            .Day.sunday
        }
    }
}

enum Status: String, Decodable, CaseIterable {
    case free, busy, veryBusy
    
    var name: String {
        switch self {
        case .free:
            .Status.free
        case .busy:
            .Status.busy
        case .veryBusy:
            .Status.veryBusy
        }
    }
    
    var color: Color {
        switch self {
        case .free:
            .Status.free
        case .busy:
            .Status.busy
        case .veryBusy:
            .Status.veryBusy
        }
    }
}
