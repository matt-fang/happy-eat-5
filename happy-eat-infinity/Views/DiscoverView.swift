import DeckKit
import SwiftData
import SwiftUI

struct DiscoverView: View {
    @Binding var path: [Screen]
    @State var strategies =
    [
        Strategy(name: "Note when you compare yourself to others", description: "[desc]", duration: .short, instructions: "Notice when you begin to compare yourself to another this week. As soon as you do, remember your list of personal qualities. Write about how it feels to honor yourself rather than envying others:", content: "CONTNET", contentType: .textField),
        Strategy(name: "Learn about gentle movement", description: "[desc]", duration: .short, instructions: "Read the article below!", content: "Did you ever have a goldfish when you were a kid? You probably did, and did you notice that that fish spent its life swimming around the bowl? Or better yet, do you have a cat or dog? Your cat may love to sleep a lot, but when she’s up, she chases dust bunnies in the house or birds in the backyard. And your dog’s favorite activity is probably chasing the ball you throw, and when you jingle his leash, he gets super excited to go out and be walked. Your pets love to move their bodies, because it feels good, and because they have an innate desire to move. They’re not thinking If I run in the yard, I’ll lose weight, or If I build my muscles, the other dogs will think I’m buff. In fact, your pets can’t even form thoughts. Their actions are based on their instincts and emotions, and they’re probably feeling pretty joyful when they’re moving. For thousands of years, humans spent most of their time moving their bodies, but more recently, with a burst in technology, movement has been turned on its head. People spend many hours in front of TVs or computers, attached to their phones, or simply lying around.", contentType: .article),
        Strategy(name: "Reflect on your social media habits", description: "[desc]", duration: .short, instructions: "One of the most effective ways to help you stop comparing is to notice just how powerful social media can be in making you feel “less than.” The effortless-looking, perfect selfies may have taken the poster hours of planning and editing to achieve, and they can make you feel terrible by comparison in seconds flat. As your first step in letting go of social media that makes you feel bad, commit to unfollowing and unsubscribing anyone who posts these pictures or talks about dieting or unrealistic body goals. Your next step: find people who have body-positive thinking and intentions.", content: "", contentType: .none),
        
    ]

    var body: some View {
        NavigationStack(path: $path) {
            DeckView($strategies) { strategy in
                // Remove the NavigationLink wrapper since DeckView might be interfering
                // with the gesture recognition
                RoundedRectangle(cornerRadius: 25.0)
                    .foregroundStyle(.thinMaterial)
                    .frame(width: 300, height: 300)
                    .overlay(Text(strategy.name))
                    .shadow(radius: 10)
                    .overlay(alignment: .bottomTrailing) {
                        Button { // MARK: Button has higher gesture priority than DeckView which has higher priority than onTapGesture — so onTapGesture won't work
                            path.append(.doIt(strategy))
                        } label: {
                            Image(systemName: "play.circle.fill")
                                .font(.system(size: 30))
                                .padding()
                        }
                    }
                
            }
            .navigationTitle("Today, let's...")
            .padding()
                .navigationDestination(for: Screen.self) { screen in
                    switch screen {
                    case .discover:
                        DiscoverView(path: $path, strategies: strategies)
                    case .doIt(let strategy):
                        DoItView(path: $path, strategy: strategy)
                    case .reflect(let strategy):
                        ReflectView(path: $path, strategy: strategy)
                    case _:
                        // MARK:
                        Text("ADD OTHERS HERE FIX THIS")
                    }
                }
        }
    }
}

//#Preview {
//    DiscoverView(path: <#[Screen]#>, strategies: [Strategy(name: "Note when you compare yourself to others", description: "[desc]", duration: .short, instructions: "instructions!", content: "CONTNET", contentType: .article)])
//}
