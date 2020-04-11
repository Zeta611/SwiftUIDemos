//
//  ActivityIndicatorDemo.swift
//  SwiftUIDemos
//
//  Created by Jay Lee on 2020/04/10.
//  Copyright © 2020 Jay Lee. All rights reserved.
//

import SwiftUI

struct ActivityIndicatorDemo: View {
    @State private var animateAcitivityIndicators = true

    var body: some View {
        VStack {
            Toggle(
                "Animate",
                isOn: $animateAcitivityIndicators
            )
            .fixedSize()

            HStack(spacing: 16) {
                ActivityIndicator(
                    isAnimating: animateAcitivityIndicators,
                    color: .systemIndigo
                )
                ActivityIndicator(
                    hidesWhenStopped: false,
                    isAnimating: animateAcitivityIndicators,
                    color: .systemRed
                )
                ActivityIndicator(
                    hidesWhenStopped: false,
                    isAnimating: animateAcitivityIndicators,
                    style: .large
                )
            }
        }
    }
}

struct ActivityIndicatorDemo_Previews: PreviewProvider {
    static var previews: some View {
        ActivityIndicatorDemo()
    }
}
