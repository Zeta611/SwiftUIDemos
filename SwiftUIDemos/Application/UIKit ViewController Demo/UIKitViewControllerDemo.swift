//
//  UIKitViewControllerDemo.swift
//  SwiftUIDemos
//
//  Created by Jay Lee on 2020/04/11.
//  Copyright © 2020 Jay Lee. All rights reserved.
//

import SwiftUI

struct UIKitViewControllerDemo: View {
    var body: some View {
        DemoList {
            FontPickerDemo()
        }
    }
}

struct UIKitViewControllerDemo_Previews: PreviewProvider {
    static var previews: some View {
        UIKitViewControllerDemo()
    }
}
