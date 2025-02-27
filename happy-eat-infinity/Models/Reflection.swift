//
//  Reflection.swift
//  happy-eat-5
//
//  Created by Matthew Fang on 2/23/25.
//

import SwiftUI
import SwiftData

@Model
class Reflection {
    var id: UUID = UUID()
    var strategyID: String
    var date: Date
    
    var successRating: Int
    var userNotes: String?
    
    var strategyEntry: String?
    var successColor: String

    var imageURL: URL?
    
    init(strategyID: String, date: Date, successRating: Int, userNotes: String? = nil, imageURL: URL? = nil, strategyEntry: String? = nil, successColor: String) {
        self.strategyID = strategyID
        self.date = date
        self.successRating = successRating
        self.userNotes = userNotes
        self.strategyEntry = strategyEntry
        self.successColor = successColor
    }
}
