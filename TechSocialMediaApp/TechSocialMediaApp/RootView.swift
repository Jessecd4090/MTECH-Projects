//
//  RootView.swift
//  TechSocialMediaApp
//
//  Created by Jestin Dorius on 6/19/25.
//
import SwiftUI

struct RootView: View {
    @State var isLoggedIn = false
    var body: some View {
        if isLoggedIn {
            // User.current should never be nil after this
            Text("You're logged in")
        } else {
            // User.current will be nil here
            LogInView(isLoggedIn: $isLoggedIn)
        }
    }
}
