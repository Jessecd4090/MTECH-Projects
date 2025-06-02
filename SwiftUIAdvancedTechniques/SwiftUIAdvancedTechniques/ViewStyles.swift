//
//  ViewStyles.swift
//  SwiftUIAdvancedTechniques
//
//  Created by Jestin Dorius on 6/2/25.
//

import Foundation
import SwiftUI

class ViewStyles {
    struct TextFieldStyle: ViewModifier {
        func body(content: Content) -> some View {
            content
                .padding()
                .frame(width: 350)
                .background(Color.gray.opacity(0.2))
                .cornerRadius(12)
        }
    }
    
    struct loginButtonStyle: ButtonStyle {
        func makeBody(configuration: Configuration) -> some View {
            configuration.label
                .padding()
                .frame(width: 350, height: 45)
                .background(configuration.isPressed ? .gray : .blue)
                .cornerRadius(10)
                .scaleEffect(configuration.isPressed ? 2 : 1)
        }
    }
    
    struct forgotButtonStyle: ButtonStyle {
        func makeBody(configuration: Configuration) -> some View {
            configuration.label
                .frame(width: 300, height: 45)
                .background(configuration.isPressed ? LinearGradient(colors: [.red, .orange, .yellow, .green, .blue, .purple, .indigo], startPoint: .topLeading, endPoint: .bottomTrailing) : LinearGradient(colors: [.pink], startPoint: .top, endPoint: .bottom))
                .cornerRadius(10)
                .scaleEffect(configuration.isPressed ? 1.5 : 1)
        }
    }
    
}
extension View {
    var textfieldStyle: some View {
        self
            .modifier(ViewStyles.TextFieldStyle())
    }
}
