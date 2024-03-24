//
//  DayScheduleListView.swift
//  tca-demo
//
//  Created by Dennis van Mazijk on 2023/12/10.
//

import SwiftUI
import ComposableArchitecture

struct DayScheduleListView: View {
    @Bindable var store: StoreOf<DayScheduleListStore>

    var body: some View {
        NavigationStack(path: $store.scope(state: \.path, action: \.path)) {
            List {
                ForEach(store.state.daySchedule, id: \.id) { schedule in
                    NavigationLink(state: DayScheduleListStore.Path.State.scheduleDetail(DayScheduleDetailStore.State(schedule: schedule))) {
                        DayScheduleListRow(schedule: schedule)
                    }
                }
            }
            .navigationTitle("Schedule")
            .onAppear {
                store.send(.loadData)
            }
        } destination: { store in
            switch store.case {
            case let .scheduleDetail(store):
                DayScheduleDetailView(store: store)
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
