import DeckKit
import SwiftData
import SwiftUI

struct DiscoverView: View {
    @Query var users: [User]
    @Binding var path: [Screen]
    
    var body: some View {
        NavigationStack(path: $path) {
            ZStack {
                Color.cream.ignoresSafeArea()
                if let userModel = users.first {
                    CardsView(path: $path, userModel: userModel, filteredStrategies: [])
                }
            }
        }
    }
}

struct CardsView: View {
    @Binding var path: [Screen]
    var userModel: User
    @State var filteredStrategies: [Strategy]
    
    var body: some View {
        
        DeckView($filteredStrategies) { strategy in
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
        .navigationTitle("Today, let's...")
        .padding()
        .navigationDestination(for: Screen.self) { screen in
            switch screen {
            case .discover:
                DiscoverView(path: $path, userModel: userModel)
            case .doIt(let strategy):
                DoItView(path: $path, strategy: strategy)
            case .reflect(let strategy):
                ReflectView(path: $path, strategy: strategy)
            default:
                // MARK: Placeholder for unhandled cases
                Text("ADD OTHERS HERE FIX THIS")
            }
        }
        .onAppear {
            // Update the filtered strategies when the view appears
            filteredStrategies = userModel.getFilteredStrategies()
        }
        .onChange(of: userModel.strategies) {
            // Update the filtered strategies when the strategies array changes
            filteredStrategies = userModel.getFilteredStrategies()
        }
        .onChange(of: userModel.eatingStyle) {
            // Update when eating style changes
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
