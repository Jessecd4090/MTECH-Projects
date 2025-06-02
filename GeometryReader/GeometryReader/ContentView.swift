//
//  ContentView.swift
//  GeometryReader
//
//  Created by Jestin Dorius on 5/29/25.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.verticalSizeClass) var verticalSizeClass
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    
    var body: some View {
        
            
        GeometryReader { screenSize in
            VStack {
                HStack {
                    
                    Text("First Employee")
                    .frame(width: screenSize.size.width / 2, height: screenSize.size.height / 2)
                    .background(RoundedRectangle(cornerSize: CGSize(width: 10, height: 10)).fill(.gray))
                    
                    Text("Second Employee")
                    .frame(width: screenSize.size.width / 2, height: screenSize.size.height / 2)
                    .border(Color.gray)
                }
                .padding()
                
                HStack {
                    Text("Third Employee")
                    .frame(width: screenSize.size.width / 2, height: screenSize.size.height / 2)
                    .border(Color.gray)
                    
                    Text("Fourth Employee")
                    .frame(width: screenSize.size.width / 2, height: screenSize.size.height / 2)
                    .border(Color.gray)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
