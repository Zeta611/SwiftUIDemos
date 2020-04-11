//
//  UIKitViewDemo.swift
//  SwiftUIDemos
//
//  Created by Jay Lee on 2020/04/10.
//  Copyright © 2020 Jay Lee. All rights reserved.
//

import SwiftUI

struct UIKitViewDemo: View {
    var body: some View {
        DemoList {
            ActivityIndicatorDemo()
            SearchBarDemo()
            WebViewDemo()
            MapViewDemo()
        }
    }
}

struct UIKitViewDemoView_Previews: PreviewProvider {
    static var previews: some View {
        UIKitViewDemo()
    }
}
