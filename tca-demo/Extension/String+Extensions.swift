//
//  String+Extensions.swift
//  tca-demo
//
//  Created by Dennis van Mazijk on 2024/05/18.
//

import Foundation

extension String {
    enum Day {
        static var monday: String { "Monday" }
        static var tuesday: String { "Tuesday" }
        static var wednesday: String { "Wednesday" }
        static var thursday: String { "Thursday" }
        static var friday: String { "Friday" }
        static var saturday: String { "Saturday" }
        static var sunday: String { "Sunday" }
    }
    enum Status {
        static var free: String { "Free" }
        static var busy: String { "Busy" }
        static var veryBusy: String { "Very busy" }
    }
}
