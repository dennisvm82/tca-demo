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
        @PresentationState var alert: AlertState<Action.Alert>?
        var path = StackState<DayScheduleDetailStore.State>()
        var daySchedule: IdentifiedArrayOf<DaySchedule> = []
    }
    
    enum Action {
        case onAppear
        case fetchDayScheduleResponse(Result<IdentifiedArrayOf<DaySchedule>, Error>)
        case path(StackAction<DayScheduleDetailStore.State, DayScheduleDetailStore.Action>)
        case alert(PresentationAction<Alert>)
        
        enum Alert: Equatable {
            case alertDismissed
        }
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
            case .fetchDayScheduleResponse(.success(let result)):
                if state.daySchedule.isEmpty {
                    state.daySchedule = result
                }
                return .none
            case .fetchDayScheduleResponse(.failure(let error)):
                state.alert = AlertState(
                    title: TextState("Error"),
                    message: TextState(error.localizedDescription),
                    dismissButton: .default(TextState("OK"), action: .send(.alertDismissed))
                )
                return .none
            case .alert(.presented(.alertDismissed)):
                state.alert = nil
                return .none
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
