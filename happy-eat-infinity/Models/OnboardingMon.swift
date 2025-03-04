//
//  OnboardingEatingStyle.swift
//  happy-eat-5
//
//  Created by Matthew Fang on 2/24/25.
//

import Foundation
import SwiftUI

struct OnboardingMon: Identifiable, Codable, Equatable {
    let id: UUID = UUID()
    
    let image: String
    let name: String
    let description: String
    let eatingStyle: EatingStyle
}
