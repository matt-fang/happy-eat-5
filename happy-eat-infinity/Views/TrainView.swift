import SwiftUI
import SwiftData

struct TrainView: View {
    @Environment(\.modelContext) private var context
    @Binding var path: [NavScreen]
    let strategy: Strategy
    let selectedOption: String
    @Query var users: [User]
    
    // Grid layout for grass tiles - using square grid
    let columns = Array(repeating: GridItem(.flexible(), spacing: 0), count: 12)
    
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
    
    // Calculate safe area for props
    private var safeArea: (minX: CGFloat, maxX: CGFloat, minY: CGFloat, maxY: CGFloat) {
        let padding: CGFloat = 80 // Safe area from edges
        return (
            minX: padding,
            maxX: UIScreen.main.bounds.width - padding,
            minY: padding + 120, // Account for header
            maxY: UIScreen.main.bounds.height - padding - 100 // Account for buttons
        )
    }
    
    // Generate random positions within safe area
    private var propPositions: [(CGFloat, CGFloat)] {
        (0..<15).map { _ in
            (CGFloat.random(in: safeArea.minX...safeArea.maxX),
             CGFloat.random(in: safeArea.minY...safeArea.maxY))
        }
    }
    
    var body: some View {
        ZStack {
            Color.cream.ignoresSafeArea()
            
            // Full-screen landscape
            ZStack(alignment: .center) {
                // Fixed grass grid
                LazyVGrid(columns: columns, spacing: 0) {
                    ForEach(0..<144, id: \.self) { index in
                        Image(grassTypes.randomElement() ?? "ground/grass 1")
                            .resizable()
                            .interpolation(.none)
                            .scaledToFit()
                    }
                }
                .frame(maxHeight: .infinity, alignment: .center) // Ensures centering
                .ignoresSafeArea()
                
                // Random props with fixed positions
//                ForEach(Array(zip(propPositions, (0..<15))), id: \.1) { position, index in
//                    let prop = weightedRandomProp()
//                    Image(prop.name)
//                        .resizable()
//                        .interpolation(.none)
//                        .scaledToFit()
//                        .frame(width: 40, height: 40)
//                        .position(x: position.0, y: position.1)
//                }
                
                // Mon character
                if let user = users.first {
                    Image(getMonImage(for: user.eatingStyle))
                        .resizable()
                        .interpolation(.none)
                        .scaledToFit()
                        .frame(width: 40, height: 40)
                        .position(
                            x: UIScreen.main.bounds.width/2,
                            y: UIScreen.main.bounds.height/2
                        )
                }
            }
            .zIndex(0)
            
            // Main content container
            VStack(spacing: 24) {
                // Header text
                Text("Let's train \(users.first?.monName ?? "Mon")!")
                    .font(.system(size: 32, weight: .bold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)
                    .padding(.top)
                
                // Strategy text
                Text("\(selectedOption)")
                    .font(.title3)
                    .fontWeight(.medium)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)
                
                Spacer()
                
                Text("Come back and make a selection once you've tried the strategy in real life!")
                    .multilineTextAlignment(.center)
                    .foregroundStyle(.gray)
                    .padding()
                // Action buttons
                HStack(spacing: 16) {
                    Button {
                        path.append(.reflect(strategy))
                    } label: {
                        Text("I did it!")
                            .font(.title3)
                            .fontWeight(.bold)
                            .foregroundStyle(.white)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 20)
                            .background(Color.newOrange)
                            .cornerRadius(20)
                    }
                    
                    Button {
                        path.append(.reflect(strategy))
                    } label: {
                        Text("Not today")
                            .font(.title3)
                            .fontWeight(.medium)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 20)
                            .background(Color.gray.opacity(0.2))
                            .cornerRadius(20)
                    }
                    
                }
                .padding(.horizontal)
                .padding(.bottom, 32)
            }
            .zIndex(1)
        }
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
