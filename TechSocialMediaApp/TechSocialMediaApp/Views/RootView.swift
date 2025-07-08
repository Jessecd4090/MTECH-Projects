//
//  RootView.swift
//  TechSocialMediaApp
    //
    //  Created by Jestin Dorius on 6/19/25.
    //
import SwiftUI

struct RootView: View {
    
    @State var userViewModel = UserViewModel()
    @State var networkController = NetworkController()
    
    var body: some View {
        VStack {
            if userViewModel.isAuthenticated == true {
                MultiView(viewModel: $userViewModel)
            } else {
                LogInView(viewModel: $userViewModel)
            }
        }
    }
}

#Preview {
    RootView()
}

