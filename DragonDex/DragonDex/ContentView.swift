//
//  ContentView.swift
//  DragonDex
//
//  Created by Jestin Dorius on 5/14/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Button {
                
            } label: {
                Image(Dragon.dragons[0].name)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
            }
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
