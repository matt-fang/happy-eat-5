import SwiftUI
import SwiftData

struct TrainView: View {
    @Binding var path: [NavScreen]
    let strategy: Strategy
    @Query var users: [User]
    
    // Grid layout for grass tiles - adjusted for larger sprites
    let columns = Array(repeating: GridItem(.flexible(), spacing: 0), count: 8)
    
    // Random grass types
    let grassTypes = ["ground/grass 1", "ground/grass 2", "ground/grass 3"]
    
    // Props with their weights for random distribution
    let props: [(name: String, weight: Int)] = [
        ("props/blue flower", 3),
        ("props/pink flowers", 3),
        ("props/leaf", 4),
        ("props/rock 1", 2),
        ("props/rock 2", 2),
        ("props/sprout", 3),
        ("props/mushroom", 2)
    ]
    
    var body: some View {
        ZStack {
            Color.cream.ignoresSafeArea()
            
            // Landscape
            ScrollView {
                LazyVGrid(columns: columns, spacing: 0) {
                    ForEach(0..<300, id: \.self) { index in
                        Image(grassTypes.randomElement() ?? "ground/grass 1")
                            .resizable()
                            .interpolation(.none)
                            .scaledToFit()
                            .frame(width: UIScreen.main.bounds.width / 8, height: UIScreen.main.bounds.width / 8)
                    }
                }
                .overlay {
                    // Random props
                    ForEach(0..<30) { _ in
                        let prop = weightedRandomProp()
                        Image(prop.name)
                            .resizable()
                            .interpolation(.none)
                            .scaledToFit()
                            .frame(width: 64, height: 64)
                            .position(
                                x: CGFloat.random(in: 0...UIScreen.main.bounds.width),
                                y: CGFloat.random(in: 0...UIScreen.main.bounds.height * 2)
                            )
                    }
                }
            }
            .ignoresSafeArea()
            
            // Overlay content
            VStack {
                // Strategy name at top
                Text(strategy.name?.sentenceCased() ?? "Strategy")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(.top, 8)
                
                Spacer()
                
                // Mon character
                if let user = users.first {
                    Image(getMonImage(for: user.eatingStyle))
                        .resizable()
                        .interpolation(.none)
                        .scaledToFit()
                        .frame(width: 96, height: 96)
                        .position(
                            x: UIScreen.main.bounds.width * 0.5,
                            y: UIScreen.main.bounds.height * 0.3
                        )
                }
                
                Spacer()
                
                // Done button at bottom
                Button {
                    path.append(.reflect(strategy, ""))
                } label: {
                    Text("Done")
                        .font(.headline)
                        .foregroundColor(.black)
                        .padding(.horizontal, 20)
                        .padding(.vertical, 10)
                        .background(Color.white)
                        .cornerRadius(8)
                }
                .padding(.bottom, 8)
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbar(.hidden, for: .tabBar)
    }
    
    private func weightedRandomProp() -> (name: String, weight: Int) {
        let totalWeight = props.reduce(0) { $0 + $1.weight }
        var random = Int.random(in: 0..<totalWeight)
        
        for prop in props {
            if random < prop.weight {
                return prop
            }
            random -= prop.weight
        }
        
        return props[0]
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
} 
