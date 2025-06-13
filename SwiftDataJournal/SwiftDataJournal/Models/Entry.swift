//
//  Entry.swift
//  SwiftDataJournal
//
//  Created by Jestin Dorius on 6/6/25.
//

import Foundation
import SwiftData

@Model
class Entry {
    var id: UUID = UUID()
    var dateCreated = Date()
    var updatedAt: Date?
    var title: String
    var message: String
    var journal: Journal?
    
    init(title: String, message: String, journal: Journal?) {
        self.title = title
        self.message = message
        self.journal = journal
    }
    
    init(title: String, message: String, journal: Journal?, id: UUID, updatedAt: Date) {
        self.title = title
        self.message = message
        self.journal = journal
        self.id = id
        self.updatedAt = updatedAt
    }
}
