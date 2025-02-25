import SwiftData
import SwiftUI

struct GalleryView: View {
    @Query(sort: \Reflection.date, order: .reverse) var reflections: [Reflection]
    @Binding var path: [Screen]
    
    // Color palette for different ratings
    let ratingColors: [Int: Color] = [
        3: Color(red: 0.3, green: 0.7, blue: 0.9), // Light blue
        2: Color(red: 0.2, green: 0.5, blue: 0.8), // Medium blue
        1: Color(red: 0.1, green: 0.3, blue: 0.7)  // Deep blue
    ]
    
    let ratingEmojis: [Int: String] = [
        3: "🎉",
        2: "😐",
        1: "😕"
    ]
    
    let columns = Array(repeating: GridItem(.flexible(), spacing: 2), count: 3)
    
    var body: some View {
        NavigationStack(path: $path) {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 2) {
                    ForEach(reflections) { reflection in
                        Button {
                            path.append(.reflectionDetail(reflection))  // Push the detail view
                        } label: {
                            ZStack {
                                Rectangle()
                                    .fill(ratingColors[reflection.successRating] ?? .blue)
                                    .aspectRatio(1, contentMode: .fit)
                                
                                Text(ratingEmojis[reflection.successRating] ?? "")
                                    .font(.system(size: 32))
                            }
                        }
                    }
                }
            }
            .navigationTitle("Reflection Gallery")
            .navigationDestination(for: Screen.self) { screen in
                switch screen {
                case .reflectionDetail(let reflection):
                    ReflectionDetailView(reflection: reflection).onAppear { print ("strategy is \(reflection.strategyID)")}
                case _:
                    // MARK: l
                    Text("WHOOPS BUG FIX THIS LATER")
                }
                
            }
        }
    }
}

struct ReflectionDetailView: View {
    @Environment(\.modelContext) var context
    @Query(sort: \Strategy.name) var strategies: [Strategy]
    
    let reflection: Reflection
    
    var strategy: Strategy? {
        strategies.first { $0.id == reflection.strategyID }
    }
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                HStack {
                    Text(reflection.date, style: .date)
                        .font(.headline)
                    Spacer()
                    Text(ratingEmojis[reflection.successRating] ?? "")
                        .font(.system(size: 32))
                }
                .padding(.bottom)
                
//                if let strategy = strategy {
//                    Text("Strategy: \(strategy.name)")
//                        .font(.title2)
//                }
                
                Text("Strategy: \(reflection.strategyID)")
                    .font(.title2)
                
                Text("Rating: \(getRatingText(reflection.successRating))")
                    .foregroundColor(ratingColors[reflection.successRating])
                    .font(.title3)
                
                if let notes = reflection.userNotes, !notes.isEmpty {
                    VStack(alignment: .leading) {
                        Text("Notes:")
                            .font(.headline)
                        Text(notes)
                            .padding()
                            .background(Color.gray.opacity(0.1))
                            .cornerRadius(8)
                    }
                }
            }
            .padding()
        }
        .navigationBarTitleDisplayMode(.inline)
    }
    
    private let ratingEmojis: [Int: String] = [
        3: "🎉",
        2: "😐",
        1: "😕"
    ]
    
    private let ratingColors: [Int: Color] = [
        3: Color(red: 0.3, green: 0.7, blue: 0.9),
        2: Color(red: 0.2, green: 0.5, blue: 0.8),
        1: Color(red: 0.1, green: 0.3, blue: 0.7)
    ]
    
    private func getRatingText(_ rating: Int) -> String {
        switch rating {
        case 3: return "Great"
        case 2: return "Meh"
        case 1: return "Tough"
        default: return "Unknown"
        }
    }
}
