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
    @Environment(\.modelContext) var modelContext
    @Environment(\.dismiss) var dismiss
    
    @State var position: MapCameraPosition
    @State var selectedEntry: JournalEntry?
    @State var editing = Bool()
    @State var tripName: String
    
    var body: some View {
        VStack {
            if editing {
                TextField("New Title", text: $tripName)
                    .frame(width: 250, height: 30)
                    .border(Color.gray.opacity(0.5))
            }
            MapReader { reader in
                Map(position: $position, selection: $selectedEntry) {
                    ForEach(trip.journalEntries) { journalEntry in
                        // Creates a pin on the map for every journal entry using its stored name and coordinates
                        Marker(journalEntry.name, coordinate: journalEntry.location.coordinate!)
                            .tag(journalEntry) // Allows the journal entry to be selected and stored in selectedEntry
                    }
                }
                
                .onTapGesture { location in
                    if editing {
                        placePin(reader: reader, location: location)
                    }
                }
                
                if selectedEntry != nil {
                    // Show Journal bar with name, date, notes, and photos
                    Journal(journalEntry: $selectedEntry, editing: $editing)
                }
            }
        }
        .navigationTitle(editing ? tripName : trip.name)
        .toolbar {
            Button(editing ? "Save" : "Edit") {
                // TODO: Add ability to edit trip name, delete trip
                editing.toggle()
                if tripName != "" {
                    if trip.name != tripName {
                        trip.name = tripName
                        tripName = ""
                    }
                }
                
            }
            if editing {
                Button("Delete") {
                    removeTrip(trip: trip)
                    dismiss()
                }
            }
        }
    }
    func placePin(reader: MapProxy, location: CGPoint) {
        if let coordinate = reader.convert(location, from: .local) {
            let journalEntry = JournalEntry(name: trip.name, location: Location(latitude: coordinate.latitude, longitude: coordinate.longitude))
            trip.journalEntries.append(journalEntry)
        }
    }
    func removeTrip(trip: Trip) {
        modelContext.delete(trip)
    }
    
    
    
}

#Preview {
    NavigationStack {
        TripMapScreen(trip: Trip.mock(), position: .automatic, tripName: "")
    }
}
