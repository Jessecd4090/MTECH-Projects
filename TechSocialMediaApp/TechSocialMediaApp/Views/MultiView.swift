//
//  MultiView.swift
//  TechSocialMediaApp
//
//  Created by Jestin Dorius on 7/6/25.
//

import SwiftUI

struct MultiView: View {
    @Binding var viewModel: UserViewModel
    var body: some View {
        TabView {
            Tab("Home", systemImage: "house.fill") {
                NavigationStack {
                    MainView(viewModel: $viewModel)
                }
            }
            Tab("All Posts", systemImage: "list.bullet") {
                AllPostsView(viewModel: $viewModel)
            }
        }
    }
}

#Preview {
    MultiView(viewModel: .constant(UserViewModel()))
}
