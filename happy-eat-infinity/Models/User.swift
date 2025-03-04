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
    var xp: Int = 0
    var level: Int = 1
    var showXPAnimation: Bool = false
    var showLevelUpAnimation: Bool = false
    
    var streak: Int = 0
    var lastCompletedDate: Date?
    
    var playStreakAnimation: Bool = false
    
    @Relationship(deleteRule: .cascade) var strategies: [Strategy] = [
        Strategy(
            name: "figure out what good nutrition means for me",
            instructions: """
              Choose an easy principle you can follow:
              """,
            content: "placeholder",
            contentType: .textField,
            eatingStyles: [.selfCare],
            xpReward: 100
        ),
        Strategy(
            name: "do something you like to relax",
            instructions: """
              Choose an easy principle you can follow:
              """,
            content: "placeholder",
            contentType: .textField,
            eatingStyles: [.anxious],
            xpReward: 100
        ),
        Strategy(
            name: "try some meditation before you eat",
            instructions: """
              Choose an easy principle you can follow:
              """,
            content: "placeholder",
            contentType: .textField,
            eatingStyles: [.stressed],
            xpReward: 100
        ),
        Strategy(
            name: "don't let negative thoughts go unchecked",
            instructions: """
              Choose an easy principle you can follow:
              """,
            content: "placeholder",
            contentType: .textField,
            eatingStyles: [.unconfident],
            xpReward: 100
        ),
    ]
    
    init(eatingStyle: EatingStyle) {
        self.eatingStyle = eatingStyle
    }
    
    // Make this a method rather than a computed property for Swift Data compatibility
    func getFilteredStrategies() -> [Strategy] {
        print("Filtering strategies...")
        print("User eating style: \(eatingStyle.rawValue)")
        print("Total strategies before filtering: \(strategies.count)")

        let filtered = strategies.filter { $0.eatingStyles.contains(eatingStyle)}

        print("Filtered count: \(filtered.count)")
        for strategy in filtered {
            print("Strategy: \(strategy.eatingStyles)")
        }

        return filtered
    }
    
    func updateStreak() {
        streak += 1
    }
    
    func addXP(_ amount: Int) {
        xp += amount
        // Check for level up
        let nextLevelXP = getXPForNextLevel()
        if xp >= nextLevelXP {
            xp -= nextLevelXP
            level += 1
            showLevelUpAnimation = true
        }
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
