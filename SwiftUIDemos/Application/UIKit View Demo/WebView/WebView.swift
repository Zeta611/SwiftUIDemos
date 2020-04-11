//
//  WebView.swift
//  SwiftUIDemos
//
//  Created by Jay Lee on 2020/04/10.
//  Copyright © 2020 Jay Lee. All rights reserved.
//

import SwiftUI
import WebKit
import Combine

struct WebView: UIViewRepresentable {
    let url: URL
    @Binding var estimatedProgress: Double
    var didStartNavigation: ((WKNavigation) -> Void)?
    var didFinishNavigation: ((WKNavigation) -> Void)?

    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        webView.navigationDelegate = context.coordinator
        context.coordinator.cancellable = webView
            .publisher(for: \.estimatedProgress)
            .receive(on: DispatchQueue.main)
            .sink { self.estimatedProgress = $0 }
        return webView
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        guard context.coordinator.url != url else { return }
        context.coordinator.url = url
        uiView.load(URLRequest(url: url))
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    final class Coordinator: NSObject, WKNavigationDelegate {
        let parent: WebView
        var cancellable: Cancellable?
        var url: URL?

        func webView(
            _ webView: WKWebView,
            didStartProvisionalNavigation navigation: WKNavigation!
        ) {
            parent.didStartNavigation?(navigation)
        }

        func webView(
            _ webView: WKWebView,
            didFinish navigation: WKNavigation!
        ) {
            parent.didFinishNavigation?(navigation)
        }

        init(_ parent: WebView) {
            self.parent = parent
        }
    }
}

struct WebView_Previews: PreviewProvider {
    @State static var progress: Double = 0
    static var previews: some View {
        WebView(
            url: URL(string: "https://www.google.com")!,
            estimatedProgress: $progress
        )
    }
}
