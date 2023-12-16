//
//  tca_demoApp.swift
//  tca-demo
//
//  Created by Dennis van Mazijk on 2023/12/10.
//

import SwiftUI

@main
struct tca_demoApp: App {
    @ObservedObject var viewModel = DayScheduleViewModel()
    
    var body: some Scene {
        WindowGroup {
            DayScheduleListView()
                .environmentObject(viewModel)
        }
    }
}
