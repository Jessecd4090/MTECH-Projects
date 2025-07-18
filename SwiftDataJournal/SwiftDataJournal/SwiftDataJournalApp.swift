//
//  SwiftDataJournalApp.swift
//  SwiftDataJournal
//
//  Created by Jestin Dorius on 6/5/25.
//

import SwiftUI
import SwiftData

@main
struct SwiftDataJournalApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Journal.self,
            Entry.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            JournalList()
        }
        .modelContainer(sharedModelContainer)
    }
}
