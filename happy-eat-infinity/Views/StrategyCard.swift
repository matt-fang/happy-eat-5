import SwiftUI

struct StrategyCard: View {
    let strategy: Strategy
    let reflections: [Reflection]
    let path: Binding<[NavScreen]>
    
    // Get safe name for comparison
    private var strategyName: String {
        return strategy.name ?? "Unknown Strategy"
    }
    
    var body: some View {
        RoundedRectangle(cornerRadius: 25.0)
            .aspectRatio(1.0, contentMode: .fit)
            .foregroundStyle(
                reflections.map({ $0.strategyName }).contains(strategyName)
                ? Color(hex: reflections.first(where: { $0.strategyName == strategyName })?.successColor ?? "FFFFFF")
                : .white
            )
            .overlay {
                ZStack {
                    Text(strategyName.sentenceCased())
                        .font(.system(size: 30, weight: .medium, design: .rounded))
                        .foregroundStyle(
                            reflections.map({ $0.strategyName }).contains(strategyName)
                            ? .white : .black)
                        .multilineTextAlignment(.center)
                        .padding()
                        .opacity(0.9)
                }
            }
            .shadow(color: Color.black.opacity(0.05), radius: 20)
            .overlay(alignment: .bottomTrailing) {
                Button {
                    path.wrappedValue.append(.strategyChoice(strategy))
                } label: {
                    Image(systemName: "play.circle.fill")
                        .font(.system(size: 30))
                        .foregroundStyle(
                            reflections.map({ $0.strategyName }).contains(strategyName)
                            ? .white : .newOrange)
                        .padding()
                }
            }
            .padding()
    }
} 
