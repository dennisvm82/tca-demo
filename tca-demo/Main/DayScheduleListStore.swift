//
//  DayScheduleListStore.swift
//  tca-demo
//
//  Created by Dennis van Mazijk on 2023/12/18.
//

import SwiftUI
import ComposableArchitecture

struct DayScheduleListStore: Reducer {
    struct State: Equatable {
        var path = StackState<DayScheduleDetailStore.State>()
        var days: [DaySchedule]
    }
    
    enum Action: Equatable {
        case path(StackAction<DayScheduleDetailStore.State, DayScheduleDetailStore.Action>)
        case dayTapped(DaySchedule)
    }
    
    var body: some ReducerOf<DayScheduleListStore> {
        Reduce { state, action in
            switch action {
            case .path:
                return .none
            case .dayTapped(let daySchedule):
                if let index = state.days.firstIndex(where: { $0.day == daySchedule.day }) {
                    state.days[index].status = daySchedule.status
                }
                return .none
            }
        }
        .forEach(\.path, action: /Action.path) {
            DayScheduleDetailStore()
        }
    }
}
