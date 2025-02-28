import DeckKit
import SwiftData
import SwiftUI

struct DiscoverView: View {
    @Environment(\.modelContext) private var modelContext
    @Query var users: [User]
    @Binding var path: [NavScreen]
    @State private var hasNewReflection = false
    @State private var streakIsYellow = false
    
    var body: some View {
        NavigationStack(path: $path) {
            ZStack {
                Color.cream.ignoresSafeArea()
                if let userModel = users.first {
                    if userModel.strategies.isEmpty {
                        VStack {
                            Text("No strategies found!")
                                .font(.headline)
                            
                            Text("Current eating style: \(userModel.eatingStyle.rawValue)")
                                .font(.subheadline)

//                            Button("Add test strategies") {
//                                addTestStrategies(to: userModel)
//                            }
//                            .padding()
//                            .background(Color.blue)
//                            .foregroundColor(.white)
//                            .cornerRadius(8)
                        }
                    } else {
                        CardsView(path: $path, userModel: userModel, streakIsYellow: $streakIsYellow)
                            .onAppear {
                                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                                    withAnimation {
                                        if userModel.playStreakAnimation {
                                            streakIsYellow = true
//                                            updateStreakIsYellow()
//                                            print("updated streak from onappear")
                                            userModel.updateStreak()
                                            userModel.playStreakAnimation = false
                                        }
                                    }
                                }
                                if streakIsYellow == true {
                                    streakIsYellow.toggle()
                                }
                                        
                            }
                    }
                } else {
                    Text("No user found in database!")
                }
            }
        }
    }
    
    // Function to add test strategies
//    func addTestStrategies(to user: User) {
//        let modelContext = user.modelContext!
//        
//        // Create strategies for the current eating style
//        let strategy1 = Strategy(
//            name: "mindful eating exercise",
//            instructions: "Take a few moments before eating to appreciate your food",
//            content: "Examine your food carefully. Notice its colors, textures, and smells before taking your first bite.",
//            contentType: .article,
//            eatingStyle: user.eatingStyle
//        )
//        
//        let strategy2 = Strategy(
//            name: "hunger awareness check",
//            instructions: "Rate your hunger on a scale of 1-10 before eating",
//            contentType: .action,
//            eatingStyle: user.eatingStyle
//        )
//        
//        // Add the strategies to the user
//        user.strategies.append(strategy1)
//        user.strategies.append(strategy2)
//        
//        // Save to the database
//        try? modelContext.save()
//    }
    
    func updateStreakIsYellow() {
        // Get the current date
        let currentDate = Date()
        
        // Retrieve the last streak date from UserDefaults, or initialize it if not set (first streak)
        let lastStreakDate = UserDefaults.standard.object(forKey: "lastStreakDate") as? Date
        
        // Get the start of the current day (ignoring time)
        let calendar = Calendar.current
        let startOfCurrentDay = calendar.startOfDay(for: currentDate)
        
        // Retrieve the current streak state (or initialize it if it's the first streak)
        var streakIsYellow = UserDefaults.standard.bool(forKey: "streakIsYellow")
        
        // If it's the first streak (no last streak date exists), initialize streakIsYellow to true
        if lastStreakDate == nil {
            streakIsYellow = true
            UserDefaults.standard.set(streakIsYellow, forKey: "streakIsYellow")
            UserDefaults.standard.set(currentDate, forKey: "lastStreakDate")
            print("First streak: streakIsYellow set to \(streakIsYellow)")
            return
        }

        // If the last streak date is not today, set streakIsYellow to false
        if !calendar.isDate(lastStreakDate!, inSameDayAs: startOfCurrentDay) {
            streakIsYellow = false
            UserDefaults.standard.set(streakIsYellow, forKey: "streakIsYellow")
            UserDefaults.standard.set(currentDate, forKey: "lastStreakDate")
        }
        
        // Optionally print or handle the updated streak state
        print("Streak is yellow: \(streakIsYellow)")
    }
}

