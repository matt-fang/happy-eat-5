import SwiftUI

struct StreakBadgeView: View {
    @State private var scale: CGFloat = 0
    @State private var opacity: Double = 0
    let streak: Int
    @Binding var isYellow: Bool
    
    var body: some View {
        ZStack {
            Capsule()
                .fill(isYellow ? Color.newYellow : Color.lightGray)
                .frame(maxWidth: 160, maxHeight: 40)
            HStack(alignment: .center, spacing: 6) {
                if isYellow {
                    Image(systemName: "flame.fill")
                        .font(.system(size: 14))
                        .foregroundColor(.newOrange)
                }
                Text("\(streak) completed")
                    .font(.system(.body, design: .rounded).bold())
                    .foregroundStyle(isYellow ? Color.newOrange : .black)
                    .contentTransition(.numericText())
            }
            .padding()
        }
        }
    }

