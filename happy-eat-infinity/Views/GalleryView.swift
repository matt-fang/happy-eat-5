import SwiftData
import SwiftUI

struct GalleryView: View {
    @Query(sort: \Reflection.date, order: .reverse) var reflections: [Reflection]
    @Binding var path: [NavScreen]
    
    // Color palette for different ratings
    let ratingColors: [Int: Color] = [
        2: Color(red: 0.27, green: 0.74, blue: 0.94), // blue
        3: Color(red: 0.14, green: 0.77, blue: 0.62), // orange
        1: Color(red: 1, green: 0.86, blue: 0.27)  // yellow
    ]
    
    let ratingEmojis: [Int: String] = [
        3: "🎉",
        2: "😐",
        1: "😕"
    ]
    
    let columns = Array(repeating: GridItem(.flexible(), spacing: 2), count: 3)
    
    var body: some View {
        NavigationStack(path: $path) {
            ZStack {
                Color.cream.ignoresSafeArea()
                ScrollView {
                    reflectionGrid
                }
                .navigationTitle("Reflection Gallery")
                .navigationDestination(for: NavScreen.self) { screen in
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
    
    var reflectionGrid: some View {
        LazyVGrid(columns: columns, spacing: 2) {
            ForEach(reflections) { reflection in
                Button {
                    path.append(.reflectionDetail(reflection))  // Push the detail view
                } label: {
                    ZStack {
                        Rectangle()
//                            .fill(ratingColors[reflection.successRating] ?? Color.newYellow)
                            .fill(Color(hex: reflection.successColor))
                            .aspectRatio(1, contentMode: .fit)
                        
                        Text(ratingEmojis[reflection.successRating] ?? "")
                            .font(.system(size: 32))
                    }
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
        ZStack {
            Color.cream.ignoresSafeArea()
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    VStack(alignment: .leading, spacing: 8) {
                        HStack {
                            Text(reflection.date, style: .date)
                                .font(.headline)
                            Spacer()
                            Text(ratingEmojis[reflection.successRating] ?? "")
                                .font(.system(size: 32))
                        }
                        
                        Text(reflection.strategyID.sentenceCased())
                            .font(.title)
                            .fontWeight(.bold)
                    }
                
                    
                    //                if let strategy = strategy {
                    //                    Text("Strategy: \(strategy.name)")
                    //                        .font(.title2)
                    //                }
                    
                    if let notes = reflection.userNotes, !notes.isEmpty {
                        Divider()
                        VStack(alignment: .leading) {
                            Text("Notes")
                                .font(.headline)
                            Text(notes)
                                .font(.system(size: 20, design: .rounded))
                                .padding(.vertical, 4)
                        }
                    }
                    
                    Divider()
                    
                    VStack(alignment: .leading) {
                        Text("Journal Entry")
                            .font(.headline)
                        Text(reflection.strategyEntry ?? "No journal entry.")
                            .font(.system(size: 20, design: .rounded))
                            .padding(.vertical, 4)
                    }
                    
                    
                }
                .padding()
            }
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    
    //MARK: get rid of (one of) these duplicates eventually
    private let ratingEmojis: [Int: String] = [
        3: "🎉",
        2: "😐",
        1: "😕"
    ]
    
    private let ratingColors: [Int: Color] = [
        3: Color(red: 1, green: 0.86, blue: 0.27),
        2: Color(red: 0.94, green: 0.42, blue: 0.09),
        1: Color(red: 0.06, green: 0.59, blue: 0.73)
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
