//
//  MenuItem.swift
//  OrderApp
//
//  Created by Jestin Dorius on 4/23/25.
//
import Foundation

struct MenuItem: Codable {
    var id: Int
    var name: String
    var detailText: String
    var price: Double
    var category: String
    var imageURL: URL
    
    enum CodingKeys: String, CodingKey {
        case id, name, price, category
        case detailText = "description"
        case imageURL = "image_url"
    }
}
