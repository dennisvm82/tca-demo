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
        var daySchedule: IdentifiedArrayOf<DaySchedule> = []
    }
    
    enum Action {
        case onAppear
        case fetchDayScheduleResponse(Result<IdentifiedArrayOf<DaySchedule>, Error>)
        case path(StackAction<DayScheduleDetailStore.State, DayScheduleDetailStore.Action>)
    }
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .onAppear:
                return .run { send in
                    DispatchQueue.main.async {
                        DataManager.shared.fetchData { result in
                            send(.fetchDayScheduleResponse(result))
                        }
                    }
                }
            case .fetchDayScheduleResponse(let response):
                switch response {
                case .success(let result):
                    if state.daySchedule.isEmpty {
                        state.daySchedule = result
                    }
                    return .none
                case .failure(let error):
                    print("Failed to fetch data:", error)
                    return .none
                }
            case let .path(.element(id, action: .statusTapped(status))):
                if let dayId = state.path[id: id]?.schedule.id {
                    state.daySchedule[id: dayId]?.status = status
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
