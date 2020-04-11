//
//  SearchBarDemo.swift
//  SwiftUIDemos
//
//  Created by Jay Lee on 2020/04/11.
//  Copyright © 2020 Jay Lee. All rights reserved.
//

import SwiftUI

struct SearchBarDemo: View {
    @State var text = "SwiftUI ❤️ UIKit"

    var body: some View {
        VStack {
            SearchBar(text: $text)
            Text(text)
        }
    }
}

struct SearchBarDemo_Previews: PreviewProvider {
    static var previews: some View {
        SearchBarDemo()
    }
}
