//
//  SetUpPinScreen.swift
//  Trip Logger
//
//  Created by Jane Madsen on 4/29/25.
//


import SwiftUI
import SwiftData
import MapKit
import PhotosUI

struct SetUpPinScreen: View {
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) var modelContext
//    @Environment(\.router) var router
    @State var trip: Trip
    @State private var pinName: String = ""
    @State private var notes: String = ""
    
    
    var body: some View {
        VStack {
            Text("Name your first pin, add photos, and add notes to this stop")
                .font(.title)
                .padding()
            VStack {
                TextField("Pin Name", text: $trip.journalEntries.first!.name)
                    .border(Color.gray.opacity(0.5))
                    .padding()
                TextField("Notes:", text: $trip.journalEntries.first!.text)
                    .border(Color.gray.opacity(0.5))
                    .padding()
            }
            PhotoScrollView(journalEntry: trip.journalEntries.first!)
            Button {
                modelContext.insert(trip)
                dismiss()
                dismiss()
                
            } label: {
                Text("Save")
            }
        }
        
    }
}

#Preview {
    SetUpPinScreen(trip: .mock())
}
