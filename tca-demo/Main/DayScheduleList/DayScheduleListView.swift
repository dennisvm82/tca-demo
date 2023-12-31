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
        NavigationStackStore(store.scope(state: \.path, action: { .path($0) })) {
            WithViewStore(store, observe: { $0 }) { viewStore in
                List {
                    ForEach(viewStore.state.daySchedule, id: \.id) { schedule in
                        NavigationLink(state: DayScheduleDetailStore.State(schedule: schedule)) {
                            DayScheduleListRow(schedule: schedule)
                        }
                    }
                }
                .alert(store: store.scope(state: \.$alert, action: { .alert($0) }))
                .navigationTitle("Schedule")
                .onAppear {
                    viewStore.send(.onAppear)
                }
            }
        } destination: { store in
            DayScheduleDetailView(store: store)
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
