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
    }
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case let .path(.element(id: id, action: .statusTapped(schedule, status))):
                if let index = state.days.firstIndex(where: { $0.day == schedule.day }) {
                    state.days[index].status = status
                }
                return .none
            default:
                return .none
            }
        }
        .forEach(\.path, action: /Action.path) {
            DayScheduleDetailStore()
        }
    }
}
