//
//  EnvironmentValues+demoListStyle.swift
//  SwiftUIDemos
//
//  Created by Jay Lee on 2020/04/11.
//  Copyright © 2020 Jay Lee. All rights reserved.
//

import SwiftUI

extension EnvironmentValues {
    var demoListStyle: DemoListStyle {
        get { self[DemoListStyleKey.self] }
        set { self[DemoListStyleKey.self] = newValue }
    }
}
