//
//  View+demoListStyle.swift
//  SwiftUIDemos
//
//  Created by Jay Lee on 2020/04/11.
//  Copyright © 2020 Jay Lee. All rights reserved.
//

import SwiftUI

extension View {
    func demoListStyle<S>(_ style: S) -> some View where S: DemoListStyle {
        environment(\.demoListStyle, style)
    }
}
