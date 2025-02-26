import DeckKit
import SwiftData
import SwiftUI

struct DiscoverView: View {
    @Environment(\.modelContext) private var modelContext
    @Query var users: [User]
    @Binding var path: [Screen]
    
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
                            
                            Button("Add test strategies") {
                                addTestStrategies(to: userModel)
                            }
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                        }
                    } else {
                        CardsView(path: $path, userModel: userModel)
                    }
                } else {
                    Text("No user found in database!")
                }
            }
        }
    }
    
    // Function to add test strategies
    func addTestStrategies(to user: User) {
        let modelContext = user.modelContext!
        
        // Create strategies for the current eating style
        let strategy1 = Strategy(
            name: "mindful eating exercise",
            instructions: "Take a few moments before eating to appreciate your food",
            content: "Examine your food carefully. Notice its colors, textures, and smells before taking your first bite.",
            contentType: .article,
            eatingStyle: user.eatingStyle
        )
        
        let strategy2 = Strategy(
            name: "hunger awareness check",
            instructions: "Rate your hunger on a scale of 1-10 before eating",
            contentType: .action,
            eatingStyle: user.eatingStyle
        )
        
        // Add the strategies to the user
        user.strategies.append(strategy1)
        user.strategies.append(strategy2)
        
        // Save to the database
        try? modelContext.save()
    }
}

struct CardsView: View {
    @Binding var path: [Screen]
    @Bindable var userModel: User
    
    @State private var filteredStrategies: [Strategy] = []
    
    var body: some View {
        VStack {
            Text("Total strategies: \(userModel.strategies.count)")
                .font(.caption)
            
            Text("Filtered strategies: \(filteredStrategies.count)")
                .font(.caption)
            
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
                DeckView($filteredStrategies) { strategy in
                    // Rest of your deck view code
                    RoundedRectangle(cornerRadius: 25.0)
                        .aspectRatio(1.0, contentMode: .fit)
                        .foregroundStyle(.white)
                        .overlay {
                            ZStack{
                                Text(strategy.name.sentenceCased())
                                    .font(.title2)
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
                                    .padding()
                            }
                        }
                        .padding()
                }
                .deckViewConfiguration(DeckViewConfiguration(itemDisplayCount: 5, verticalDragThreshold: 50))
            }
        }
        .navigationTitle("Today, let's...")
        .padding()
        .navigationDestination(for: Screen.self) { screen in
            // Your navigation destinations
            switch screen {
            case .discover:
                DiscoverView(path: $path)
            case .doIt(let strategy):
                DoItView(path: $path, strategy: strategy)
            case .reflect(let strategy):
                ReflectView(path: $path, strategy: strategy)
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
}

extension String {
    func sentenceCased() -> String {
        guard let first = self.first else { return self }
        return first.uppercased() + self.dropFirst().lowercased()
    }
}


//#Preview {
//    DiscoverView(path: <#[Screen]#>, strategies: [Strategy(name: "Note when you compare yourself to others", description: "[desc]", duration: .short, instructions: "instructions!", content: "CONTNET", contentType: .article)])
//}
