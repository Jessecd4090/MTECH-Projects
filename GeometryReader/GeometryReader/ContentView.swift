//
//  ContentView.swift
//  GeometryReader
//
//  Created by Jestin Dorius on 5/29/25.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    @State var people = People.practicePeople
    @State var rowCount = 2
    @State var columnCount: Int = 0
    var body: some View {
        
        GeometryReader { geometry in
            VStack(alignment: .center) {
                ForEach(0..<rowCount, id: \.self) { row in
                        HStack {
                            Spacer()
                            
                            ForEach(0..<columnCount, id: \.self) {
                                column in
                                let index = (row * columnCount) + column
                                let person = people[index]
                                VStack {
                                    ZStack {
                                        Image(systemName: "person.fill")
                                            .resizable()
                                            .frame(width: 50, height: 50)
                                    }
                                    .background(Circle()
                                        .frame(width: 75, height: 75)
                                        .foregroundStyle(.blue))
                                    Text(person.name)
                                    Text("Person Descript")
                                    
                                }
                                .frame(width: geometry.size.width / CGFloat(columnCount) - 20, height: geometry.size.height / CGFloat(rowCount))
                                .background(RoundedRectangle(cornerSize: CGSize(width: 10, height: 10)).foregroundStyle(.gray))
                                
                            }
                            
                            Spacer()
                        }
                        
                        .cornerRadius(15)
                    }
                }
            .onAppear(perform: checkScreenSize)
        }
    }
    
    func checkScreenSize() {
        if horizontalSizeClass == .compact {
            columnCount = 2
        } else {
            columnCount = 3
        }
        
        rowCount = (people.count / columnCount)
    }
}
@ViewBuilder
func createEmployeeCard(person: People) -> some View {
        VStack {
            ZStack {
                Image(systemName: "person.fill")
                    .resizable()
                    .frame(width: 50, height: 50)
                
            }
            .background(Circle()
                .frame(width: 75, height: 75)
                .foregroundStyle(.blue))
            Text(person.name)
            Text(person.description)
        }
        .background(Color.gray)
        .cornerRadius(15)
    
}

#Preview {
    ContentView()
}
