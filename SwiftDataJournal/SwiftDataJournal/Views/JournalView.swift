//
//  JournalView.swift
//  SwiftDataJournal
//
//  Created by Jestin Dorius on 6/5/25.
//

import SwiftUI
import SwiftData

struct JournalView: View {
    @Environment(\.modelContext) private var modelContext
    @State private var searchQuery: String = ""
    @State var journal: Journal
    @State private var showingModal = false
    @Query var entries: [Entry]
    
    var body: some View {
        VStack {
            if journal.entries.isEmpty {
                Text("No Entries Yet")
                    .font(.largeTitle)
            } else {
                List {
                    ForEach(filterEntries) { entry in
                        NavigationLink {
                            NewEntrySheet(entry: entry, journal: journal)
                            
                        } label: {
                            VStack(alignment: .leading) {
                                Text(entry.title)
                                Text(entry.updatedAt == nil ? timeSince(entry.dateCreated) : timeSince(entry.updatedAt!))
                                    .foregroundStyle(.gray)
                                    .frame(alignment: .leading)
                            }
                        }
                        
                    }
                    .onDelete(perform: deleteEntry)
                    
                    
                }
                .searchable(text: $searchQuery)
            }
        }
        .toolbar(content: {
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    showingModal.toggle()
                } label: {
                    Image(systemName: "plus")
                }
                .sheet(isPresented: $showingModal) {
                    NewEntrySheet(journal: journal)
                }
            }
            ToolbarItem(placement: .topBarTrailing) {
                EditButton()
            }
        })
        .navigationTitle(journal.title)
    }
    
    var filterEntries: [Entry] {
        let sampleEntries = journal.entries
        if searchQuery.isEmpty {
            return sampleEntries
        } else {
            return sampleEntries.filter { $0.title.localizedCaseInsensitiveContains(searchQuery) || $0.message.localizedCaseInsensitiveContains(searchQuery) }
        }
    }
    
    private func timeSince(_ date: Date) -> String {
        let formatter = RelativeDateTimeFormatter()
        formatter.unitsStyle = .full
        return formatter.localizedString(for: date, relativeTo: Date())
    }
    
    
    private func deleteEntry(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(entries[index])
                save()
            }
        }
    }
    
    func save() {
        try? modelContext.save()
    }
}

#Preview {
    JournalView(journal: Journal(title: "", entries: []))
}
