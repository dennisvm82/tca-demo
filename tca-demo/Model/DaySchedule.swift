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
            String.Day.monday
        case .tuesday:
            String.Day.tuesday
        case .wednesday:
            String.Day.wednesday
        case .thursday:
            String.Day.thursday
        case .friday:
            String.Day.friday
        case .saturday:
            String.Day.saturday
        case .sunday:
            String.Day.sunday
        }
    }
}

enum Status: String, Decodable, CaseIterable {
    case free, busy, veryBusy
    
    var name: String {
        switch self {
        case .free:
            String.Status.free
        case .busy:
            String.Status.busy
        case .veryBusy:
            String.Status.veryBusy
        }
    }
    
    var color: Color {
        switch self {
        case .free:
            Color.Status.free
        case .busy:
            Color.Status.busy
        case .veryBusy:
            Color.Status.veryBusy
        }
    }
}
