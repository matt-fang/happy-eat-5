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
    @AppStorage("hasCompletedOnboarding") private var hasCompletedOnboarding = false
    
    let container: ModelContainer = {
        let schema = Schema([Reflection.self]) // add more as you need
        let container = try! ModelContainer(for: schema, configurations: []) // MARK: add do-try-catch
        return container
    }()
    
    var body: some Scene {
        WindowGroup {
            if hasCompletedOnboarding {
                MainTabView()
            } else {
                OnboardingView()
            }
            
        }
        .modelContainer(container)
        
    }
}
