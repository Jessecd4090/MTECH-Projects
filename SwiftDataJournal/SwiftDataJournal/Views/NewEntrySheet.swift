//
//  NewEntryAlert.swift
//  SwiftDataJournal
//
//  Created by Jestin Dorius on 6/6/25.
//

import SwiftUI
import SwiftData

struct NewEntrySheet: View {
    @Environment(\.dismiss) var dismiss
    @State var title: String = ""
    @State var message: String = ""
    @State var entry: Entry?
    @State var journal: Journal
    @Environment(\.modelContext) private var modelContext
    var body: some View {
        VStack {
            // Entry title if has value
            if entry != nil {
                Text(entry?.title ?? title)
                    .font(.largeTitle)
                    .padding()
                Text("Journal Name: " + journal.title)
            } else {
                Text(title.isEmpty ? "New Entry" : title)
                    .font(.largeTitle)
                    .padding()
            }
            TextField("Title", text: $title)
                .frame(width: 350)
                .textFieldStyle(.roundedBorder)
            TextEditor(text: $message)
                .frame(width: 350, height: 400)
                .border(Color.gray.opacity(0.5))
            Spacer()
            Button {
                if entry == nil {
                    saveEntry()
                } else {
                    editEntry(entry: entry!)
                }
                save()
                dismiss()
            } label: {
                Text("Save New Entry")
            }
            .disabled(title.isEmpty || message.isEmpty)
            .buttonStyle(.borderedProminent)
            .onAppear {
                guard let entry else { return }
                title = entry.title
                message = entry.message
            }
            Spacer()
        }
        
    }
    func editEntry(entry: Entry) {
        self.entry?.title = title
        self.entry?.message = message
        self.entry?.updatedAt = Date()
        print(self.entry)
    }
    func saveEntry() {
        let newEntry = Entry(title: title, message: message, journal: journal)

    }
    
    func save() {
        try? modelContext.save()
    }
}


#Preview {
    NewEntrySheet(entry: Entry(title: "FAKE", message: "FAKE", journal: Journal(title: "", entries: [])), journal: Journal(title: "", entries: []))
}
