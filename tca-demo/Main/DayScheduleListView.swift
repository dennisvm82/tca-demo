//
//  DayScheduleListView.swift
//  tca-demo
//
//  Created by Dennis van Mazijk on 2023/12/10.
//

import SwiftUI
import ComposableArchitecture

struct DayScheduleListView: View {
    let store: StoreOf<DayScheduleListStore>
    
    var body: some View {
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            NavigationStack {
                List {
                    ForEach(viewStore.state.dayArray, id: \.id) { schedule in
                        NavigationLink(value: schedule) {
                            DayScheduleListRow(schedule: schedule)
                        }
                    }
                }
                .navigationTitle("Schedule")
                .navigationDestination(for: DaySchedule.self) { schedule in
                    IfLetStore(store.scope(state: \.scheduleDetailState, 
                                           action: DayScheduleListStore.Action.dayTapped)) { store in
                        DayScheduleDetailView(store: store)
                    }
                }
            }
        }
    }
}

struct DayScheduleListRow: View {
    var schedule: DaySchedule
    
    var body: some View {
        HStack {
            Text(schedule.day.name)
            Spacer()
            SquareView(color: schedule.status.color, size: 15)
        }
    }
}