struct CardsView: View {
    @AppStorage("hasCompletedOnboarding") private var hasCompletedOnboarding = true
    @Query(sort: \Reflection.strategyID) var reflections: [Reflection]
    @Binding var path: [NavScreen]
    @Bindable var userModel: User
    @Binding var streakIsYellow: Bool
    
    @State private var filteredStrategies: [Strategy] = []
    
    var body: some View {
        VStack {
//            Text("Total strategies: \(userModel.strategies.count)")
//                .font(.caption)
//            
//            Text("Filtered strategies: \(filteredStrategies.count)")
//                .font(.caption)
            
//            Text("Swipe:")
//                .foregroundStyle(Color.gray)
//                .multilineTextAlignment(.center)
//                .padding()
            
            if filteredStrategies.isEmpty {
                VStack {
                    Text("No strategies for \(userModel.eatingStyle.rawValue) eating style")
                        .padding()
                    
                    Button("Refresh strategies") {
                        filteredStrategies = userModel.getFilteredStrategies()
                    }
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
                }
            } else {
                // Your DeckView here
                Text("Swipe through these strategies until you find one you like!")
                    .foregroundStyle(.gray)
                    .padding()
                    .multilineTextAlignment(.center)
                notEmptyDeckView
                StreakBadgeView(streak: userModel.streak, isYellow: $streakIsYellow)
                    .padding(16)
                
            }
        }
        .navigationTitle("Today, I want to:")
        .navigationBarTitleDisplayMode(.large)
//        .toolbar() {
//            ToolbarItem(placement: .topBarLeading) {
//                StreakBadgeView(streak: userModel.streak)
//            }
//        }
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
            // Your navigation destinations
            switch screen {
            case .discover:
                DiscoverView(path: $path)
            case .doIt(let strategy):
                DoItView(path: $path, strategy: strategy)
            case .reflect(let strategy, let journalEntry):
                ReflectView(path: $path, strategyEntry: journalEntry, strategy: strategy)
            case .strategy, .reflectionDetail:
                Text("Screen not implemented yet")
            }
        }
        
        .onAppear {
            print("CardsView appeared")
            print("User eating style: \(userModel.eatingStyle.rawValue)")
            print("Total strategies: \(userModel.strategies.count)")
            filteredStrategies = userModel.getFilteredStrategies()
            print("Filtered strategies: \(filteredStrategies.count)")
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
    
    var notEmptyDeckView: some View {
        DeckView($filteredStrategies) { strategy in

                RoundedRectangle(cornerRadius: 25.0)
                    .aspectRatio(1.0, contentMode: .fit)
                    .foregroundStyle(
                        reflections.map({ $0.strategyID }).contains(strategy.name)
                        ? Color(hex: reflections.first(where: { $0.strategyID == strategy.name })?.successColor ?? "FFFFFF") // Use the successColor if found, else default to white
                        : .white
                    )// Ternary for foreground color
                .overlay {
                    ZStack {
                        Text(strategy.name.sentenceCased())// Fixed to `lowercased()`
                            .font(.system(size: 30, weight: .medium, design: .rounded))
                            .foregroundStyle(
                                reflections.map({ $0.strategyID }).contains(strategy.name)
                                ? .white : .black)
                            .multilineTextAlignment(.center)
                            .padding()
                            .opacity(0.9)
                    }
                }
                .shadow(color: Color.black.opacity(0.05), radius: 20)
                .overlay(alignment: .bottomTrailing) {
                    Button {
                        path.append(.doIt(strategy))
                    } label: {
                        Image(systemName: "play.circle.fill")
                            .font(.system(size: 30))
                            .foregroundStyle(
                                reflections.map({ $0.strategyID }).contains(strategy.name)
                                ? .white : .newRed)
                            .padding()
                    }
                }
                .padding()
        }
        .deckViewConfiguration(DeckViewConfiguration(itemDisplayCount: 4, verticalDragThreshold: 50))
    }
}

enum NavScreen: Hashable {
    case discover
    case doIt(Strategy)
    case reflect(Strategy, String)
    case strategy(Strategy)
    case reflectionDetail(Reflection)
}

