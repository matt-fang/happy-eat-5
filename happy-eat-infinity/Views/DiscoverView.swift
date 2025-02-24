import DeckKit
import SwiftData
import SwiftUI

struct DiscoverView: View {
    @Binding var path: [Screen]
    @State var strategies = [Strategy(name: "Note when you compare yourself to others", description: "[desc]", duration: .short, instructions: "instructions!", content: "CONTNET", contentType: .article)]

    var body: some View {
        NavigationStack(path: $path) {
            DeckView($strategies) { strategy in
                // Remove the NavigationLink wrapper since DeckView might be interfering
                // with the gesture recognition
                Button { // MARK: Button has higher gesture priority than DeckView which has higher priority than onTapGesture — so onTapGesture won't work
                    path.append(.doIt(strategy))
                } label: {
                    RoundedRectangle(cornerRadius: 25.0)
                        .foregroundStyle(.thinMaterial)
                        .frame(width: 300, height: 300)
                        .overlay(Text(strategy.name))
                        .shadow(radius: 10)
                }
            }.padding()
                .navigationDestination(for: Screen.self) { screen in
                    switch screen {
                    case .discover:
                        DiscoverView(path: $path, strategies: strategies)
                    case .doIt(let strategy):
                        DoItView(path: $path, strategy: strategy)
                    case .reflect:
                        Text("Reflect View")
                    case _:
                        // MARK:
                        Text("ADD OTHERS HERE FIX THIS")
                    }
                }
        }
    }
}

// Update Screen enum to include associated value for strategy
enum Screen: Hashable {
    case discover
    case doIt(Strategy)
    case reflect
    case strategy(Strategy)
//    case reflect(Strategy)
    case reflectionDetail(Reflection)
}

//#Preview {
//    DiscoverView(path: <#[Screen]#>, strategies: [Strategy(name: "Note when you compare yourself to others", description: "[desc]", duration: .short, instructions: "instructions!", content: "CONTNET", contentType: .article)])
//}
