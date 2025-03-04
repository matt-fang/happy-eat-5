import SwiftUI
import SwiftData
import DeckKit

struct CardsView: View {
    @AppStorage("hasCompletedOnboarding") private var hasCompletedOnboarding = true
    @Query(sort: \Reflection.strategyName) var reflections: [Reflection]
    @Binding var path: [NavScreen]
    @Bindable var userModel: User
    @Binding var streakIsYellow: Bool
    
    @State private var filteredStrategies: [Strategy] = []
    @State private var xpProgress: Double = 0
    @State private var showLevelUpOverlay = false
    
    var body: some View {
        ZStack {
            VStack {
                MonStatusView(userModel: userModel, xpProgress: xpProgress)
                    .padding()
                
                if filteredStrategies.isEmpty {
                    Text("No strategies available")
                        .foregroundStyle(.secondary)
                        .padding()
                } else {
                    DeckView($filteredStrategies) { strategy in
                        StrategyCard(strategy: strategy, reflections: reflections, path: $path)
                    }
                    .deckViewConfiguration(DeckViewConfiguration(itemDisplayCount: 4, verticalDragThreshold: 50))
                }
                
                StreakBadgeView(streak: userModel.streak, isYellow: $streakIsYellow)
                    .padding(16)
            }
            
        }
        .navigationTitle("Train \(userModel.monName)!")
        .navigationBarTitleDisplayMode(.large)
        .toolbar {
            ToolbarItem() {
                Button (action: {
                    hasCompletedOnboarding = false
                }, label: {
                    Text("Reset")
                })
            }
        }
        .offset(y: -20)
        .padding()
        .navigationDestination(for: NavScreen.self) { screen in
            switch screen {
            case .discover:
                DiscoverView(path: $path)
            case .doIt(let strategy, let selectedOption):
                TrainView(path: $path, strategy: strategy, selectedOption: selectedOption)
            case .reflect(let strategy):
                ReflectView(path: $path, strategy: strategy)
            case .strategy(let strategy):
                StrategyChoiceView(path: $path, strategy: strategy)
            case .strategyChoice(let strategy):
                StrategyChoiceView(path: $path, strategy: strategy)
            case .reflectionDetail(let reflection):
                Text("Reflection Detail: \(reflection.strategyName ?? "Unknown")")
            }
        }
        .onAppear {
            print("CardsView appeared")
            print("User eating style: \(userModel.eatingStyle.rawValue)")
            print("Total strategies: \(userModel.strategies.count)")
            filteredStrategies = userModel.getFilteredStrategies()
            print("Filtered strategies: \(filteredStrategies.count)")
            print("Reflections count: \(reflections.count)")
            
            // Update XP progress with animation
            withAnimation(.easeInOut(duration: 1.5)) {
                xpProgress = userModel.getXPProgress()
            }
            
            // Show level up animation if needed
            if userModel.showLevelUpAnimation {
                withAnimation(.easeInOut(duration: 1.0)) {
                    xpProgress = 0 // Reset progress bar to 0 for new level
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                    withAnimation(.easeInOut(duration: 1.5)) {
                        xpProgress = userModel.getXPProgress() // Animate to new progress
                    }
                }
                userModel.showLevelUpAnimation = false
            }
            
            // Handle streak animation
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                withAnimation(.spring(duration: 1)) {
                    if userModel.playStreakAnimation {
                        streakIsYellow = true
                        userModel.updateStreak()
                        userModel.playStreakAnimation = false
                    }
                }
                if streakIsYellow {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        withAnimation(.spring(duration: 0.5)) {
                            streakIsYellow = false
                        }
                    }
                }
            }
        }
        .onChange(of: userModel.xp) { _, _ in
            withAnimation(.easeInOut(duration: 1.0)) {
                xpProgress = userModel.getXPProgress()
            }
        }
        .onChange(of: userModel.level) { _, _ in
            withAnimation(.easeInOut(duration: 1.0)) {
                xpProgress = 0 // Reset progress bar to 0 for new level
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                withAnimation(.easeInOut(duration: 1.0)) {
                    xpProgress = userModel.getXPProgress() // Animate to new progress
                }
            }
        }
        .onChange(of: userModel.eatingStyle) {
            print("Eating style changed to: \(userModel.eatingStyle.rawValue)")
            filteredStrategies = userModel.getFilteredStrategies()
        }
        .onChange(of: userModel.strategies) {
            print("Strategies array changed, count: \(userModel.strategies.count)")
            filteredStrategies = userModel.getFilteredStrategies()
        }
    }
} 
