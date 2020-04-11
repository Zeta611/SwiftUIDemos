//
//  ActivityIndicator.swift
//  SwiftUIDemos
//
//  Created by Jay Lee on 2020/04/10.
//  Copyright © 2020 Jay Lee. All rights reserved.
//

import SwiftUI

struct ActivityIndicator: UIViewRepresentable {
    var hidesWhenStopped = true
    let isAnimating: Bool
    var style: UIActivityIndicatorView.Style = .medium
    var color: UIColor?

    func makeUIView(context: Context) -> UIActivityIndicatorView {
        UIActivityIndicatorView()
    }

    func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) {
        uiView.hidesWhenStopped = hidesWhenStopped
        if isAnimating {
            uiView.startAnimating()
        } else {
            uiView.stopAnimating()
        }
        uiView.style = style
        uiView.color = color
    }
}

struct ActivityIndicator_Previews: PreviewProvider {
    static var previews: some View {
        ActivityIndicator(isAnimating: true)
    }
}
