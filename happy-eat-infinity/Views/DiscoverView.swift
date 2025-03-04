import DeckKit
import SwiftData
import SwiftUI

struct DiscoverView: View {
    @Environment(\.modelContext) private var modelContext
    @Query var users: [User]
    @Binding var path: [NavScreen]
    @State private var streakIsYellow = false
    
    var body: some View {
        NavigationStack(path: $path) {
            ZStack {
                Color.cream.ignoresSafeArea()
                if let userModel = users.first {
                    CardsView(path: $path, userModel: userModel, streakIsYellow: $streakIsYellow)
                        .onAppear {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                                withAnimation(.spring(duration: 1)) {
                                    if userModel.playStreakAnimation {
                                        streakIsYellow = true
                                        userModel.updateStreak()
                                        userModel.playStreakAnimation = false
                                    }
                                }
                                if streakIsYellow {
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                        withAnimation(.spring(duration: 0.5)) {
                                            streakIsYellow = false
                                        }
                                    }
                                }
                            }
                        }
                } else {
                    Text("No user found in database!")
                }
            }
        }
        .onAppear {
            print("DiscoverView appeared")
            print("Users array count: \(users.count)")
            if let user = users.first {
                print("User eating style: \(user.eatingStyle.rawValue)")
                print("User strategies count: \(user.strategies.count)")
            }
        }
    }
}
