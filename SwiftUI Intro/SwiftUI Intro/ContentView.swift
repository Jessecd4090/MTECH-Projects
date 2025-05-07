//
//  ContentView.swift
//  SwiftUI Intro
//
//  Created by Jestin Dorius on 5/1/25.
//

import SwiftUI

struct ContentView: View {
    
    @State var isDisabled = Bool()
    @State var message = ""
    
    var body: some View {
        ZStack(alignment: .top) {
            Color.black.ignoresSafeArea()
            Text("Favorite Sport").foregroundStyle(.white)
                .font(.largeTitle).padding(75)
                Spacer()
            VStack {
                Spacer()
                Spacer()
                HStack {
                    createButton(title: "Golf")
                    createButton(title: "Football")
                }
                HStack {
                    createButton(title: "Soccer")
                    createButton(title: "Baseball")
                }
                Spacer()
                createSubmitButton(width: 200)
                Spacer()
            }
            Spacer()
        }
        
        
    }
    
    func createButton(title: String) -> some View {
        Button {
            
        } label: {
            Text(title)
                .foregroundStyle(.white)
                
        }
        
        .frame(width: 100, height: 100)
        .background(!isDisabled ? .green : .gray)
        .disabled(isDisabled)
        .cornerRadius(24)
        
    }
    
    func createSubmitButton(width: CGFloat) -> some View {
        Button {
            print("Submit Tapped")
            isDisabled.toggle()
        } label: {
            Text("Submit")
        }
        
        .frame(width: 100, height: 75)
        .buttonStyle(.borderedProminent)
        
    }
}

#Preview {
    ContentView()
}
