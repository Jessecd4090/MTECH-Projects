//
//  Journal.swift
//  Trip Logger
//
//  Created by Jane Madsen on 4/29/25.
//


import SwiftUI
import SwiftData
import MapKit
import PhotosUI

struct Journal: View {
    @Binding var journalEntry: JournalEntry?
    @Binding var editing: Bool
    @State var notes: String = ""
    var body: some View {
        JournalTopBar(journalEntry: $journalEntry)
            .padding()
        
        if let journalEntry {
            Text(journalEntry.date.formatted(date: .abbreviated, time: .omitted))
                .font(.headline)
            if editing {
                TextField("Notes", text: $notes)
                    .textFieldStyle(.roundedBorder)
                    .frame(width: 125, height: 30)
            } else {
                Text(journalEntry.text)
                    .font(.body)
            }
            PhotoScrollView(journalEntry: journalEntry)
        }
    }
}



struct JournalTopBar: View {
    @Binding var journalEntry: JournalEntry?
    @State var editing = Bool()
    @State var journalEntryName: String = ""
    @Environment(\.modelContext) var modelContext
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        HStack {
            VStack {
                Button(editing ? "Save" : "Edit") {
                    // TODO: Add ability to edit journal entries
                    editing.toggle()
                    if journalEntry?.name != journalEntryName && !journalEntryName.isEmpty {
                        journalEntry?.name = journalEntryName
                    }
                }
                if editing {
                    Button("Delete") {
                        modelContext.delete(journalEntry!)
                        journalEntry = nil
                    }
                }
            }
            
            Spacer()
            if editing {
                TextField("Journal Entry Name", text: $journalEntryName)
                    .frame(width: 250, height: 30)
                    .border(Color.gray.opacity(0.5))
            } else {
                Text(journalEntry?.name ?? "Journal Entry")
                    .font(.title)
            }
            
            Spacer()
            
            Button("Dismiss") {
                journalEntry = nil
            }
        }
        .onAppear {
            journalEntryName = journalEntry?.name ?? "FAILED"
        }
    }
    func removeEntry(entry: JournalEntry) {
        modelContext.delete(entry)
    }
}

#Preview {
    @Previewable @State var trip = Trip.mock()
    
    TripMapScreen(trip: trip, position: .automatic, selectedEntry: trip.journalEntries.first, tripName: "")
}
