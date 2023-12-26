//
//  DayScheduleDetailStore.swift
//  tca-demo
//
//  Created by Dennis van Mazijk on 2023/12/18.
//

import SwiftUI
import ComposableArchitecture

struct DayScheduleDetailStore: Reducer {
    struct State: Equatable {
        var schedule: DaySchedule
    }
    
    enum Action: Equatable {
        case statusTapped(Status)
    }
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .statusTapped(let status):
                state.schedule.status = status
                return .none
            }
        }
    }
}
