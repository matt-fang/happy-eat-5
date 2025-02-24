//
//  DoView.swift
//  happy-eat-5
//
//  Created by Matthew Fang on 2/23/25.
//

import SwiftUI

struct DoItView: View {
    @Binding var path: [Screen]
    let strategy: Strategy

    var body: some View {
        Text(strategy.name)
        Text(strategy.instructions)

        switch strategy.contentType {
        case .article:
            if let content = strategy.content {
                Text(content)
            } else {
                Text("No content! Try another strategy.")
            }
        case _:
            Text("other content")
        }
        NavigationLink(destination: ReflectView(path: $path, strategy: strategy)) {
            Text("Done")
        }
        .buttonStyle(.borderedProminent)
    }
}

// #Preview {
//    DoItView(strategy: Strategy(name: "Learn simple ways to take care of yourself", description: "[desc]", duration: .short, instructions: "Read the article below", content: "If food has become your enemy, it’s time to learn how to make it your friend again—one that gives you nourishment and satisfaction.", contentType: .article))
// }
