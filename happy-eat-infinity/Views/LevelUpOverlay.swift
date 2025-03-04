import SwiftUI

struct LevelUpOverlay: View {
    let userModel: User
    
    var body: some View {
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