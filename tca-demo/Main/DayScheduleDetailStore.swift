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
        var daySchedule: DaySchedule
    }
    
    enum Action: Equatable {
        case statusTapped(Status)
    }
    
    var body: some ReducerOf<DayScheduleDetailStore> {
        Reduce { state, action in
            switch action {
            case .statusTapped(let status):
                state.daySchedule.status = status
                return .none
            }
        }
    }
}
