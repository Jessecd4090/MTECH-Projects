//
//  PlacePinScreen.swift
//  Trip Logger
//
//  Created by Jane Madsen on 4/29/25.
//


import SwiftUI
import SwiftData
import MapKit
import PhotosUI


struct PlacePinScreen: View {
//    @Binding var tripName: String
    @State var trip: Trip
    @State private var journalEntry = JournalEntry()
    
    var body: some View {
        VStack {
            MapReader { reader in // Allows conversion of a touch gesture into coordinates
                
                Map {
                    // TODO: Display the pin the user placed
                    Marker(item: journalEntry.location.mapItem ?? MKMapItem())
                    
                }
                
                .mapStyle(.imagery)
                .onTapGesture { location in
                    placePin(reader: reader, location: location)
                }
            }
            Text("Trip name: \(trip.name)")
            NavigationLink {
                    SetUpPinScreen(trip: $trip)
            } label: {
                Text("Next")
            }
            .buttonStyle(.borderedProminent)
            .disabled(trip.journalEntries.isEmpty)
        }
        .navigationTitle("Place First Pin")

    }
    
    func placePin(reader: MapProxy, location: CGPoint) {
        if let coordinate = reader.convert(location, from: .local) {
            journalEntry = JournalEntry(name: trip.name, location: Location(latitude: coordinate.latitude, longitude: coordinate.longitude))
            trip.journalEntries.append(journalEntry)
            
                       
            
        }
    }
    
}

#Preview {
    PlacePinScreen(trip: Trip(name: "TEST"))
        .modelContainer(ModelContainer.preview)
}
