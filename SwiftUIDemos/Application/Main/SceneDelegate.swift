//
//  SceneDelegate.swift
//  SwiftUIDemos
//
//  Created by Jay Lee on 2020/04/10.
//  Copyright © 2020 Jay Lee. All rights reserved.
//

import SwiftUI
import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(
        _ scene: UIScene, willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        let contentView = ContentView()

        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            window.rootViewController = UIHostingController(
                rootView: contentView
            )
            self.window = window
            window.makeKeyAndVisible()
        }
    }
}
