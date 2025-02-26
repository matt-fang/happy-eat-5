//
//  OnboardingEatingStyle.swift
//  happy-eat-5
//
//  Created by Matthew Fang on 2/24/25.
//

import Foundation

struct OnboardingEatingStyle: Identifiable, Codable, Equatable {
    let id = UUID()
    let title: String
    let description: String
    let eatingStyle: EatingStyle
}
