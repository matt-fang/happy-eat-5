//
//  Square.swift
//  happy-eat-5
//
//  Created by Matthew Fang on 2/23/25.
//

import DeckKit
import Foundation
import SwiftData

@Model
class Strategy: DeckItem, Hashable {
    var name: String
    var instructions: String
    
    var content: String?
    var contentType: ContentType
    var eatingStyle: String?
    
    var id: String { name } // MARK: this might be a smart way of doing id's
    
    init(name: String, instructions: String, content: String? = nil, contentType: ContentType, eatingStyle: String? = nil) {
        self.name = name
        self.instructions = instructions
        self.content = content
        self.contentType = contentType
        self.eatingStyle = eatingStyle
    }
}

enum ContentType: String, Codable {
    case textField = "textField"
    case article = "article"
    case none = "none"
    
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let rawValue = try container.decode(String.self)
        
        switch rawValue.lowercased() {
        case "textfield":
            self = .textField
        case "article":
            self = .article
        default:
            self = .none
        }
    }
}

// JSON Parser for Strategy
class StrategyParser {
    static func parseStrategies(from jsonData: Data) -> [Strategy] {
        do {
            let decoder = JSONDecoder()
            return try decoder.decode([StrategyData].self, from: jsonData).map { strategyData in
                return Strategy(
                    name: strategyData.name,
                    instructions: strategyData.instructions,
                    content: strategyData.content,
                    contentType: strategyData.contenttype,
                    eatingStyle: strategyData.eatingStyle
                )
            }
        } catch {
            print("Error parsing strategies: \(error)")
            return []
        }
    }
    
    static func loadStrategiesFromFile() -> [Strategy] {
        guard let url = Bundle.main.url(forResource: "Strategies", withExtension: "json") else {
            print("Strategies.json not found")
            return []
        }
        
        do {
            let data = try Data(contentsOf: url)
            return parseStrategies(from: data)
        } catch {
            print("Error loading strategies: \(error)")
            return []
        }
    }
}

// Decodable structure that matches the JSON format
private struct StrategyData: Decodable {
    let name: String
    let instructions: String
    let contenttype: ContentType
    let content: String?
    let eatingStyle: String?
    
    enum CodingKeys: String, CodingKey {
        case name
        case instructions
        case contenttype
        case content
        case eatingStyle
    }
}
