//
//  FontPicker.swift
//  SwiftUIDemos
//
//  Created by Jay Lee on 2020/04/11.
//  Copyright © 2020 Jay Lee. All rights reserved.
//

import SwiftUI

struct FontPicker: UIViewControllerRepresentable {
    @Binding var fontDescriptor: UIFontDescriptor
    @Environment(\.presentationMode) private var presentationMode

    func makeUIViewController(context: Context) -> UIFontPickerViewController {
        let fontPickerVC = UIFontPickerViewController()
        fontPickerVC.delegate = context.coordinator
        return fontPickerVC
    }

    func updateUIViewController(
        _ uiViewController: UIFontPickerViewController,
        context: Context
    ) {
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    final class Coordinator: NSObject, UIFontPickerViewControllerDelegate {
        let parent: FontPicker

        func fontPickerViewControllerDidPickFont(
            _ viewController: UIFontPickerViewController
        ) {
            if let fontDescriptor = viewController.selectedFontDescriptor {
                parent.fontDescriptor = fontDescriptor
            }
            parent.presentationMode.wrappedValue.dismiss()
        }

        init(_ parent: FontPicker) {
            self.parent = parent
        }
    }
}

struct FontPicker_Previews: PreviewProvider {
    static var previews: some View {
        FontPicker(
            fontDescriptor: .constant(
                UIFont.systemFont(ofSize: 17).fontDescriptor
            )
        )
    }
}
