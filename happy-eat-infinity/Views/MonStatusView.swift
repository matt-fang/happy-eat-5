import SwiftUI

struct MonStatusView: View {
    let userModel: User
    let xpProgress: Double
    
    var body: some View {
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
} 