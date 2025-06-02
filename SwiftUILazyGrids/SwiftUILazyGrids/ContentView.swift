//
//  ContentView.swift
//  SwiftUILazyGrids
//
//  Created by Jestin Dorius on 5/30/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView {
            
            // Hat Grid
            Text("Hats")
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHGrid(rows: [GridItem(.fixed(130))]) {
                    ForEach(hats, id: \.name) { hat in
                        ZStack {
                            Color.random()
                            VStack {
                                Text(hat.name)
                                Text("$" + String(hat.price))
                                Text(hat.color)
                                    .font(.footnote)
                                    .foregroundStyle(Color.gray)
                            }
                            
                        }
                        .cornerRadius(30)
                        .frame(width: 130)
                    }
                }
                .scrollTargetLayout()
                .padding()
                
            }
            .scrollTargetBehavior(.viewAligned)
            
            // Shirt Grid
            Text("Shirts")
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHGrid(rows: [
                    GridItem(.fixed(110)),
                    GridItem(.fixed(110))]) {
                    ForEach(shirts, id: \.name) { shirt in
                        ZStack {
                            Color.random()
                            VStack {
                                Text(shirt.name)
                                Text("$" + String(shirt.price))
                                Text(shirt.color)
                                    .font(.footnote)
                                    .foregroundStyle(Color.gray)
                            }
                        }
                        .cornerRadius(30)
                        .frame(width: 110)
                    }
                }
                .padding()
            }
            
            Text("Pants")
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHGrid(rows: [
                    GridItem(.adaptive(minimum: 150)),
                    GridItem(.adaptive(minimum: 150)),
                    GridItem(.adaptive(minimum: 150)),
                    GridItem(.adaptive(minimum: 150))
                ]) {
                    ForEach(pants) { pant in
                        ZStack {
                            Color.random()
                            VStack {
                                Text(pant.name)
                                    .minimumScaleFactor(0.5)
                                    .padding()
                                Text("$" + String(pant.price))
                                Text(pant.color)
                                    .font(.footnote)
                                    .foregroundStyle(Color.gray)
                            }
                        }
                        .cornerRadius(10)
                        .frame(width: 110)
                    }
                }
                .scrollTargetLayout()
                .padding()
            }
            .scrollTargetBehavior(.paging)
        }
    }
}

#Preview {
    ContentView()
}

// Color Extension
extension Color {
    static func random() -> Color {
        return Color(red: Double.random(in: 0.5...1), green: Double.random(in: 0.5...1), blue: Double.random(in: 0.5...1))
    }
}
