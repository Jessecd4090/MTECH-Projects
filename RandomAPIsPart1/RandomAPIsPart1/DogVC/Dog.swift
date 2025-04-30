//
//  Dog.swift
//  RandomAPIsPart1
//
//  Created by Jestin Dorius on 4/25/25.
//
import UIKit

struct Dog: Codable {
    var image: String // really a URL
    var status: String?
    
    
    enum CodingKeys: String, CodingKey {
        case image = "message"
        case status
    }
}
