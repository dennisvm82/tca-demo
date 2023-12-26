//
//  tca_demoApp.swift
//  tca-demo
//
//  Created by Dennis van Mazijk on 2023/12/10.
//

import SwiftUI
import ComposableArchitecture

@main
struct tca_demoApp: App {
    var body: some Scene {
        WindowGroup {
            let days = IdentifiedArray(arrayLiteral:
                DaySchedule(day: .monday, status: .busy),
                DaySchedule(day: .tuesday, status: .busy),
                DaySchedule(day: .wednesday, status: .busy),
                DaySchedule(day: .thursday, status: .veryBusy),
                DaySchedule(day: .friday, status: .veryBusy),
                DaySchedule(day: .saturday, status: .free),
                DaySchedule(day: .sunday, status: .free)
            )
                          
            DayScheduleListView(store: Store(initialState: DayScheduleListStore.State(days: days), reducer: {
                DayScheduleListStore()
            }))
        }
    }
}
