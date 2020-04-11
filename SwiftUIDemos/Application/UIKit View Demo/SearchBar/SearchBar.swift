//
//  SearchBar.swift
//  SwiftUIDemos
//
//  Created by Jay Lee on 2020/04/11.
//  Copyright © 2020 Jay Lee. All rights reserved.
//

import SwiftUI

struct SearchBar: UIViewRepresentable {
    @Binding var text: String

    func makeUIView(context: Context) -> UISearchBar {
        let searchBar = UISearchBar()
        searchBar.delegate = context.coordinator
        searchBar.searchBarStyle = .minimal
        return searchBar
    }

    func updateUIView(_ uiView: UISearchBar, context: Context) {
        uiView.text = text
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    final class Coordinator: NSObject, UISearchBarDelegate {
        let parent: SearchBar

        func searchBar(
            _ searchBar: UISearchBar,
            textDidChange searchText: String
        ) {
            parent.text = searchText
        }

        func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
            searchBar.resignFirstResponder()
        }

        init(_ parent: SearchBar) {
            self.parent = parent
        }
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar(text: .constant("Hello, SwiftUI!"))
    }
}
