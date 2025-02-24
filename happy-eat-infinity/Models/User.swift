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
    var id = UUID()
    var eatingStyle: EatingStyle
    
    init(eatingStyle: EatingStyle) {
        self.eatingStyle = eatingStyle
    }
}
