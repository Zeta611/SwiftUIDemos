//
//  ProgressBar.swift
//  Video Converter
//
//  Created by Jay Lee on 2020/04/05.
//  Copyright © 2020 Jay Lee. All rights reserved.
//

import SwiftUI

struct ProgressBar: View {
    let progress: Double
    let height: CGFloat = 5

    @State private var width: CGFloat = 0

    var body: some View {
        GeometryReader { geometry in
            Rectangle()
                .foregroundColor(Color(.systemGroupedBackground))
            Rectangle()
                .frame(width: geometry.size.width * self.progress.cg)
                .foregroundColor(.green)
                .animation(.easeIn)
        }
        .frame(height: self.height)
    }
}

struct ProgressBar_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ProgressBar(progress: 0.6).colorScheme(.light)
            ProgressBar(progress: 0.6).colorScheme(.dark)
        }
    }
}
