//
//  Square.swift
//  happy-eat-5
//
//  Created by Matthew Fang on 2/23/25.
//

import Foundation
import DeckKit

struct Strategy: DeckItem {
    var name: String
    var text: String
    
    var id: String { name } // MARK: this might be a smart way of doing id's
}
