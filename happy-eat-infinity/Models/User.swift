//
//  User.swift
//  happy-eat-5
//
//  Created by Matthew Fang on 2/23/25.
//

import Foundation
import SwiftData

@Model
class User {
    static let schemaVersion = Schema.Version(1, 0, 4)
    @Attribute(.unique) var id = UUID()
    
    // Add a transformable attribute to handle old string values
//    @Attribute(.transformable) private var _eatingStyleString: String? = nil
//    
//    var eatingStyle: EatingStyle {
//        get {
//            if let string = _eatingStyleString {
//                // Handle old string values
//                switch string.lowercased() {
//                case "diethistory", "gentle", "mindful", "intuitive":
//                    return .selfCare
//                case "emotional", "restrictive", "binge":
//                    return .anxious
//                case "bodyimage":
//                    return .unconfident
//                default:
//                    return .selfCare
//                }
//            }
//            return .selfCare
//        }
//        set {
//            _eatingStyleString = newValue.rawValue
//        }
//    }
    
    var eatingStyle: EatingStyle = EatingStyle.selfCare
    var monName: String = "Yorox"  // Default value
    var xp: Int = 0
    var level: Int = 1
    var showXPAnimation: Bool = false
    var showLevelUpAnimation: Bool = false
    
    var streak: Int = 0
    var lastCompletedDate: Date?
    
    var playStreakAnimation: Bool = false
    
