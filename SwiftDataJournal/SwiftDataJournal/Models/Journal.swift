//
//  Journal.swift
//  SwiftDataJournal
//
//  Created by Jestin Dorius on 6/5/25.
//

import Foundation
import SwiftData

@Model
class Journal {
    var id = UUID()
    var title: String
    var dateCreated = Date()
    @Relationship(deleteRule: .cascade, inverse: \Entry.journal) var entries: [Entry]
    
    
    init(title: String, entries: [Entry]) {
        self.title = title
        self.entries = entries
    }
}


