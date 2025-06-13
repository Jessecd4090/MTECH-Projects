//
//  NewJournal.swift
//  SwiftDataJournal
//
//  Created by Jestin Dorius on 6/5/25.
//

import SwiftUI
import SwiftData

struct NewJournalAlert: View {
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) var modelContext
    @State var title: String = ""
    @State var alertOn = Bool()
    private var journalList = JournalList()
    var body: some View {
        
        TextField("Journal Name", text: $title)
        Button("Submit") {
            let newJournal = createNewJournal()
            modelContext.insert(newJournal)
            save()
            title = ""
        }
        .disabled(title.isEmpty)
        Button("Cancel", role: .cancel) {
            save()
            title = ""
            dismiss()
        }
    }
    
    private func createNewJournal() -> Journal {
        let newJournal = Journal(title: title, entries: [])
        return newJournal
    }
    
    func save() {
        try? modelContext.save()
    }
}



#Preview {
    NewJournalAlert()
    
}
