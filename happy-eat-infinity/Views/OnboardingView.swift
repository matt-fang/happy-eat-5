//import SwiftUI
//
//struct OnboardingView: View {
//    @State private var currentPage = 0
//    @State private var selectedStyle: EatingStyle?
//    
//    let styles = [
//        EatingStyle(title: "Intuitive Eater", description: "Makes food choices without guilt, honors hunger, enjoys eating"),
//        EatingStyle(title: "Careful Clean Eater", description: "Health-focused but may stress over food choices"),
//        EatingStyle(title: "Unconscious Eater", description: "Often unaware of eating habits, multitasks while eating"),
//        EatingStyle(title: "Anxious Eater", description: "Feels stressed about eating, especially in social situations"),
//        EatingStyle(title: "Emotional Eater", description: "Eating triggered by stress or emotions"),
//        EatingStyle(title: "Professional Dieter", description: "Frequently tries new diets and restrictions")
//    ]
//    
//    var body: some View {
//        TabView(selection: $currentPage) {
//            // Welcome Page
//            VStack(spacing: 24) {
//                Text("Welcome to Happy Eat!")
//                    .font(.title)
//                    .fontWeight(.bold)
//                Text("Tell us about your eating habits so we can tailor advice just for you.")
//                    .font(.title3)
//                    .multilineTextAlignment(.center)
//                    .padding(.horizontal)
//            }
//            .tag(0)
//            
//            // Style Selection
//            ScrollView {
//                VStack(spacing: 15) {
//                    ForEach(styles) { style in
//                        Button(action: {
//                            selectedStyle = style
//                            currentPage = 2
//                        }) {
//                            VStack(alignment: .leading) {
//                                Text(style.title)
//                                    .font(.headline)
//                                Text(style.description)
//                                    .font(.subheadline)
//                                    .multilineTextAlignment(.leading)
//                            }
//                            .frame(maxWidth: .infinity, alignment: .leading)
//                            .padding()
//                            .background(selectedStyle == style ? Color.blue : Color.gray.opacity(0.1))
//                            .foregroundColor(selectedStyle == style ? .white : .primary)
//                            .cornerRadius(8)
//                        }
//                    }
//                }
//                .padding()
//            }
//            .tag(1)
//            
//            // Strategy Info
//            VStack(spacing: 32) {
//                VStack(spacing: 16) {
//                    Text("Perfect! We've got some strategies ready for you.")
//                        .font(.title2)
//                        .fontWeight(.bold)
//                        .multilineTextAlignment(.center)
//                    
//                    Text("Browse through personalized tips and tap the ones you want to try.")
//                        .font(.body)
//                        .multilineTextAlignment(.center)
//                    
//                    Text("After each try, you'll get to reflect on what worked best for you. It's all about finding your perfect fit!")
//                        .font(.body)
//                        .multilineTextAlignment(.center)
//                }
//                .padding(.horizontal)
//                
//                Button(action: {
//                    // Navigate to strategies
//                }) {
//                    Text("Let's Get Started!")
//                        .font(.headline)
//                        .foregroundColor(.white)
//                        .frame(maxWidth: .infinity)
//                        .padding()
//                        .background(Color.blue)
//                        .cornerRadius(10)
//                }
//                .padding(.horizontal)
//            }
//            .padding()
//            .tag(2)
//        }
//        .tabViewStyle(PageTabViewStyle())
//        .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
//    }
//}
//
//#Preview {
//    OnboardingView()
//}
