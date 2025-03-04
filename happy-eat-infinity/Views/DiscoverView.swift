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
//                    if userModel.strategies.isEmpty {
//                        VStack {
//                            Text("No strategies found!")
//                                .font(.headline)
//                            
//                            Text("Current eating style: \(userModel.eatingStyle.rawValue)")
//                                .font(.subheadline)
//
////                            Button("Add test strategies") {
////                                addTestStrategies(to: userModel)
////                            }
////                            .padding()
////                            .background(Color.blue)
////                            .foregroundColor(.white)
////                            .cornerRadius(8)
//                        }
//                    } else {
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
//                    }
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
                // Mon status
                HStack(spacing: 12) {
                    Image(getMonImage(for: userModel.eatingStyle))
                        .resizable()
                        .interpolation(.none)
                        .scaledToFit()
                        .frame(width: 48, height: 48)
                    
                    VStack(alignment: .leading, spacing: 4) {
                        Text(getMonName(for: userModel.eatingStyle))
                            .font(.headline)
                        
                        HStack {
                            Text("Level \(userModel.level)")
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                            
                            Text("•")
                                .foregroundColor(.secondary)
                            
                            Text("\(userModel.xp)/\(userModel.getXPForNextLevel()) XP")
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                        }
                        
                        GeometryReader { geometry in
                            ZStack(alignment: .leading) {
                                Rectangle()
                                    .fill(Color.gray.opacity(0.2))
                                    .frame(height: 8)
                                    .cornerRadius(4)
                                
                                Rectangle()
                                    .fill(Color.accentColor)
                                    .frame(width: geometry.size.width * xpProgress, height: 8)
                                    .cornerRadius(4)
                            }
                        }
                        .frame(height: 8)
                    }
                }
                .padding()
                .background(Color.white)
                .cornerRadius(12)
                .shadow(radius: 2)
                .padding(.horizontal)
                
                Text("Swipe through these strategies until you find one you like!")
                    .foregroundStyle(.black)
                    .padding()
                    .multilineTextAlignment(.center)
                notEmptyDeckView
                StreakBadgeView(streak: userModel.streak, isYellow: $streakIsYellow)
                    .padding(16)
            }
            
            // Level up overlay
            if showLevelUpOverlay {
                Color.black.opacity(0.7)
                    .ignoresSafeArea()
                    .overlay {
                        VStack(spacing: 20) {
                            Text("Level Up!")
                                .font(.system(size: 40, weight: .bold, design: .rounded))
                                .foregroundColor(.white)
                            
                            Text("\(getMonName(for: userModel.eatingStyle)) reached level \(userModel.level)!")
                                .font(.title3)
                                .foregroundColor(.white)
                                .multilineTextAlignment(.center)
                        }
                    }
                    .transition(.opacity)
            }
        }
        .navigationTitle("Today, I want to:")
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
            case .doIt(let strategy):
                TrainView(path: $path, strategy: strategy)
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
            
            // Animate XP bar if needed
            if userModel.showXPAnimation {
                withAnimation(.easeInOut(duration: 1.0)) {
                    xpProgress = userModel.getXPProgress()
                }
                userModel.showXPAnimation = false
            } else {
                xpProgress = userModel.getXPProgress()
            }
            
            // Show level up animation if needed
            if userModel.showLevelUpAnimation {
                withAnimation(.easeIn(duration: 0.3)) {
                    showLevelUpOverlay = true
                }
                
                // Hide the overlay after 2 seconds
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    withAnimation(.easeOut(duration: 0.3)) {
                        showLevelUpOverlay = false
                    }
                }
                
                userModel.showLevelUpAnimation = false
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
    
    private func getMonImage(for style: EatingStyle) -> String {
        switch style {
        case .selfCare:
            return "yorox"
        case .stressed:
            return "mushlo"
        case .anxious:
            return "kitsu"
        case .unconfident:
            return "miso"
        }
    }
    
    private func getMonName(for style: EatingStyle) -> String {
        switch style {
        case .selfCare:
            return "Yorox"
        case .stressed:
            return "Mushlo"
        case .anxious:
            return "Kitsu"
        case .unconfident:
            return "Miso"
        }
    }
    
    var notEmptyDeckView: some View {
        DeckView($filteredStrategies) { strategy in

                RoundedRectangle(cornerRadius: 25.0)
                    .aspectRatio(1.0, contentMode: .fit)
                    .foregroundStyle(
                        reflections.map({ $0.strategyName }).contains(strategy.name)
                        ? Color(hex: reflections.first(where: { $0.strategyName == strategy.name })?.successColor ?? "FFFFFF") // Use the successColor if found, else default to white
                        : .white
                    )// Ternary for foreground color
                .overlay {
                    ZStack {
                        Text(strategy.name?.sentenceCased() ?? "Strategy")// Fixed to `lowercased()`
                            .font(.system(size: 30, weight: .medium, design: .rounded))
                            .foregroundStyle(
                                reflections.map({ $0.strategyName }).contains(strategy.name)
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
                                reflections.map({ $0.strategyName }).contains(strategy.name)
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

