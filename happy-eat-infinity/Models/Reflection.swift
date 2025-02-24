//
//  Reflection.swift
//  happy-eat-5
//
//  Created by Matthew Fang on 2/23/25.
//

import Foundation
import SwiftData

@Model
class Reflection {
    var id: UUID = UUID()
//    var strategyID: UUID?
    var date: Date
    
    var successRating: Int
    var userNotes: String?

    var imageURL: URL?
    
    init(/*strategyID: UUID,*/ date: Date, successRating: Int, userNotes: String? = nil, imageURL: URL? = nil) {
//        self.strategyID = strategyID
        self.date = date
        self.successRating = successRating
        self.userNotes = userNotes
//        self.imageURL = imageURL
    }
}
