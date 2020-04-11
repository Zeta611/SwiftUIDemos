//
//  DemoList.swift
//  SwiftUIDemos
//
//  Created by Jay Lee on 2020/04/11.
//  Copyright © 2020 Jay Lee. All rights reserved.
//

import SwiftUI

struct DemoList<Content>: View where Content: View {
    var spacing: CGFloat = 15
    let items: [DemoItem]

    @Environment(\.demoListStyle) private var style

    var body: some View {
        ScrollView {
            VStack(spacing: spacing) {
                ForEach(items) { item in
                    ZStack {
                        DemoListCell()
                        item.view
                            .padding()
                    }
                }
            }
            .padding()
        }
        .edgesIgnoringSafeArea(.horizontal)
        .onAppear {
            if self.style is NeumorphicDemoListStyle {
                UIScrollView.appearance().backgroundColor = UIColor(
                    named: "neumorphic.background"
                )
            } else {
                UIScrollView.appearance().backgroundColor = nil
            }
        }
    }

    init<Data, Item>(
        _ data: Data,
        @ViewBuilder item: @escaping (Data.Element) -> Item
    ) where
        Content == ForEach<Data, Data.Element.ID, Item>,
        Data: RandomAccessCollection,
        Item: View,
        Data.Element: Identifiable
    {
        items = data.map {
            DemoItem(view: AnyView(item($0)), id: $0.id)
        }
    }

    init<Data, ID, Item>(
        _ data: Data,
        id: KeyPath<Data.Element, ID>,
        @ViewBuilder item: @escaping (Data.Element) -> Item
    ) where
        Content == ForEach<Data, ID, Item>,
        Data: RandomAccessCollection,
        ID: Hashable,
        Item: View
    {
        items = data.map {
            DemoItem(view: AnyView(item($0)), id: $0[keyPath: id])
        }
    }

    init<Item>(
        _ data: Range<Int>,
        @ViewBuilder item: @escaping (Int) -> Item
    ) where Content == ForEach<Range<Int>, Int, Item>, Item: View {
        items = data.map { DemoItem(view: AnyView(item($0)), id: $0) }
    }
}

// MARK: DemoList ViewBuilder Initializers
extension DemoList {
    init(content: () -> Content) {
        items = [DemoItem(view: AnyView(content()), id: 0)]
    }

    init<C0: View, C1: View>(@ViewBuilder content: () -> Content)
        where Content == TupleView<(C0, C1)>
    {
        items = [
            DemoItem(view: AnyView(content().value.0), id: 0),
            DemoItem(view: AnyView(content().value.1), id: 1)
        ]
    }

    init<C0: View, C1: View, C2: View>(@ViewBuilder content: () -> Content)
        where Content == TupleView<(C0, C1, C2)>
    {
        items = [
            DemoItem(view: AnyView(content().value.0), id: 0),
            DemoItem(view: AnyView(content().value.1), id: 1),
            DemoItem(view: AnyView(content().value.2), id: 2)
        ]
    }

    init<C0: View, C1: View, C2: View, C3: View>(@ViewBuilder content: () -> Content)
        where Content == TupleView<(C0, C1, C2, C3)>
    {
        items = [
            DemoItem(view: AnyView(content().value.0), id: 0),
            DemoItem(view: AnyView(content().value.1), id: 1),
            DemoItem(view: AnyView(content().value.2), id: 2),
            DemoItem(view: AnyView(content().value.3), id: 3)
        ]
    }

    init<C0: View, C1: View, C2: View, C3: View, C4: View>(@ViewBuilder content: () -> Content)
        where Content == TupleView<(C0, C1, C2, C3, C4)>
    {
        items = [
            DemoItem(view: AnyView(content().value.0), id: 0),
            DemoItem(view: AnyView(content().value.1), id: 1),
            DemoItem(view: AnyView(content().value.2), id: 2),
            DemoItem(view: AnyView(content().value.3), id: 3),
            DemoItem(view: AnyView(content().value.4), id: 4)
        ]
    }

    init<C0: View, C1: View, C2: View, C3: View, C4: View, C5: View>(@ViewBuilder content: () -> Content)
        where Content == TupleView<(C0, C1, C2, C3, C4, C5)>
    {
        items = [
            DemoItem(view: AnyView(content().value.0), id: 0),
            DemoItem(view: AnyView(content().value.1), id: 1),
            DemoItem(view: AnyView(content().value.2), id: 2),
            DemoItem(view: AnyView(content().value.3), id: 3),
            DemoItem(view: AnyView(content().value.4), id: 4),
            DemoItem(view: AnyView(content().value.5), id: 5)
        ]
    }

