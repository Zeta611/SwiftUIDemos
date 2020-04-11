//
//  WebViewDemo.swift
//  SwiftUIDemos
//
//  Created by Jay Lee on 2020/04/10.
//  Copyright © 2020 Jay Lee. All rights reserved.
//

import SwiftUI

struct WebViewDemo: View {
    @State private var rawURL = "https://www.google.com"
    @State private var latestValidURL = URL(string: "https://www.google.com")!
    @State private var isLoading = false
    @State private var progress: Double = 0

    private var textBinding: Binding<String> {
        Binding<String>(
            get: { self.rawURL },
            set: {
                self.rawURL = $0
                if let url = URL(string: $0) {
                    self.latestValidURL = url
                }
            }
        )
    }

    var body: some View {
        VStack {
            HStack {
                Text("URL")
                TextField("URL for the WebView", text: textBinding)
                    .fixedSize()
            }

            ProgressBar(progress: progress)

            ZStack {
                WebView(
                    url: latestValidURL,
                    estimatedProgress: $progress,
                    didStartNavigation: { _ in self.isLoading = true },
                    didFinishNavigation: { _ in self.isLoading = false }
                )
                .frame(height: UIScreen.main.bounds.height - 120)

                ActivityIndicator(
                    isAnimating: isLoading,
                    style: .large,
                    color: .systemGray
                )
            }
        }
    }
}

struct WebViewDemo_Previews: PreviewProvider {
    static var previews: some View {
        WebViewDemo()
    }
}
