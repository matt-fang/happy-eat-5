import SwiftUI
import SwiftData

struct OnboardingView: View {
    @Environment(\.modelContext) var context
    @AppStorage("hasCompletedOnboarding") private var hasCompletedOnboarding = false
    @State private var currentPage = 0
    @State private var selectedMon: OnboardingMon?
    var userModel: User = User(eatingStyle: .selfCare, monName: "Yorox")
    @Query var users: [User]
    
    let mons = [
        OnboardingMon(image: "yorox", name: "Yorox", description: "wants to eat what's good for him but hasn't gotten around to it.", eatingStyle: .selfCare),
        OnboardingMon(image: "mushlo", name: "Mushlo", description: "eats when he's stressed or feeling down.", eatingStyle: .stressed),
        OnboardingMon(image: "kitsu", name: "Kitsu", description: "feels anxious around food, sometimes guilty.", eatingStyle: .anxious),
        OnboardingMon(image: "miso", name: "Miso", description: "doesn't feel very confident in herself or her body.", eatingStyle: .unconfident)
    ]
    
    var body: some View {
        ZStack {
            Color.cream.ignoresSafeArea()
            TabView(selection: $currentPage) {
                // Welcome Page
                VStack(spacing: 24) {
                    Text("Welcome to Happy Eat!")
                        .font(.title)
                        .fontWeight(.bold)
                    Text("Choose your starter mon on the next screen.")
                        .font(.title3)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                }
                .tag(0)
                
                // Style Selection
                
                ScrollView {
                    VStack {
                        Spacer()
                        Text("Which mon do you relate to the most?")
                            .font(.title3)
                            .multilineTextAlignment(.center)
                            .padding()
                        strategies
                        Spacer()
                    }
                }
                .tag(1)
                
                // Strategy Info
                VStack(spacing: 32) {
                    VStack(spacing: 16) {
                        Text("Perfect! Your mission is to train your mon to be a happier, healthier eater.")
                            .font(.title2)
                            .fontWeight(.bold)
                            .multilineTextAlignment(.center)
                        
                        Text("Swipe through the cards on the next screen, and train them with the strategies that seem the most helpful!")
                            .font(.body)
                            .multilineTextAlignment(.center)
                    }
                    .padding(.horizontal)
                    
                    Button(action: {
                        hasCompletedOnboarding = true

                    }) {
                        Text("Get Started")
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.newOrange)
                            .cornerRadius(10)
                            
                    }
                    .padding(.horizontal)
                }
                .padding()
                .tag(2)
            }
            .tabViewStyle(PageTabViewStyle())
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
        }
        .overlay(alignment: .bottom) {
            HStack {
                Spacer()
                Image(systemName: "chevron.left")
                    .padding()
                    .bold()
                    .foregroundStyle(Color.newOrange)
                Spacer()
                Image(systemName: "chevron.right")
                    .padding()
                    .bold()
                    .foregroundStyle(Color.newOrange)
                Spacer()
            }
            .padding(.horizontal, 40)
        }
    }
    
    var strategies: some View {
        LazyVGrid(columns: [
            GridItem(.flexible(), spacing: 16),
            GridItem(.flexible(), spacing: 16)
        ], spacing: 16) {
            ForEach(mons, id: \.id) { mon in
                Button(action: {
                    selectedMon = mon
                    userModel.eatingStyle = selectedMon?.eatingStyle ?? EatingStyle.selfCare
                    userModel.monName = selectedMon?.name ?? "Yorox"
                    print("Selected mon: \(mon.name) with eating style: \(mon.eatingStyle.rawValue)")
                    print("User model eating style: \(userModel.eatingStyle.rawValue)")
                    
                    if let existingUser = users.first {
                        print("Deleting existing user with eating style: \(existingUser.eatingStyle.rawValue)")
                        context.delete(existingUser)
                    }
                    print("Inserting new user with eating style: \(userModel.eatingStyle.rawValue)")
                    context.insert(userModel)
                }) {
                    VStack(spacing: 12) {
                        Image(mon.image)
                            .resizable()
                            .interpolation(.none)
                            .scaledToFit()
                            .frame(width: 100, height: 100) // Ensures a uniform size for all images
                            .padding(.bottom, 4)

                        Text(mon.name)
                            .font(.headline)

                        Text(mon.description)
                            .font(.caption)
                            .multilineTextAlignment(.center)
                            .foregroundColor(.gray)
                    }
                    .frame(height: 200) // Ensures a uniform card size
                    .padding()
                    .background(selectedMon?.id == mon.id ? Color.white : Color.gray.opacity(0.1))
                    .foregroundColor(.black)
                    .cornerRadius(12)
                    .shadow(color: .black.opacity(0.1), radius: 4, x: 0, y: 2) // Adds subtle depth
                }
            }
        }
        .padding()
    }
}

//#Preview {
//    OnboardingView()
//}
