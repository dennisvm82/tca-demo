//
//  SquareView.swift
//  tca-demo
//
//  Created by Dennis van Mazijk on 2023/12/16.
//

import SwiftUI

struct SquareView: View {
    let color: Color

    var body: some View {
        Rectangle()
            .fill(color)
            .frame(width: 15, height: 15)
    }
}
