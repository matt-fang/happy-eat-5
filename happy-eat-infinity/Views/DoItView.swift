import SwiftUI

struct DoItView: View {
    @Binding var path: [NavScreen]
    let strategy: Strategy
    @State private var journalEntry: String = ""
    var strategyEntry = ""
    
    var body: some View {
        ZStack {
            Color.cream.ignoresSafeArea()
            ScrollView {
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
                }
                .navigationDestination(for: NavScreen.self) { screen in
                    switch screen {
                    case .reflect(let strategy, let journalEntry):
                        ReflectView(path: $path, strategyEntry: journalEntry, strategy: strategy)
                    case _:
                        Text("uhoh, this looks like a navigation bug!")
                    }
                }
                .navigationBarTitleDisplayMode(.inline)
            }
            .safeAreaInset(edge: .bottom) {
                Button {
                    // Navigate to reflection view
                    path.append(.reflect(strategy, journalEntry))
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
        }
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
            VStack(alignment: .leading) {
                Text("Journal Entry")
                    .font(.headline)
                TransparentTextEntry(text: $journalEntry, placeholder: "Write your thoughts here")
            }
            
        case .action:
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