    @Relationship(deleteRule: .cascade) var strategies: [Strategy] = [
        Strategy(
            name: "Prepare a balanced meal that fuels me",
            instructions: "Before your next meal, choose ingredients that deliver balanced nutrition. Which plan fits your next meal?",
            content: [
                "Make a hearty breakfast with eggs, whole grain toast, and fruit",
                "Prepare a vibrant salad with lean protein for lunch",
                "Mix a nutrient-rich smoothie for a mid-day boost",
                "Cook a dinner featuring vegetables, protein, and whole grains"
            ],
            eatingStyles: [.selfCare]
        ),
        Strategy(
            name: "Experiment with a new ingredient for a fun meal",
            instructions: "Today, pick a new ingredient or recipe and incorporate it into your meal. How will you add variety?",
            content: [
                "Try a new spice blend in your dish",
                "Cook a recipe from a different cuisine",
                "Add a unique fruit or vegetable to your meal",
                "Combine traditional ingredients in a new way"
            ],
            eatingStyles: [.selfCare]
        ),
        Strategy(
            name: "Incorporate a simple nutrition tip into my meal",
            instructions: "At your next meal, choose one nutrition tip to try. How will you implement it?",
            content: [
                "Add an extra serving of greens",
                "Include a protein-rich food",
                "Replace a processed ingredient with a whole food",
                "Swap a sugary drink with water"
            ],
            eatingStyles: [.selfCare]
        ),
        Strategy(
            name: "Create and follow a simple eating plan",
            instructions: "Plan your meals for today. Which option sounds most doable?",
            content: [
                "Plan three balanced meals with healthy snacks",
                "Schedule specific times to sit down and eat",
                "Map out a plan that emphasizes variety",
                "Decide on portion sizes for each meal"
            ],
            eatingStyles: [.selfCare]
        ),
        Strategy(
            name: "Break a restrictive diet rule for a day",
            instructions: "Choose one diet rule that limits you and skip it during one meal. What will you do?",
            content: [
                "Skip tracking calories for one meal",
                "Allow a treat you've been avoiding",
                "Eat without stressing about portion sizes",
                "Ignore a no-go food list for a meal"
            ],
            eatingStyles: [.unconfident, .anxious]
        ),
        Strategy(
            name: "Apply one good habit and ditch a bad one",
            instructions: "At your next meal, practice a healthy habit and leave a negative one behind. Which will you try?",
            content: [
                "Include a nutrient-dense food and skip an empty-calorie snack",
                "Drink water before eating to curb overeating",
                "Choose a balanced plate over processed options",
                "Eat slowly and stop when you're satisfied"
            ],
            eatingStyles: [.selfCare]
        ),
        Strategy(
            name: "Reward myself with a healthy treat when feeling deprived",
            instructions: "When you feel deprived or stressed, choose a nutritious treat. Which treat will work for you?",
            content: [
                "Have a small serving of dark chocolate",
                "Enjoy a fresh fruit salad",
                "Sip herbal tea with a spoon of nut butter",
                "Snack on crunchy veggies with hummus"
            ],
            eatingStyles: [.anxious, .stressed]
        ),
        Strategy(
            name: "Enjoy a meal that breaks conventional diet rules",
            instructions: "At your next meal, ignore a common diet rule and follow your own choice. What's your plan?",
            content: [
                "Choose a food you've been told to avoid",
                "Eat the portion size that feels right for you",
                "Mix foods from different groups without rules",
                "Ignore calorie counting for one meal"
            ],
            eatingStyles: [.unconfident, .anxious]
        ),
        Strategy(
            name: "Choose a meal entirely on my own terms",
            instructions: "Plan your next meal solely based on your cravings—no rules. How will you decide?",
            content: [
                "Pick a meal that feels indulgent yet balanced",
                "Select a dish that satisfies hunger and taste",
                "Choose a comfort food without restrictions",
                "Decide on a meal that excites your taste buds"
            ],
            eatingStyles: [.selfCare]
        ),
        Strategy(
            name: "Take a day off from diet rules",
            instructions: "Dedicate a day to intuitive eating—ignore strict rules. Which approach will help you enjoy freedom?",
            content: [
                "Turn off diet apps and follow hunger cues",
                "Focus on flavors and enjoyment over numbers",
                "Eat based solely on how you feel",
                "Allow a variety of foods without judgment"
            ],
            eatingStyles: [.selfCare]
        ),
        Strategy(
            name: "Make one small change in my eating habits",
            instructions: "Today, choose one small change to improve your eating habits. What will you adjust?",
            content: [
                "Replace a sugary snack with a piece of fruit",
                "Add an extra serving of vegetables",
                "Switch soda for water",
                "Choose whole grains over refined ones"
            ],
            eatingStyles: [.selfCare]
        ),
        Strategy(
            name: "Savor my favorite craving mindfully",
            instructions: "At your next meal, savor a food you truly crave. How will you enjoy it?",
            content: [
                "Take small, mindful bites",
                "Focus on the taste and texture",
                "Pair it with a healthy side",
                "Eat slowly to fully enjoy the flavor"
            ],
            eatingStyles: [.selfCare]
        ),
        Strategy(
            name: "Reclaim joy by preparing an exciting meal",
            instructions: "Cook or assemble a meal that excites you. Which method will make it joyful?",
            content: [
                "Cook a vibrant, colorful dish",
                "Mix different textures and flavors",
                "Prepare a comfort meal that lifts your mood",
                "Try a new recipe that surprises you"
            ],
            eatingStyles: [.selfCare]
        ),
        Strategy(
            name: "Experiment with a new dish for a sensory boost",
            instructions: "Try a new dish that excites all your senses. Which approach will you take?",
            content: [
                "Use fresh herbs and spices for aroma",
                "Choose visually appealing ingredients",
                "Incorporate a mix of textures",
                "Select a recipe that balances sweet, savory, and tangy"
            ],
            eatingStyles: [.selfCare]
        ),
        Strategy(
            name: "Plate my meal in a visually appealing way",
            instructions: "Before eating, arrange your meal attractively. Which presentation style will you choose?",
            content: [
                "Arrange food in a colorful, artistic layout",
                "Garnish with fresh herbs",
                "Mix textures for visual interest",
                "Keep it simple and elegant"
            ],
            eatingStyles: [.selfCare]
        ),
        Strategy(
            name: "Evaluate my energy after a meal",
            instructions: "After your meal, assess how energized you feel. Which feeling best describes you?",
            content: [
                "I feel energized and alert",
                "There's a slight dip in energy",
                "I feel sluggish or heavy",
                "I feel balanced and satisfied"
            ],
            eatingStyles: [.selfCare]
        ),
        Strategy(
            name: "Plan a multi-sensory meal",
            instructions: "Design a meal that engages all your senses. Which idea will guide your planning?",
            content: [
                "Include a mix of sweet, sour, and savory flavors",
                "Incorporate crunchy and soft textures",
                "Choose ingredients with vibrant colors",
                "Use aromatic herbs and spices"
            ],
            eatingStyles: [.selfCare]
        ),
        Strategy(
            name: "Set up a calming dining environment",
            instructions: "Create a peaceful spot for your next meal. How will you set the mood?",
            content: [
                "Turn off screens and minimize distractions",
                "Choose a quiet spot and play soft music",
                "Light a candle or use ambient lighting",
                "Set your table neatly for a calm atmosphere"
            ],
            eatingStyles: [.selfCare]
        ),
        Strategy(
            name: "Assess my hunger and mood before eating",
            instructions: "Before your meal, gauge your hunger and emotional state. What will you check?",
            content: [
                "Rate your hunger from 1 to 10",
                "Notice if you're stressed, anxious, or calm",
                "Decide based on both physical and emotional cues",
                "Take a deep breath to center yourself"
            ],
            eatingStyles: [.selfCare, .anxious, .stressed]
        ),
        Strategy(
            name: "Calm down before eating",
            instructions: "When feeling stressed, take a moment to relax before your meal. Which technique will you try?",
            content: [
                "Take three deep breaths",
                "Step outside for fresh air",
                "Listen to calming music",
                "Sit quietly for a few minutes"
            ],
            eatingStyles: [.stressed]
        ),
        Strategy(
            name: "Identify what boosts my meal satisfaction",
            instructions: "After eating, pick one aspect that made your meal enjoyable. Which element will you focus on next time?",
            content: [
                "A burst of flavor",
                "A satisfying texture",
                "A pleasing aroma",
                "A balanced portion size"
            ],
            eatingStyles: [.selfCare]
        ),
        Strategy(
            name: "Set one personal food rule that benefits me",
            instructions: "Decide on one food rule that enhances your well-being. Which rule will you adopt?",
            content: [
                "Only eat when truly hungry",
                "Prioritize nutrient-dense foods",
                "Avoid distractions during meals",
                "Balance portion sizes carefully"
            ],
            eatingStyles: [.selfCare, .anxious]
        ),
        Strategy(
            name: "Evaluate the source of a food rule",
            instructions: "Reflect on a food rule you follow and its origin. Which option will you consider?",
            content: [
                "Reflect on family or cultural origins",
                "Question if it's still relevant for you",
                "Decide to modify it if needed",
                "Keep it if it improves your well-being"
            ],
            eatingStyles: [.selfCare, .anxious]
        ),
        Strategy(
            name: "Discard a food rule that limits me",
            instructions: "At your next meal, let go of one restrictive food rule. How will you break free?",
            content: [
                "Skip a self-imposed calorie limit",
                "Ignore a food elimination rule",
                "Choose a food you've been avoiding",
                "Let go of strict portion sizes"
            ],
            eatingStyles: [.unconfident, .anxious]
        ),
        Strategy(
            name: "Break a mindless eating habit",
            instructions: "Notice when you're eating out of habit and choose a mindful alternative. What will you do?",
            content: [
                "Pause before eating and check your hunger",
                "Swap a habitual snack for a nutritious one",
                "Set a timer to slow down your eating",
                "Focus on savoring each bite"
            ],
            eatingStyles: [.selfCare, .anxious]
        ),
        Strategy(
            name: "Photograph my meals for a week",
            instructions: "Over the next week, photograph each meal to review your choices. Which method will you use?",
            content: [
                "Use a dedicated food journal app",
                "Create a digital album for your meals",
                "Review photos at the end of each day",
                "Share meal photos with a friend for feedback"
            ],
            eatingStyles: [.selfCare]
        ),
        Strategy(
            name: "Share a meal with a supportive friend",
            instructions: "Plan a meal with a friend who inspires healthy eating. How will you make it engaging?",
            content: [
                "Cook together and exchange recipes",
                "Eat at a favorite healthy restaurant",
                "Plan a picnic with balanced foods",
                "Organize a potluck with nourishing dishes"
            ],
            eatingStyles: [.selfCare, .anxious]
        ),
        Strategy(
            name: "Indulge in my favorite food mindfully",
            instructions: "Treat yourself to your favorite food and savor each bite. Which option will guide you?",
            content: [
                "Indulge in a small serving of a comfort dish",
                "Enjoy a balanced version of your favorite treat",
                "Pair your favorite food with a healthy side",
                "Eat slowly and appreciate every bite"
            ],
            eatingStyles: [.selfCare]
        ),
        Strategy(
            name: "Challenge a negative food thought",
            instructions: "When a negative food thought arises, counter it with a positive action. What's your approach?",
            content: [
                "Replace it with a positive affirmation",
                "Choose a food that boosts your confidence",
                "Take a moment to reframe the thought",
                "Disregard the negative message and focus on nutrition"
            ],
            eatingStyles: [.unconfident, .stressed]
        ),
        Strategy(
            name: "Replace a negative food thought with a positive action",
            instructions: "At your next meal, swap a negative thought for a positive, nutritious choice. Which option suits you?",
            content: [
                "Choose a nutritious option you love",
                "Focus on the health benefits of your meal",
                "Recall a positive food memory",
                "Opt for a mood-lifting snack"
            ],
            eatingStyles: [.unconfident, .stressed]
        ),
        Strategy(
            name: "Try a flexible food swap",
            instructions: "Replace a food you label as 'bad' with a healthier alternative. Which swap will you try?",
            content: [
                "Swap soda for sparkling water with lemon",
                "Replace white bread with whole grain bread",
                "Choose brown rice over white rice",
                "Trade fried food for a baked version"
            ],
            eatingStyles: [.selfCare]
        ),
        Strategy(
            name: "Embrace imperfection in my next meal",
            instructions: "Allow yourself to enjoy a meal without aiming for perfection. Which approach will help you celebrate imperfection?",
            content: [
                "Eat without obsessing over calories",
                "Allow extra indulgence without guilt",
                "Focus on enjoyment rather than perfection",
                "Accept that not every meal must be flawless"
            ],
            eatingStyles: [.unconfident]
        ),
        Strategy(
            name: "Adopt a 'mostly healthy' meal approach",
            instructions: "Plan a meal that's mostly healthy while still allowing a small treat. Which option will you try?",
            content: [
                "Plan a balanced meal with a tiny dessert",
                "Focus on whole foods with a hint of indulgence",
                "Prioritize vegetables and lean proteins, then enjoy dessert",
                "Create a meal with a healthy base and a comforting side"
            ],
            eatingStyles: [.selfCare]
        ),
        Strategy(
            name: "Notice emotional eating triggers in real time",
            instructions: "When emotions run high, check in before your meal. Which strategy will help you balance your feelings?",
            content: [
                "Take a moment to breathe and assess emotions",
                "Opt for a comforting yet nutritious snack",
                "Adjust your meal to include mood-boosting foods",
                "Delay eating for a few minutes until calmer"
            ],
            eatingStyles: [.anxious, .stressed]
        ),
        Strategy(
            name: "Assert my food choices confidently",
            instructions: "Next time someone questions your meal, confidently stand by your decision. Which approach will you use?",
            content: [
                "Clearly explain your nutritional reasons",
                "Share how your choice makes you feel empowered",
                "Stand by your decision without apology",
                "Use positive language to describe your meal"
            ],
            eatingStyles: [.unconfident]
        ),
        Strategy(
            name: "Respond to hunger signals immediately",
            instructions: "When you feel hunger cues, act by choosing a nourishing snack. Which snack will you grab?",
            content: [
                "Grab a piece of fruit",
                "Have a handful of nuts",
                "Drink a glass of water",
                "Enjoy a yogurt or smoothie"
            ],
            eatingStyles: [.selfCare]
        ),
        Strategy(
            name: "Gauge my hunger level actively",
            instructions: "Before your meal, quickly assess your hunger. How will you do it?",
            content: [
                "Rate hunger on a scale of 1 to 10",
                "Decide portion size based on your hunger",
                "Match your hunger with a light or heavy meal",
                "Check in with your body's cues"
            ],
            eatingStyles: [.selfCare]
        ),
        Strategy(
            name: "Savor a meal purely for its taste",
            instructions: "Focus solely on the flavor of your next meal. Which method will help you fully savor it?",
            content: [
                "Eat slowly and concentrate on flavors",
                "Pair your meal with a complementary beverage",
                "Engage all your senses while eating",
                "Minimize distractions to focus on taste"
            ],
            eatingStyles: [.selfCare]
        ),
        // -- New, more concrete strategies --
        Strategy(
            name: "Drink more water throughout the day",
            instructions: "Increase your water intake today. How will you remind yourself?",
            content: [
                "Set a timer to drink water every hour",
                "Keep a water bottle with you at all times",
                "Drink a glass of water before each meal",
                "Track your water intake with an app"
            ],
            eatingStyles: [.selfCare]
        ),
        Strategy(
            name: "Eat extra veggies at every meal",
            instructions: "Incorporate more vegetables into your meals today. Which method will you try?",
            content: [
                "Add a side salad to lunch and dinner",
                "Mix vegetables into your main dishes",
                "Snack on raw veggies between meals",
                "Blend veggies into a smoothie"
            ],
            eatingStyles: [.selfCare, .anxious]
        ),
        Strategy(
            name: "Choose whole grains over refined ones",
            instructions: "Replace refined grains with whole grains at your next meal. Which switch will you make?",
            content: [
                "Swap white bread for whole grain bread",
                "Choose brown rice instead of white rice",
                "Select whole grain pasta",
                "Try quinoa or barley as a substitute"
            ],
            eatingStyles: [.selfCare]
        )
    ]
    
