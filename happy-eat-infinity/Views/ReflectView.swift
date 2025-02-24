//
//  ReflectView.swift
//  happy-eat-5
//
//  Created by Matthew Fang on 2/23/25.
//

import SwiftUI

struct ReflectView: View {
    @Binding var path: [Screen]

    let strategy: Strategy

    var body: some View {
        VStack {
            Text("Reflecting on strategy: \(strategy.name)")
            Button("Go back to Root") {
                // Clear the path to go back to the root view
                path.removeAll()
            }
        }
    }
}

// #Preview {
//    ReflectView()
// }
