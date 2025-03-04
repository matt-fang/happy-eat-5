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
                    Text("Tell us about your eating habits so we can tailor advice just for you.")
                        .font(.title3)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                }
                .tag(0)
                
                // Style Selection
                ScrollView {
                    strategies
                }
                .tag(1)
                
                // Strategy Info
                VStack(spacing: 32) {
                    VStack(spacing: 16) {
                        Text("Perfect! We've got some strategies ready for you.")
                            .font(.title2)
                            .fontWeight(.bold)
                            .multilineTextAlignment(.center)
                        
                        Text("Swipe through the cards on the next screen and select the ones that feel most helpful!")
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
                    .foregroundStyle(.gray)
                Spacer()
                Image(systemName: "chevron.right")
                    .padding()
                    .bold()
                    .foregroundStyle(.gray)
                Spacer()
            }
            .padding(.horizontal, 40)
        }
    }
    
    var strategies: some View {
        LazyVGrid(columns: [
            GridItem(.flexible()),
            GridItem(.flexible())
        ], spacing: 16) {
            ForEach(mons, id: \.id) { mon in
                Button(action: {
                    selectedMon = mon
                    userModel.eatingStyle = selectedMon?.eatingStyle ?? EatingStyle.selfCare
                    userModel.monName = selectedMon?.name ?? "Yorox"
                    print("Selected mon: \(mon.name) with eating style: \(mon.eatingStyle.rawValue)")
                    print("User model eating style: \(userModel.eatingStyle.rawValue)")
                    currentPage += 1
                    
                    if let existingUser = users.first {
                        print("Deleting existing user with eating style: \(existingUser.eatingStyle.rawValue)")
                        context.delete(existingUser)
                    }
                    print("Inserting new user with eating style: \(userModel.eatingStyle.rawValue)")
                    context.insert(userModel)
                }) {
                    VStack(spacing: 8) {
                        Image(mon.image)
                            .interpolation(.none)
                            .resizable()
                            .scaledToFit()
                        
                        Text(mon.name)
                            .font(.headline)
                        
                        Text(mon.description)
                            .font(.caption)
                            .multilineTextAlignment(.center)
                            .foregroundColor(.gray)
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(selectedMon?.id == mon.id ? Color.white : Color.gray.opacity(0.1))
                    .foregroundColor(.black)
                    .cornerRadius(12)
                }
            }
        }
        .padding()
    }
}

//#Preview {
//    OnboardingView()
//}
