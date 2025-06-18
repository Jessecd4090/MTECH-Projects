//
//  ContentView.swift
//  Trip Logger
//
//  Created by Jane Madsen on 4/16/25.
//

import SwiftUI
import SwiftData
import MapKit
import PhotosUI

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var trips: [Trip]
    @State var isShowingNewTrip = false
    
    var body: some View {
        NavigationStack {
            ViewThatFits {
                if trips.isEmpty {
                    Text("No trips yet.")
                        .font(.largeTitle)
                } else {
                    List {
                        ForEach(trips) { trip in
                            NavigationLink(destination: TripMapScreen(trip: trip, position: .automatic, tripName: trip.name)
                            ) {
                                Text(trip.name)
                            }
                        }
                    }
                }
            }
            .navigationTitle("Trip Logger")
            .toolbar {
                Button("Add") {
                    isShowingNewTrip = true
                }
            }
            .sheet(isPresented: $isShowingNewTrip) {
                NavigationStack {
                    NewTripScreen()
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
