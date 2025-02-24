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

    @State var path: [Screen] = []
    @State var strategies = [Strategy(name: "Note when you compare yourself to others", description: "[desc]", duration: .short, instructions: "instructions!", content: "CONTNET", contentType: .article)]

    var body: some View {
        NavigationStack(path: $path) {
            DeckView($strategies) { strategy in
                NavigationLink(destination: DoItView(path: $path, strategy: strategy)) {
                    RoundedRectangle(cornerRadius: 25.0)
                        .foregroundStyle(.thinMaterial)
                        .frame(width: 300, height: 300)
                        .overlay(Text(strategy.name))
                        .shadow(radius: 10)
                    //                    .onTapGesture {
                    //                        print ("hi")
                    //                        path.append(.doIt(strategy: strategy))
                    //                    }
                }
            }
            .padding()
            .onAppear {
                print("LOADED")
            }
        }
    }
}

enum Screen: Hashable {
    case discover
    case doIt
    case reflect
}

#Preview {
    DiscoverView(strategies: [Strategy(name: "Note when you compare yourself to others", description: "[desc]", duration: .short, instructions: "instructions!", content: "CONTNET", contentType: .article)])
}
