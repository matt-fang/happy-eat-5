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
    @Attribute(.unique) var id = UUID()
    var eatingStyle: EatingStyle
    
    @Relationship var strategies: [Strategy] = []
    
    init(eatingStyle: EatingStyle) {
        self.eatingStyle = eatingStyle
    }
    
    // Make this a method rather than a computed property for Swift Data compatibility
    func getFilteredStrategies() -> [Strategy] {
        return strategies.filter { $0.eatingStyle == eatingStyle }
    }
}
