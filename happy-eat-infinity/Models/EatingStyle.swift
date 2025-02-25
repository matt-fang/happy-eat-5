//
//  EatingStyle.swift
//  happy-eat-5
//
//  Created by Matthew Fang on 2/23/25.
//

import Foundation

struct EatingStyle: Identifiable, Codable, Equatable {
    let id = UUID()
    let title: String
    let description: String
}
