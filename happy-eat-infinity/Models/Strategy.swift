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
    var instructions: String
    
    var content: String?
    var contentType: ContentType
    var eatingStyles: [EatingStyle]
    
    var id: String { name } // MARK: this might be a smart way of doing id's
    
    init(name: String, instructions: String, content: String? = nil, contentType: ContentType, eatingStyles: [EatingStyle]) {
        self.name = name
        self.instructions = instructions
        self.content = content
        self.contentType = contentType
        self.eatingStyles = eatingStyles
    }
}

enum ContentType: Codable {
    case textField
    case article
    case action
}

enum EatingStyle: String, Codable {
//    case intuitive
//    case emotional
//    case unconscious
//    case anxious
//    case careful
//    case professional
    case emotional
    case diethistory
    case bodyimage
    case gentle
}
