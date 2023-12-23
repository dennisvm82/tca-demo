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
        var dayArray: [DaySchedule]
        var scheduleDetailState: DayScheduleDetailStore.State?
    }
    
    enum Action: Equatable {
        case dayTapped(DayScheduleDetailStore.Action)
    }
    
    var body: some Reducer<State, Action> {
        Reduce { state, action in
            switch action {
            case .dayTapped:
                return .none
            }
        }
    }
}
