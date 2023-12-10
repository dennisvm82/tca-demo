//
//  DayScheduleDetailView.swift
//  tca-demo
//
//  Created by Dennis van Mazijk on 2023/12/10.
//

import SwiftUI

struct DayScheduleDetailView: View {
    let daySchedule: DaySchedule
    
    var body: some View {
        NavigationView {
            Text(daySchedule.schedule.string)
        }
        .navigationTitle(daySchedule.day.name)
    }
}
