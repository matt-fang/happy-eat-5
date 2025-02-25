import DeckKit
import SwiftData
import SwiftUI

struct DiscoverView: View {
    @Binding var path: [Screen]
    @State var strategies: [Strategy] = []

    var body: some View {
        NavigationStack(path: $path) {
            DeckView($strategies) { strategy in
                // Remove the NavigationLink wrapper since DeckView might be interfering
                // with the gesture recognition
                RoundedRectangle(cornerRadius: 25.0)
                    .foregroundStyle(.thinMaterial)
                    .frame(width: 300, height: 300)
                    .overlay {
                        Text(strategy.name.sentenceCased())
                            .multilineTextAlignment(.center)
                            .padding()
                    }
                    .shadow(radius: 10)
                    .overlay(alignment: .bottomTrailing) {
                        Button { // MARK: Button has higher gesture priority than DeckView which has higher priority than onTapGesture — so onTapGesture won't work
                            path.append(.doIt(strategy))
                        } label: {
                            Image(systemName: "play.circle.fill")
                                .font(.system(size: 30))
                                .padding()
                        }
                    }
            }
            .onAppear {
                loadStrategies()
            }
            .navigationTitle("Today, let's...")
            .padding()
            .navigationDestination(for: Screen.self) { screen in
                switch screen {
                case .discover:
                    DiscoverView(path: $path, strategies: strategies)
                case .doIt(let strategy):
                    DoItView(path: $path, strategy: strategy)
                case .reflect(let strategy):
                    ReflectView(path: $path, strategy: strategy)
                case _:

                    // MARK:

                    Text("ADD OTHERS HERE FIX THIS")
                }
            }
        }
    }

    private func loadStrategies() {
        strategies = StrategyParser.loadStrategiesFromFile()
    }
}

extension String {
    func sentenceCased() -> String {
        guard let first = self.first else { return self }
        return first.uppercased() + self.dropFirst().lowercased()
    }
}


// #Preview {
//    DiscoverView(path: <#[Screen]#>, strategies: [Strategy(name: "Note when you compare yourself to others", description: "[desc]", duration: .short, instructions: "instructions!", content: "CONTNET", contentType: .article)])
// }
