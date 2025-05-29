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
            HStack {
                VStack {
                    
                    Button {
                        
                    } label: {
                        Text("First Employee")
                    }
                    .frame(width: screenSize.size.width / 4, height: screenSize.size.height / 4)
                    .border(Color.gray)
                    
                    
                    Button {
                        
                    } label: {
                        Text("Second Employee")
                    }
                    
                    .frame(width: screenSize.size.width / 4, height: screenSize.size.height / 4)
                    .border(Color.gray)
                }
                .padding()
                
                
                VStack {
                    Button {
                        
                    } label: {
                        Text("Third Employee")
                    }
                    .frame(width: screenSize.size.width / 4, height: screenSize.size.height / 4)
                    .border(Color.gray)
                    
                    Button {
                        
                    } label: {
                        Text("Fourth Employee")
                    }
                    .frame(width: screenSize.size.width / 4, height: screenSize.size.height / 4)
                    .border(Color.gray)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
