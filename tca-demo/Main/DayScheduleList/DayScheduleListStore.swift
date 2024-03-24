//
//  DayScheduleListStore.swift
//  tca-demo
//
//  Created by Dennis van Mazijk on 2023/12/18.
//

import SwiftUI
import ComposableArchitecture

@Reducer
struct DayScheduleListStore {
    @ObservableState
    struct State: Equatable {
        var path = StackState<Path.State>()
        var daySchedule: IdentifiedArrayOf<DaySchedule> = []
    }

    enum Action {
        case loadData
        case fetchDayScheduleResponse(Result<IdentifiedArrayOf<DaySchedule>, Error>)
        case path(StackAction<Path.State, Path.Action>)
    }

    @Reducer(state: .equatable)
    enum Path {
        case scheduleDetail(DayScheduleDetailStore)
    }

    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .loadData:
                return .run { send in
                    DispatchQueue.main.async {
                        DataManager.shared.fetchData { result in
                            send(.fetchDayScheduleResponse(result))
                        }
                    }
                }
            case .fetchDayScheduleResponse(.success(let result)):
                if state.daySchedule.isEmpty {
                    state.daySchedule = result
                }
                return .none
            case .fetchDayScheduleResponse(.failure(let error)):
                print("Error:", error.localizedDescription)
                return .none
            case let .path(.element(id, action: .scheduleDetail(.statusTapped(status)))):
                if let dayId = state.path[id: id]?.scheduleDetail?.schedule.id {
                    state.daySchedule[id: dayId]?.status = status
                }
                return .none
            default:
                return .none
            }
        }
        .forEach(\.path, action: \.path)
    }
}