    init<C0: View, C1: View, C2: View, C3: View, C4: View, C5: View, C6: View>(@ViewBuilder content: () -> Content)
        where Content == TupleView<(C0, C1, C2, C3, C4, C5, C6)>
    {
        items = [
            DemoItem(view: AnyView(content().value.0), id: 0),
            DemoItem(view: AnyView(content().value.1), id: 1),
            DemoItem(view: AnyView(content().value.2), id: 2),
            DemoItem(view: AnyView(content().value.3), id: 3),
            DemoItem(view: AnyView(content().value.4), id: 4),
            DemoItem(view: AnyView(content().value.5), id: 5),
            DemoItem(view: AnyView(content().value.6), id: 6)
        ]
    }

    init<C0: View, C1: View, C2: View, C3: View, C4: View, C5: View, C6: View, C7: View>(@ViewBuilder content: () -> Content)
        where Content == TupleView<(C0, C1, C2, C3, C4, C5, C6, C7)>
    {
        items = [
            DemoItem(view: AnyView(content().value.0), id: 0),
            DemoItem(view: AnyView(content().value.1), id: 1),
            DemoItem(view: AnyView(content().value.2), id: 2),
            DemoItem(view: AnyView(content().value.3), id: 3),
            DemoItem(view: AnyView(content().value.4), id: 4),
            DemoItem(view: AnyView(content().value.5), id: 5),
            DemoItem(view: AnyView(content().value.6), id: 6),
            DemoItem(view: AnyView(content().value.7), id: 7)
        ]
    }

    init<C0: View, C1: View, C2: View, C3: View, C4: View, C5: View, C6: View, C7: View, C8: View>(@ViewBuilder content: () -> Content)
        where Content == TupleView<(C0, C1, C2, C3, C4, C5, C6, C7, C8)>
    {
        items = [
            DemoItem(view: AnyView(content().value.0), id: 0),
            DemoItem(view: AnyView(content().value.1), id: 1),
            DemoItem(view: AnyView(content().value.2), id: 2),
            DemoItem(view: AnyView(content().value.3), id: 3),
            DemoItem(view: AnyView(content().value.4), id: 4),
            DemoItem(view: AnyView(content().value.5), id: 5),
            DemoItem(view: AnyView(content().value.6), id: 6),
            DemoItem(view: AnyView(content().value.7), id: 7),
            DemoItem(view: AnyView(content().value.8), id: 8)
        ]
    }

    init<C0: View, C1: View, C2: View, C3: View, C4: View, C5: View, C6: View, C7: View, C8: View, C9: View>(@ViewBuilder content: () -> Content)
        where Content == TupleView<(C0, C1, C2, C3, C4, C5, C6, C7, C8, C9)>
    {
        items = [
            DemoItem(view: AnyView(content().value.0), id: 0),
            DemoItem(view: AnyView(content().value.1), id: 1),
            DemoItem(view: AnyView(content().value.2), id: 2),
            DemoItem(view: AnyView(content().value.3), id: 3),
            DemoItem(view: AnyView(content().value.4), id: 4),
            DemoItem(view: AnyView(content().value.5), id: 5),
            DemoItem(view: AnyView(content().value.6), id: 6),
            DemoItem(view: AnyView(content().value.7), id: 7),
            DemoItem(view: AnyView(content().value.8), id: 8),
            DemoItem(view: AnyView(content().value.9), id: 9)
        ]
    }

}

struct DemoList_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            Group {
                DemoList(0..<10) { Text("Demo \($0)") }
                    .demoListStyle(DefaultDemoListStyle())
                DemoList(0..<10) { Text("Demo \($0)") }
                    .demoListStyle(NeumorphicDemoListStyle())
            }
            .colorScheme(.light)

            Group {
                DemoList(0..<10) { Text("Demo \($0)") }
                    .demoListStyle(DefaultDemoListStyle())
                DemoList(0..<10) { Text("Demo \($0)") }
                    .demoListStyle(NeumorphicDemoListStyle())
            }
            .colorScheme(.dark)
        }
    }
}
