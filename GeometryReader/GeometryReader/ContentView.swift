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
    @State private var columnCount = 0
    var body: some View {
        
        GeometryReader { geometry in
            
            if horizontalSizeClass == .regular {
                
            }
            VStack {
                Image(systemName: "person.fill")
                    .resizable()
                    .frame(width: geometry.size.width / 2, height: geometry.size.height / 4)
                Text("First Employee")
            }
            .background(Color.gray)
            .cornerRadius(15)
            .padding()
            VStack {
                Image(systemName: "person.fill")
                    .resizable()
                    .frame(width: geometry.size.width / 2, height: geometry.size.height / 4)
            }
        }
//        GeometryReader { screenSize in
//            VStack {
//                HStack {
//                    
//                    Text("First Employee")
//                    .frame(width: screenSize.size.width / 2, height: screenSize.size.height / 2)
//                    .background(RoundedRectangle(cornerSize: CGSize(width: 10, height: 10)).fill(.gray))
//                    
//                    Text("Second Employee")
//                    .frame(width: screenSize.size.width / 2, height: screenSize.size.height / 2)
//                    .border(Color.gray)
//                }
//                .padding()
//                
//                HStack {
//                    Text("Third Employee")
//                    .frame(width: screenSize.size.width / 2, height: screenSize.size.height / 2)
//                    .border(Color.gray)
//                    
//                    Text("Fourth Employee")
//                    .frame(width: screenSize.size.width / 2, height: screenSize.size.height / 2)
//                    .border(Color.gray)
//                }
//            }
//        }
    }
}

#Preview {
    ContentView()
}