    func printStrategies() {
        print("\n=== Strategies After Initialization ===")
        for (index, strategy) in strategies.enumerated() {
            print("Strategy \(index): \(strategy.name ?? "unnamed")")
            print("Eating styles: \(strategy.eatingStyles.map { $0.rawValue })")
            print("---")
        }
    }
    
    init(eatingStyle: EatingStyle, monName: String) {
        self.eatingStyle = eatingStyle
        self.monName = monName
        printStrategies()
    }
    
    // Make this a method rather than a computed property for Swift Data compatibility
    func getFilteredStrategies() -> [Strategy] {
        print("\n=== Starting Strategy Filtering ===")
        print("User eating style: \(eatingStyle.rawValue)")
        print("Total strategies before filtering: \(strategies.count)")
        
        // Print all strategies and their eating styles before filtering
        print("\nAll strategies before filtering:")
        for (index, strategy) in strategies.enumerated() {
            print("Strategy \(index): \(strategy.name ?? "unnamed")")
            print("Eating styles: \(strategy.eatingStyles.map { $0.rawValue })")
            print("---")
        }

        // Make sure we're comparing the same eating style types
        let userStyle = eatingStyle
        let filtered = strategies.filter { strategy in
            let contains = strategy.eatingStyles.contains(userStyle)
            print("\nChecking strategy: \(strategy.name ?? "unnamed")")
            print("Strategy eating styles: \(strategy.eatingStyles.map { $0.rawValue })")
            print("User eating style: \(userStyle.rawValue)")
            print("Contains: \(contains)")
            return contains
        }

        print("\n=== Filtering Results ===")
        print("Filtered count: \(filtered.count)")
        print("Filtered strategies:")
        for (index, strategy) in filtered.enumerated() {
            print("Strategy \(index): \(strategy.name ?? "unnamed")")
            print("Eating styles: \(strategy.eatingStyles.map { $0.rawValue })")
            print("---")
        }

        return filtered
    }
    
    func updateStreak() {
        streak += 1
    }
    
    func addXP(_ amount: Int) {
        let oldLevel = level
        xp += amount
        // Check for level up
        let nextLevelXP = getXPForNextLevel()
        if xp >= nextLevelXP {
            xp -= nextLevelXP
            level += 1
        }
        // Only show level up animation if we actually leveled up
        showLevelUpAnimation = level > oldLevel
    }
    
    func getXPForNextLevel() -> Int {
        return level * 100
    }
    
    func getXPProgress() -> Double {
        return Double(xp) / Double(getXPForNextLevel())
    }
}

let props: [(name: String, weight: Int)] = [
    ("mushroom", 2)
]
