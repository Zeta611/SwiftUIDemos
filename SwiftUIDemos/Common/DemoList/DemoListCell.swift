//
//  DemoListCell.swift
//  SwiftUIDemos
//
//  Created by Jay Lee on 2020/04/11.
//  Copyright © 2020 Jay Lee. All rights reserved.
//

import SwiftUI

struct DemoListCell: View {
    @Environment(\.demoListStyle) private var style

    var body: some View {
        Group {
            if self.style is DefaultDemoListStyle {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(Color("background"))
                    .shadow(color: Color("shadow"), radius: 15)
            } else if self.style is NeumorphicDemoListStyle {
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color("neumorphic.background"))
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(Color("neumorphic.shadow"))
                            .offset(x: 5, y: 5)
                            .blur(radius: 4)
                    )
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(Color("neumorphic.light"))
                            .offset(x: -5, y: -5)
                            .blur(radius: 4)
                    )
            }
        }
    }
}

struct DemoListCell_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ZStack {
                Color("neumorphic.background")
                    .edgesIgnoringSafeArea(.all)
                DemoListCell()
                    .frame(width: 300, height: 40)
            }
            .colorScheme(.light)

            ZStack {
                Color("neumorphic.background")
                    .edgesIgnoringSafeArea(.all)
                DemoListCell()
                    .frame(width: 300, height: 40)
            }
            .colorScheme(.dark)
        }
        .demoListStyle(NeumorphicDemoListStyle())
    }
}
