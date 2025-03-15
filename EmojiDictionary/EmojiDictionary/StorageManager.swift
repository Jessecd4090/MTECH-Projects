//
//  StorageManager.swift
//  EmojiDictionary
//
//  Created by Jestin Dorius on 3/14/25.
//

import Foundation

class StorageManager {
    
    static var current = StorageManager()
    
    var emojis: [Emoji] = []
    
    init() {
        self.emojis = loadFromFile()
    }
    
    var saveFilePath: URL {
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        let saveFileURL = documentsDirectory.appendingPathComponent("saved_emoji")
        return saveFileURL
    }
    
    func loadFromFile() -> [Emoji] {
        guard let EmojiData = try? Data(contentsOf: saveFilePath) else { return [] }
        let decoder = PropertyListDecoder()
        do {
            let emojis = try decoder.decode([Emoji].self, from: EmojiData)
            self.emojis = emojis
            return emojis
        } catch {
            print(error)
            return []
        }
    }
    

    func saveToFile(emojis: [Emoji]) {
        let encoder = PropertyListEncoder()
        let emojiData = try? encoder.encode(emojis)
        try? emojiData?.write(to: saveFilePath)
    }
    
    
}
