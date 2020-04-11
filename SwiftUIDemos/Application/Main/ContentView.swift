//
//  ContentView.swift
//  SwiftUIDemos
//
//  Created by Jay Lee on 2020/04/10.
//  Copyright © 2020 Jay Lee. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            DemoList {
                NavigationLink(
                    "Using UIKit Views",
                    destination: UIKitViewDemo()
                        .navigationBarTitle("Using UIKit Views")
                )

                NavigationLink(
                    "Using UIKit ViewControllers",
                    destination: UIKitViewControllerDemo()
                        .navigationBarTitle("Using UIKit ViewControllers")
                )
            }
            .foregroundColor(.primary)
            .demoListStyle(NeumorphicDemoListStyle())
            .environment(\.horizontalSizeClass, .regular)
            .navigationBarTitle("SwiftUI Demos")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
