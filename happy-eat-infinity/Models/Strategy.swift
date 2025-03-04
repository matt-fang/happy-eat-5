//
//  Square.swift
//  happy-eat-5
//
//  Created by Matthew Fang on 2/23/25.
//

import Foundation
import DeckKit
import SwiftData

@Model
class Strategy: DeckItem, Hashable {
    static let schemaVersion = Schema.Version(1, 0, 2)
    var name: String?
    var instructions: String?
    
    var content: [String]?
    var eatingStyles: [EatingStyle] = [EatingStyle.selfCare]
    var xpReward: Int = 100
    
    var id: UUID = UUID()
    
    init(name: String, instructions: String, content: [String]? = nil, eatingStyles: [EatingStyle], xpReward: Int = 100) {
        self.name = name
        self.instructions = instructions
        self.content = content
        self.eatingStyles = eatingStyles
        self.xpReward = xpReward
    }
}

enum ContentType: Codable {
    case textField
    case article
    case action
}

enum EatingStyle: String, Codable {
    case selfCare
    case anxious
    case unconfident
    case stressed
}
