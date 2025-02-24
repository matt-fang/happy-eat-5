import SwiftUI

struct ReflectView: View {
    @Environment(\.modelContext) var context
    @Binding var path: [Screen]
    
    let strategy: Strategy
    
    @State private var selectedRating: Int?
    @State private var notes: String = ""
    
    var body: some View {
        VStack(spacing: 24) {
            Text("How did it go with \(strategy.name)?")
                .font(.title2)
                .multilineTextAlignment(.center)
            
            // Rating buttons
            HStack(spacing: 20) {
                ratingButton(rating: 3, label: "Great", emoji: "🎉")
                ratingButton(rating: 2, label: "Meh", emoji: "😐")
                ratingButton(rating: 1, label: "Tough", emoji: "😕")
            }
            
            // Notes field
            VStack(alignment: .leading) {
                Text("Any additional thoughts? (optional)")
                    .font(.subheadline)
                TextEditor(text: $notes)
                    .frame(height: 100)
                    .padding(8)
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(8)
            }
            
            Spacer()
            
            // Save button
            Button(action: saveReflection) {
                Text("Save Reflection")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(selectedRating != nil ? Color.blue : Color.gray)
                    .cornerRadius(10)
            }
            .disabled(selectedRating == nil)
            .padding(.bottom)
        }
        .padding()
    }
    
    private func ratingButton(rating: Int, label: String, emoji: String) -> some View {
        Button(action: { selectedRating = rating }) {
            VStack {
                Text(emoji)
                    .font(.system(size: 32))
                Text(label)
                    .font(.subheadline)
            }
            .frame(maxWidth: .infinity)
            .padding()
            .background(selectedRating == rating ? Color.blue : Color.gray.opacity(0.1))
            .foregroundColor(selectedRating == rating ? .white : .primary)
            .cornerRadius(8)
        }
    }
    
    private func saveReflection() {
        guard let rating = selectedRating else { return }
        
        let reflection = Reflection(
            strategyID: strategy.name,
            date: Date(),
            successRating: rating,
            userNotes: notes.isEmpty ? nil : notes
        )
        
        context.insert(reflection)
        
        // Go back to root
        path.removeAll()
    }
}
