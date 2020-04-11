//
//  FontPickerDemo.swift
//  SwiftUIDemos
//
//  Created by Jay Lee on 2020/04/12.
//  Copyright © 2020 Jay Lee. All rights reserved.
//

import SwiftUI

struct FontPickerDemo: View {
    @State private var fontDescriptor = UIFont.systemFont(ofSize: 17)
        .fontDescriptor
    @State private var isPresented = false
    @Environment(\.sizeCategory) private var sizeCategory: ContentSizeCategory

    private var font: Font {
        Font(
            UIFontMetrics(forTextStyle: .body)
                .scaledFont(for: UIFont(descriptor: fontDescriptor, size: 17)
            )
        )
    }

    var body: some View {
        VStack {
            Text("Current font is \(fontDescriptor.postscriptName).")
                .font(font)

            Button("Choose a new font!") {
                self.isPresented = true
            }
            .buttonStyle(PlainButtonStyle())
            .sheet(isPresented: $isPresented) {
                FontPicker(fontDescriptor: self.$fontDescriptor)
            }
        }
    }
}

struct FontPickerDemo_Previews: PreviewProvider {
    static var previews: some View {
        FontPickerDemo()
    }
}
