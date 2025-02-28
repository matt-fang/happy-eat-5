import SwiftUI

struct OnboardingView: View {
    @Environment(\.modelContext) var context
    @AppStorage("hasCompletedOnboarding") private var hasCompletedOnboarding = false
    @State private var currentPage = 0
    @State private var selectedStyle: OnboardingEatingStyle?
    var userModel = User(eatingStyle: .gentle)
    
    let styles = [
        OnboardingEatingStyle(title: "Intuitive Eater", description: "Makes food choices without guilt, honors hunger, enjoys eating", eatingStyle: .gentle),
        OnboardingEatingStyle(title: "Body Image Conscious", description: "Struggles with confidence and may make food choices based on appearance concerns", eatingStyle: .bodyimage),
        OnboardingEatingStyle(title: "Careful Clean Eater", description: "Health-focused but may stress over food choices", eatingStyle: .diethistory),
        
        OnboardingEatingStyle(title: "Unconscious Eater", description: "Often unaware of eating habits, multitasks while eating", eatingStyle: .emotional),
        OnboardingEatingStyle(title: "Emotional Eater", description: "Eating triggered by stress or emotions", eatingStyle: .emotional),
        OnboardingEatingStyle(title: "Professional Dieter", description: "Frequently tries new diets and restrictions", eatingStyle: .diethistory)
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
                        Text("Perfect! We’ve got some strategies ready for you.")
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
                            .background(Color.newRed)
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
        VStack(spacing: 15) {
            ForEach(styles) { style in
                Button(action: {
                    selectedStyle = style
                    userModel.eatingStyle = selectedStyle?.eatingStyle ?? EatingStyle.gentle
                    print("eating style: \(userModel.eatingStyle)")
                    context.insert(userModel)
                }) {
                    VStack(alignment: .leading) {
                        Text(style.title)
                            .font(.headline)
                        Text(style.description)
                            .font(.subheadline)
                            .multilineTextAlignment(.leading)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                    .background(selectedStyle == style ? .white : Color.gray.opacity(0.1))
                    .foregroundColor(.black)
                    .cornerRadius(8)
                }
            }
        }
        .padding()
    }
}

//#Preview {
//    OnboardingView()
//}
