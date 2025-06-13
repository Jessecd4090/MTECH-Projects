//
//  ContentView.swift
//  SwiftDataJournal
//
//  Created by Jestin Dorius on 6/5/25.
//

import SwiftUI
import SwiftData

struct JournalList: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss
    @Query private var journals: [Journal]
    @State private var isShowingAlert = false
    @State private var newJournalName = ""
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(journals) { journal in
                    NavigationLink {
                        JournalView(journal: journal)
                    } label: {
                        VStack(alignment: .leading) {
                            Text(journal.title)
                            Text("Entries: \(journal.entries.count)")
                                .foregroundStyle(.gray)
                                .font(.footnote)
                        }
                    }
                }
                .onDelete(perform: deleteJournal)
            }
            .navigationTitle("Journals")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
                ToolbarItem {
                    
                    Button(action: { isShowingAlert = true }) {
                        Label("Add Item", systemImage: "plus")
                    }
                }
            }
            // This is my new Journal AlertView
            .alert("New Journal Name", isPresented: $isShowingAlert) {
                NewJournalAlert()
            }
        }
    }
    
    private func deleteJournal(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(journals[index])
                save()
            }
        }
    }
    
    func save() {
        try? modelContext.save()
    }
}



#Preview {
    JournalList()
        .modelContainer(for: [Journal.self, Entry.self], inMemory: true)
}
