//
//  DayScheduleDetailView.swift
//  tca-demo
//
//  Created by Dennis van Mazijk on 2023/12/10.
//

import SwiftUI
import ComposableArchitecture

struct DayScheduleDetailView: View {
    @Environment(\.dismiss) var dismiss
    
    @Bindable var store: StoreOf<DayScheduleDetailStore>

    var body: some View {
        List {
            ForEach(Status.allCases, id: \.self) { status in
                DayScheduleDetailRow(status: status, isSelected: status == store.schedule.status)
                    .allowsHitTesting(status != store.schedule.status)
                    .onTapGesture {
                        store.send(.statusTapped(status))
                        dismiss()
                    }
            }
        }
        .navigationTitle(store.schedule.day.name)
    }
}

struct DayScheduleDetailRow: View {
    var status: Status
    var isSelected: Bool
    
    var body: some View {
        HStack {
            SquareView(color: status.color, size: 15)
            Text(status.name)
            Spacer()
            
            if isSelected {
                Image.SFSymbols.checkmark
                    .foregroundStyle(.blue)
            }
        }
        .contentShape(Rectangle())
    }
}
