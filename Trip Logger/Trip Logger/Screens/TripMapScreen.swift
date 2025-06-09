//
//  TripMapScreen.swift
//  Trip Logger
//
//  Created by Jane Madsen on 4/29/25.
//


import SwiftUI
import SwiftData
import MapKit
import PhotosUI

struct TripMapScreen: View {
    var trip: Trip
    
    @State var position: MapCameraPosition
    @State var selectedEntry: JournalEntry?
    
    var body: some View {
        VStack {
            Map(position: $position, selection: $selectedEntry) {
                ForEach(trip.journalEntries) { journalEntry in
                    // Creates a pin on the map for every journal entry using its stored name and coordinates
                    Marker("\(journalEntry.name)", coordinate: journalEntry.location.coordinate!)
                        .tag(journalEntry) // Allows the journal entry to be selected and stored in selectedEntry
                }
            }
            
            if selectedEntry != nil {
                // Show Journal bar with name, date, notes, and photos
                Journal(journalEntry: $selectedEntry)
            }
            
        }
        .navigationTitle(trip.name)
        .toolbar {
            Button("Edit") {
                // TODO: Add ability to edit trip name, delete trip
            }
        }
    }
}

#Preview {
    NavigationStack {
        TripMapScreen(trip: Trip.mock(), position: .automatic)
    }
}
