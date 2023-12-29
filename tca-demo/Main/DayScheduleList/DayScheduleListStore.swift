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
        var days: IdentifiedArrayOf<DaySchedule> = []
    }
    
    enum Action: Equatable {
        case createDayScheduleList
        case path(StackAction<DayScheduleDetailStore.State, DayScheduleDetailStore.Action>)
    }
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .createDayScheduleList:
                if state.days.isEmpty {
                    state.days = [DaySchedule(day: .monday, status: .busy),
                                  DaySchedule(day: .tuesday, status: .busy),
                                  DaySchedule(day: .wednesday, status: .busy),
                                  DaySchedule(day: .thursday, status: .veryBusy),
                                  DaySchedule(day: .friday, status: .veryBusy),
                                  DaySchedule(day: .saturday, status: .free),
                                  DaySchedule(day: .sunday, status: .free)]
                }
                return .none
            case let .path(.element(id, action: .statusTapped(status))):
                if let dayId = state.path[id: id]?.schedule.id {
                    state.days[id: dayId]?.status = status
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
