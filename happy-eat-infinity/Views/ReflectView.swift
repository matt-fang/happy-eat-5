import SwiftUI
import SwiftData

struct ReflectView: View {
    @Environment(\.modelContext) var context
    @Binding var path: [Screen]
    
    // Force fetch reflections to verify they exist
    @Query var reflections: [Reflection]
    
    let strategy: Strategy
    
    @State private var selectedRating: Int?
    @State private var notes: String = ""
    @State private var showingSaveError = false
    @State private var errorMessage = ""
    
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
            
            // Diagnostic information
            Text("Current reflections: \(reflections.count)")
                .font(.caption)
                .foregroundColor(.gray)
        }
        .padding()
        .alert("Save Error", isPresented: $showingSaveError) {
            Button("OK") { }
        } message: {
            Text(errorMessage)
        }
        .onAppear {
            print("⚠️ ReflectView appeared")
            print("⚠️ Model context: \(String(describing: context))")
            dumpReflections()
        }
    }
    
    private func dumpReflections() {
        print("⚠️ Current reflections count: \(reflections.count)")
        for reflection in reflections {
            print("⚠️ Found reflection: \(reflection.strategyID), Rating: \(reflection.successRating)")
        }
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
        
        // Create a new reflection
        let reflection = Reflection(
            strategyID: strategy.id,
            date: Date(),
            successRating: rating,
            userNotes: notes.isEmpty ? nil : notes
        )
        
        print("⚠️ About to save reflection with ID: \(reflection.strategyID)")
        
        // Insert into context
        context.insert(reflection)
        
        do {
            // Force an immediate save
            try context.save()
            print("⚠️ Successfully saved reflection!")
            dumpReflections() // Check if it shows up immediately
            
            // Return to previous screen
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                path.removeAll()
            }
        } catch {
            print("⚠️ Failed to save reflection: \(error)")
            errorMessage = "Failed to save: \(error.localizedDescription)"
            showingSaveError = true
        }
    }
}
