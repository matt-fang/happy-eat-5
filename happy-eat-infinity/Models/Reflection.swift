import SwiftUI
import SwiftData

// Make sure your Reflection model is properly defined for SwiftData
@Model
final class Reflection {
    var strategyID: String
    var date: Date
    var successRating: Int
    var userNotes: String?
    
    init(strategyID: String, date: Date, successRating: Int, userNotes: String? = nil) {
        self.strategyID = strategyID
        self.date = date
        self.successRating = successRating
        self.userNotes = userNotes
    }
}

