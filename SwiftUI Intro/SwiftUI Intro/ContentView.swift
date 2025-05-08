//
//  ContentView.swift
//  SwiftUI Intro
//
//  Created by Jestin Dorius on 5/1/25.
//

import SwiftUI

struct ContentView: View {
    
    @State var enabledButtons = [String]()
    @State var isHidden = Bool()
    @State var button1Selected = Bool()
    @State var button2Selected = Bool()
    @State var button3Selected = Bool()
    @State var button4Selected = Bool()
    
    var body: some View {
        ZStack(alignment: .top) {
            Color
                .black
                .ignoresSafeArea()
            Text("Favorite Swords of Justice")
                .foregroundStyle(.white)
                .font(.largeTitle)
                .padding(75)
                Spacer()
            VStack {
                Spacer()
                Spacer()
                HStack {
                    createButton(
                        title: "Cobaloin",
                        enabled: button1Selected,
                        id: 1)
                    createButton(
                        title: "Terrakion",
                        enabled: button2Selected,
                        id: 2)
                }
                HStack {
                    createButton(
                        title: "Virizion",
                        enabled: button3Selected,
                        id: 3)
                    createButton(
                        title: "Keldeo",
                        enabled: button4Selected,
                        id: 4)
                }
                Spacer()
                Text("You picked \(enabledButtons.joined(separator: ", "))")
                    .foregroundStyle(!isHidden ? .black : .white)
                    .font(
                        .title2)
                createSubmitButton(
                    width: 200)
                Spacer()
            }
            Spacer()
        }
        
        
    }
    
    func createButton(title: String, enabled: Bool, id: Int) -> some View {
        Button {
            addButtonToEnabled(title)
            
            button1Selected
                .toggle()
            print(enabledButtons)
        } label: {
            Text(title)
                .foregroundStyle(
                    .white)
                
        }
        
        .frame(
            width: 100,
            height: 100)
        .background(enabledButtons.contains(title) ? .gray : .green)
//        .disabled(isDisabled)
        .cornerRadius(24)
        
    }
    
    func createSubmitButton(width: CGFloat) -> some View {
        Button {
            print("Submit Tapped")
            isHidden
                .toggle()
            if isHidden == false {
                enabledButtons.removeAll()
            }
        } label: {
            Text("Submit Answers")
        }
        
        .frame(
            width: 150,
            height: 75)
        .buttonStyle(.borderedProminent)
        
    }
    
    func addButtonToEnabled(_ title: String) {
        if enabledButtons.contains(title) {
            enabledButtons.removeAll { string in
                string == title
            }
        } else {
            enabledButtons.append(title)
        }
    }
    
}

#Preview {
    ContentView()
}
