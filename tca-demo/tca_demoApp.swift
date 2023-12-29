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
            DayScheduleListView(store: Store(initialState: DayScheduleListStore.State(),
                                reducer: { DayScheduleListStore() }))
        }
    }
}
