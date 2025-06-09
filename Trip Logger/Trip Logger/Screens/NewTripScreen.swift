//
//  NewTripView.swift
//  Trip Logger
//
//  Created by Jane Madsen on 4/29/25.
//

import SwiftUI
import SwiftData
import MapKit
import PhotosUI

struct NewTripScreen: View {
    @State private var tripName: String = ""
    var body: some View {
        NavigationStack {
            VStack {
                Text("First, give a name to your trip.")
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding()
                TextField("Trip Name", text: $tripName)
                    .scaledToFit()
                    .border(Color.gray.opacity(0.4))
                    .padding()
                    
            }
            .padding()
            
            NavigationLink {
                PlacePinScreen(trip: Trip(name: tripName))
            } label: {
                Text("Next")
            }
            .buttonStyle(.borderedProminent)
            .disabled(tripName.isEmpty)
        }
    }
}

#Preview {
    NewTripScreen()
        .modelContainer(ModelContainer.preview)
}
