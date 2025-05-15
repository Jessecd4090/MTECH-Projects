//
//  ContentView.swift
//  SwiftUI Animations
//
//  Created by Jestin Dorius on 5/15/25.
//

import SwiftUI

struct ContentView: View {
    
    @State var gameStarted: Bool = false
    @State var twoStarted: Bool = false
    @State var oneStarted: Bool = false
    @State var goStarted: Bool = false
    @State var firstNumberSmall: Bool = false
    @State var secondNumberSmall: Bool = false
    @State var thirdNumberSmall: Bool = false
    @State var goSmall: Bool = false
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            Text("3")
                .foregroundStyle(gameStarted ? .white : .clear)
                .scaleEffect(gameStarted ? 1 : 25)
                .opacity(firstNumberSmall ? 0 : 10)
            Text("2")
                .foregroundStyle(twoStarted ? .white : .clear)
                .scaleEffect(twoStarted ? 1 : 25)
                .opacity(secondNumberSmall ? 0 : 10)
            Text("1")
                .foregroundStyle(oneStarted ? .white : .clear)
                .scaleEffect(oneStarted ? 1 : 25)
                .opacity(thirdNumberSmall ? 0 : 10)
            Text("Go!")
                .foregroundStyle(goStarted ? .white : .clear)
                .scaleEffect(goStarted ? 1 : 25)
                .opacity(goSmall ? 0 : 10)
            Button {
                // Number 3 shrinks
                withAnimation(.easeIn(duration: 1)) {
                    gameStarted.toggle()
                    print(gameStarted)
                } completion: {
                    // Number 3 disappears
                    withAnimation(.easeOut(duration: 0.3)) {
                        firstNumberSmall.toggle()
                    } completion: {
                        // Number 2 shrinks
                        withAnimation(.easeIn(duration: 1)) {
                            twoStarted.toggle()
                        } completion: {
                            // Number 2 Disappears
                            withAnimation(.easeOut(duration: 0.3)) {
                                secondNumberSmall.toggle()
                            } completion: {
                                // Number 1 shrinks
                                withAnimation(.easeIn(duration: 1)) {
                                    oneStarted.toggle()
                                } completion: {
                                    // Number 1 Disappears
                                    withAnimation(.easeOut(duration: 0.3)) {
                                        thirdNumberSmall.toggle()
                                    } completion: {
                                        // Go Shrinks
                                        withAnimation(.easeIn(duration: 1)) {
                                            goStarted.toggle()
                                        } completion: {
                                            // Go Disappears
                                            withAnimation(.easeOut(duration: 0.3)) {
                                                goSmall.toggle()
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            } label: {
                Text("Start Game")
            }
            .position(x: 182, y: 600)
            .padding()
        }
        
        
    }
}

#Preview {
    ContentView()
}
