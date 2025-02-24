//
//  happy_eat_infinityApp.swift
//  happy-eat-infinity
//
//  Created by Matthew Fang on 2/23/25.
//

import SwiftUI
import SwiftData

@main
struct happyeat5App: App {
    
    let container: ModelContainer = {
        let schema = Schema([Reflection.self]) // add more as you need
        let container = try! ModelContainer(for: schema, configurations: []) // MARK: add do-try-catch
        return container
    }()
    
    var body: some Scene {
        WindowGroup {
            MainTabView()
        }
        .modelContainer(container)
        
    }
}
