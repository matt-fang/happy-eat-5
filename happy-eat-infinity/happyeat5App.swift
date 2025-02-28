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
    
    // In happyeat5App.swift
    let container: ModelContainer = {
        do {
            let schema = Schema([Reflection.self, User.self, Strategy.self])
            let modelConfiguration = ModelConfiguration(isStoredInMemoryOnly: false)
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
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
