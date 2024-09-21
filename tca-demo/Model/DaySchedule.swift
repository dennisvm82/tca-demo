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
         return rawValue.capitalized
     }
}

enum Status: String, Decodable, CaseIterable {
    case free, busy, veryBusy
    
    var name: String {
         return rawValue.capitalized
     }

    var color: Color {
        switch self {
        case .free:
            return .green
        case .busy:
            return .orange
        case .veryBusy:
            return .red
        }
    }
}
