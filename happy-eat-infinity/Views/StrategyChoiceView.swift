import SwiftUI
import SwiftData

struct StrategyChoiceView: View {
    @Binding var path: [NavScreen]
    let strategy: Strategy
    @State private var selectedOption: String?
    @Environment(\.dismiss) private var dismiss
    
    // Get safe name
    private var strategyName: String {
        return strategy.name ?? "Strategy"
    }
    
    var body: some View {
        ZStack {
            Color.newOrange.ignoresSafeArea()
            
            VStack(spacing: 24) {
                // Header with close button
                HStack {
                    Button {
                        path.removeAll()
                        path.append(.discover)
                    } label: {
                        Image(systemName: "xmark")
                            .font(.system(size: 17, weight: .medium))
                            .foregroundColor(.white)
                            .frame(width: 30, height: 30)
                    }
                    .padding(.leading)
                    
                    Spacer()
                }
                .padding(.top, 8)
                
                // Strategy name
                Text(strategyName.sentenceCased())
                    .font(.system(size: 32, weight: .bold))
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)
                    .padding(.top, 20)
                
                // Instructions
                Text(strategy.instructions ?? "")
                    .font(.title3)
                    .fontWeight(.medium)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)
                
                // Multiple choice options
                ScrollView {
                    VStack(spacing: 12) {
                        ForEach(strategy.content ?? [], id: \.self) { option in
                            Button {
                                selectedOption = option
                            } label: {
                                HStack {
                                    Text(option)
                                        .font(.body)
                                        .foregroundColor(selectedOption == option ? .primary : .white)
                                        .multilineTextAlignment(.leading)
                                    Spacer()
                                }
                                .padding()
                                .background(selectedOption == option ? Color.white : Color.white.opacity(0.2))
                                .cornerRadius(16)
                                .shadow(color: Color.black.opacity(0.05), radius: 5, x: 0, y: 2)
                            }
                        }
                    }
                    .padding()
                }
                
                Spacer()
                
                // Next button
                Button {
                    if let selectedOption = selectedOption {
                        path.append(.doIt(strategy, selectedOption))
                    }
                } label: {
                    Text("Next")
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundColor(.newOrange)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 20)
                        .background(Color.white)
                        .cornerRadius(20)
                }
                .disabled(selectedOption == nil)
                .padding(.horizontal)
                .padding(.bottom)
            }
        }
        .navigationBarHidden(true)
        .toolbar(.hidden, for: .tabBar)
    }
} 
