//
//  Emoji.swift
//  EmojiDictionary
//
//  Created by Jestin Dorius on 3/10/25.
//

import Foundation

struct Emoji: Codable {
    var symbol: String
    var name: String
    var description: String
    var type: String?
    var usage: String

    // Static method to save emojis to a file
    static func saveToFile(emojis: [Emoji]) {
        let encoder = PropertyListEncoder()
        if let encoded = try? encoder.encode(emojis) {
            try? encoded.write(to: Emoji.archiveURL)
        }
    }

    // Static method to load emojis from a file
    static func loadFromFile() -> [Emoji] {
        guard let data = try? Data(contentsOf: Emoji.archiveURL) else { return [] }
        let decoder = PropertyListDecoder()
        return (try? decoder.decode([Emoji].self, from: data)) ?? []
    }

    // Static property to get the file path
    static var archiveURL: URL {
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        return documentsDirectory.appendingPathComponent("emojis.plist")
    }

    // Static method to return sample emojis
    static func sampleEmojis() -> [Emoji] {
        return [
            Emoji(symbol: "🙉", name: "Hear no Evil", description: "A monkey covering his ears to avoid hearing evil", usage: "Plausible Deniability"),
            Emoji(symbol: "🙈", name: "See no Evil", description: "A monkey covering his eyes to avoid seeing evil", usage: "Hiding or secret things"),
            Emoji(symbol: "🙊", name: "Speak no Evil", description: "A monkey covering his mouth to not speak evil", usage: "Holding my tongue"),
            Emoji(symbol: "🍀", name: "4-Leafed Clover", description: "A lucky clover", usage: "Lucky energy"),
            Emoji(symbol: "🥀", name: "Rose", description: "A rose with a stem", usage: "Romantic energy")
        ]
    }
}
    
