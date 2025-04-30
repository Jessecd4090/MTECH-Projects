//
//  Representative.swift
//  RandomAPIsPart1
//
//  Created by Jestin Dorius on 4/28/25.
//

struct RepresentativeResults: Codable {
    var results: [Representative]
}

struct Representative: Codable {
    var name: String
    var party: String
    var link: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case party
        case link
    }
}
