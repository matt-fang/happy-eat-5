import SwiftData
import SwiftUI

struct ReflectView: View {
    @Environment(\.modelContext) private var context
    @Query var users: [User]
    @Binding var path: [NavScreen]
    
    var strategyEntry: String?
    let strategy: Strategy
    
    @State private var selectedRating: Int?
    @State private var notes: String = ""
    
    var body: some View {
        ZStack {
            Color.cream.ignoresSafeArea()
            VStack(alignment: .leading, spacing: 20) {
                VStack(alignment: .leading, spacing: 8) {
                    Text("How helpful was this strategy?")
                        .font(.title)
                        .fontWeight(.bold)
                    
                    // Rating buttons
                    HStack(spacing: 20) {
                        ratingButton(rating: 3, label: "Great!", emoji: "🎉", color: "24C59D")
                        ratingButton(rating: 2, label: "Meh", emoji: "😐", color: "45BDF1")
                        ratingButton(rating: 1, label: "Tough", emoji: "😕", color: "FF7E13")
                    }
                }
                
                // Notes field
                VStack(alignment: .leading) {
                    Text("Additional notes (optional)")
                        .font(.headline)
                    TransparentTextEntry(text: $notes, placeholder: "Write your notes here")
                }
                
                Spacer()
                
                // Save button
                Button {
                    if let userModel = users.first {
                        userModel.playStreakAnimation = true
                        saveReflection()
                    }
                } label: {
                    Text("Save Reflection")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(selectedRating != nil ? Color.newRed : Color.gray)
                        .cornerRadius(10)
                }
                .disabled(selectedRating == nil)
                .padding(.bottom)
            }
            .padding()
        }
    }
    
    private func ratingButton(rating: Int, label: String, emoji: String, color: String) -> some View {
        Button(action: { selectedRating = rating }) {
            VStack(spacing: 4) {
                Text(emoji)
                    .font(.system(size: 32))
                Text(label)
                    .font(.system(size: 16, weight: .medium, design: .rounded))
            }
            .frame(maxWidth: .infinity)
            .padding()
            .background(selectedRating == rating ? Color(hex: color) : Color.gray.opacity(0.1))
            .foregroundColor(selectedRating == rating ? .white : .primary)
            .cornerRadius(10)
        }
    }
    
    private func saveReflection() {
        guard let rating = selectedRating else { return }
        
        var successColor: String {
            switch rating {
            case 1:
                "FF7E13"
            case 2:
                "45BDF1"
            case 3:
                "24C59D"
            case _:
                "FF7E13"
            }
        }
        
        let reflection = Reflection(
            strategyID: strategy.name ?? "Strategy",
            date: Date(),
            successRating: rating,
            userNotes: notes.isEmpty ? nil : notes,
            strategyEntry: strategyEntry,
            successColor: successColor
        )
        
        context.insert(reflection)
        
//        if let userModel = users.first {
//            userModel.updateStreak()
//        }
        
        // Go back to root
        path.removeAll()
    }
}
