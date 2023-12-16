//
//  SquareView.swift
//  tca-demo
//
//  Created by Dennis van Mazijk on 2023/12/16.
//

import SwiftUI

struct SquareView: View {
    private let color: Color
    private let size: CGFloat
    
    init(color: Color, size: CGFloat) {
        self.color = color
        self.size = size
    }
    
    var body: some View {
        Rectangle()
            .fill(color)
            .frame(width: size, height: size)
    }
}
