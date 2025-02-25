import SwiftUI
import SwiftData

struct GalleryView: View {
    @Environment(\.modelContext) var modelContext
    
    // Make sure you have NO predicates or filters on this query
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
        ScrollView {
            VStack {
                Text("Debug: Found \(reflections.count) reflections")
                    .font(.caption)
                    .foregroundColor(.gray)
                    .padding(.top)
                
                if reflections.isEmpty {
                    VStack(spacing: 20) {
                        Text("No reflections yet")
                            .font(.headline)
                            .padding(.top, 40)
                        
                        Text("Try a strategy and reflect on how it went")
                            .foregroundColor(.secondary)
                        
                        // Debug button to create sample data directly
                        Button("Create Test Reflection") {
                            createTestReflection()
                        }
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                } else {
                    LazyVGrid(columns: columns, spacing: 2) {
                        ForEach(reflections) { reflection in
                            Button {
                                path.append(.reflectionDetail(reflection))
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
            }
        }
        .navigationTitle("Reflection Gallery")
        .onAppear {
            print("⚠️ GalleryView appeared")
            dumpReflectionsData()
        }
        .refreshable {
            dumpReflectionsData()
        }
    }
    
    private func dumpReflectionsData() {
        print("⚠️ GalleryView - Reflection count: \(reflections.count)")
        for reflection in reflections {
            print("⚠️ Found reflection: \(reflection.strategyID), Rating: \(reflection.successRating), Date: \(reflection.date)")
        }
    }
    
    private func createTestReflection() {
        let testReflection = Reflection(
            strategyID: "Test Strategy \(Int.random(in: 1...1000))",
            date: Date(),
            successRating: Int.random(in: 1...3),
            userNotes: "This is a test reflection created directly in GalleryView."
        )
        
        print("⚠️ Creating test reflection with ID: \(testReflection.strategyID)")
        
        modelContext.insert(testReflection)
        
        do {
            try modelContext.save()
            print("⚠️ Test reflection saved successfully!")
            dumpReflectionsData()
        } catch {
            print("⚠️ Failed to save test reflection: \(error)")
        }
    }
}
