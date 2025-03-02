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
    static let schemaVersion = Schema.Version(1, 0, 0)
    var id: UUID = UUID()
    var strategyName: String?
    var date: Date?
    
    var successRating: Int?
    var userNotes: String?
    
    var strategyEntry: String?
    var successColor: String?

    var imageURL: URL?
    
    init(strategyID: String, date: Date, successRating: Int, userNotes: String? = nil, imageURL: URL? = nil, strategyEntry: String? = nil, successColor: String) {
        self.strategyName = strategyID
        self.date = date
        self.successRating = successRating
        self.userNotes = userNotes
        self.strategyEntry = strategyEntry
        self.successColor = successColor
    }
}
