//
//  Color+Extensions.swift
//  tca-demo
//
//  Created by Dennis van Mazijk on 2023/12/10.
//

import SwiftUI

extension Color {
    enum Status {
        static var free: Color { Color(.green) }
        static var busy: Color { Color(.orange) }
        static var veryBusy: Color { Color(.red) }
    }
}
