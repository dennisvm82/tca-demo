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
        var statusTypes = Status.allCases
        var daySchedule: DaySchedule
    }
    
    enum Action: Equatable {
        case statusTapped
    }
    
    var body: some Reducer<State, Action> {
        Reduce { state, action in
            switch action {
            case .statusTapped:
                return .none
            }
        }
    }
    
//    func updateSelectedStatus(for day: Day, with status: Status) {
//        if let index = scheduleArray.firstIndex(where: { $0.day == day }) {
//            scheduleArray[index].status = status
//        }
//        selectedStatus = status
//    }
}
