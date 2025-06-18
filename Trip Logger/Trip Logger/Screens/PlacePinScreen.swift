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
    @State var trip: Trip
    @State var locationManager = CLLocationManager()
    let applePark = CLLocationCoordinate2D(latitude: 37.3346, longitude: -122.0090)
    
    var body: some View {
        VStack {
            MapReader { reader in // Allows conversion of a touch gesture into coordinates
                
                Map(initialPosition: .region(MKCoordinateRegion(
                        center: applePark,
                        span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)))) {
                    // TODO: Display the pin the user placed
                            if let lastEntry = trip.journalEntries.last {
//                                Marker(item: lastEntry.location.mapItem!)
                                
//                                Marker(item: lastEntry.location.mapItem!)
                                Marker(lastEntry.name, coordinate: lastEntry.location.coordinate!)
                            }
                    
                }
                .onAppear(perform: {
                    locationServiceCheck()
                })
                .mapStyle(.standard)
                .onTapGesture { location in
                    placePin(reader: reader, location: location)
                }
            }
            Text("Trip name: \(trip.name)")
            NavigationLink {
                SetUpPinScreen(trip: trip)
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
            let journalEntry = JournalEntry(name: trip.name, location: Location(latitude: coordinate.latitude, longitude: coordinate.longitude))
            trip.journalEntries.append(journalEntry)
        }
    }
    
    func locationServiceCheck() {
        locationManager.requestWhenInUseAuthorization()
    }
}

#Preview {
    PlacePinScreen(trip: Trip(name: "TEST"))
        .modelContainer(ModelContainer.preview)
}
