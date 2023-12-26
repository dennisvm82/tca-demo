//
//  DayScheduleDetailView.swift
//  tca-demo
//
//  Created by Dennis van Mazijk on 2023/12/10.
//

import SwiftUI
import ComposableArchitecture

struct DayScheduleDetailView: View {
    let store: StoreOf<DayScheduleDetailStore>
    
    var body: some View {
        WithViewStore(store, observe: { $0 }) { viewStore in
            List {
                ForEach(Status.allCases, id: \.self) { status in
                    DayScheduleDetailRow(status: status, isSelected: status == viewStore.schedule.status)
                        .onTapGesture {
                            store.send(.statusTapped(status))
                        }
                }
            }
            .navigationTitle(viewStore.schedule.day.name)
        }
    }
}

struct DayScheduleDetailRow: View {
    var status: Status
    var isSelected: Bool
    
    var body: some View {
        HStack {
            SquareView(color: status.color, size: 15)
            Text(status.string)
            Spacer()
            
            if isSelected {
                Image(systemName: "checkmark")
                    .foregroundStyle(.blue)
            }
        }
        .contentShape(Rectangle())
    }
}
