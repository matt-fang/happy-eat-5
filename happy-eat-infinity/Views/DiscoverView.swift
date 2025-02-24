//
//  ContentView.swift
//  happy-eat-infinity
//
//  Created by Matthew Fang on 2/23/25.
//

import DeckKit
import SwiftData
import SwiftUI

struct DiscoverView: View {
//    @Environment(\.modelContext) var context

    // MARK: for a full list of EnvironmentValues (\.stuff) — basically "types" of environment objects - check out the docs!

    @State var strategies: [Strategy]

    var body: some View {
        DeckView($strategies) { strategy in
            RoundedRectangle(cornerRadius: 25.0)
                .foregroundStyle(.thinMaterial)
                .frame(width: 300, height: 300)
                .overlay(Text(strategy.name))
                .shadow(radius: 10)
        }.padding()
    }
}

#Preview {
    DiscoverView(strategies: [Strategy(name: "Identify your food rules", text: "yes"), Strategy(name: "Eat according to your hunger signals", text: "yes")])
}
