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
        case statusTapped(Day, Status)
    }
    
    var body: some ReducerOf<DayScheduleDetailStore> {
        Reduce { state, action in
            switch action {
            case .statusTapped(let day, let status):
                updateSelectedStatus(for: day, with: status)
                return .none
            }
        }
    }
    
    func updateSelectedStatus(for day: Day, with status: Status) {
//        if let index = scheduleArray.firstIndex(where: { $0.day == day }) {
//            scheduleArray[index].status = status
//        }
//        selectedStatus = status
    }
}
