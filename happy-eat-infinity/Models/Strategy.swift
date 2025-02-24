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
    var name: String
    var details: String
    
    var duration: Duration
    var instructions: String
    
    var content: String?
    var contentType: ContentType
    
    var id: String { name } // MARK: this might be a smart way of doing id's
    
    init(name: String, description: String, duration: Duration, instructions: String, content: String? = nil, contentType: ContentType) {
        self.name = name
        self.details = description
        self.duration = duration
        self.instructions = instructions
        self.content = content
        self.contentType = contentType
    }
}

enum Duration: Codable {
    case short
    case long
}

enum ContentType: Codable {
    case textField
    case article
    case none
}
