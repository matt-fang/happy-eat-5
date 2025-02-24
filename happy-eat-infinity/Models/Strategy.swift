//
//  Square.swift
//  happy-eat-5
//
//  Created by Matthew Fang on 2/23/25.
//

import Foundation
import DeckKit

struct Strategy: DeckItem, Hashable {
    var name: String
    var description: String
    
    var duration: Duration
    var instructions: String
    
    var content: String?
    var contentType: ContentType
    
    var id: String { name } // MARK: this might be a smart way of doing id's
}

enum Duration {
    case short
    case long
}

enum ContentType {
    case textField
    case article
    case none
}
