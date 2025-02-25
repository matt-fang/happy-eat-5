import SwiftUI

struct DoItView: View {
    @Binding var path: [Screen]
    let strategy: Strategy
    @State private var journalEntry: String = ""
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            // Header section
            VStack(alignment: .leading, spacing: 8) {
                Text(strategy.name.sentenceCased())
                    .font(.title)
                    .fontWeight(.bold)
                
                Text(strategy.instructions)
                    .font(.body)
                    .foregroundColor(.secondary)
                    .padding(.bottom, 8)
            }
            .padding(.horizontal)
            
            // Content section based on type
            contentSection
                .padding(.horizontal)
            
            Spacer()
            
            // Done button
            Button {
                if strategy.contentType == .textField {
                    // Save journal entry to strategy content
                    // You would need to make strategy.content mutable or use a different approach
                    // This is just a placeholder
                }
                
                // Navigate to reflection view
                path.append(.reflect(strategy))
            } label: {
                Text("Done")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.accentColor)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding()
        }
        .navigationDestination(for: Screen.self) { screen in
            switch screen {
            case .reflect(let strategy):
                ReflectView(path: $path, strategy: strategy)
                    .onAppear { print(strategy) }
            case _:
                Text("ADD MORE CASES FIX THIS!")
            }
        }
        .navigationBarTitleDisplayMode(.inline)
    }
    
    @ViewBuilder
    private var contentSection: some View {
        switch strategy.contentType {
        case .article:
            if let content = strategy.content {
                ScrollView {
                    Text(content)
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(8)
                }
            } else {
                Text("No content! Try another strategy.")
                    .italic()
                    .foregroundColor(.secondary)
            }
            
        case .textField:
            VStack(alignment: .leading, spacing: 8) {
                Text("Journal Entry")
                    .font(.headline)
                
                TextEditor(text: $journalEntry)
                    .frame(minHeight: 150)
                    .padding(8)
                    .background(Color(.systemGray6))
                    .cornerRadius(8)
            }
            
        case .none:
            VStack(spacing: 16) {
                Image(systemName: "checkmark.circle")
                    .font(.system(size: 50))
                    .foregroundColor(.accentColor)
                
                Text("Complete this activity outside the app.")
                    .multilineTextAlignment(.center)
                
                Text("Press Done when you've finished.")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.center)
            }
            .frame(maxWidth: .infinity)
            .padding(.vertical, 40)
        }
    }
}
