//
//  ContentView.swift
//  SwiftUIAdvancedTechniques
//
//  Created by Jestin Dorius on 6/2/25.
//

import SwiftUI

enum ViewState {
    case loading
    case success(String)
    case error(String)
    
}

struct ContentView: View {
    
    @State var users = UserTest()
    @State var username: String = ""
    @State var password: String = ""
    @State private var state: ViewState = .loading
    @State var isHidden = true
    
    var loginStyle = ViewStyles.loginButtonStyle()
    var forgotPasswordStyle = ViewStyles.forgotButtonStyle()
    
    var body: some View {
        VStack {
            Text("Login")
                .font(.largeTitle)
            TextField("Username", text: $username)
                .textfieldStyle
            
            // View Building function for password
            passwordView(isHidden: isHidden)
            
            Button {
                print("\(username) & \(password)")
                if username.isEmpty && password.isEmpty {
                    state = .error("Please enter username and password")
                }
                if username.isEmpty && password != "" {
                    state = .error("Please enter username")
                }
                if username != "" && password.isEmpty {
                    state = .error("Please enter password")
                }
                // Login check using testUser
                for user in users.savedUsers {
                    if username == user.username && password == user.password {
                        state = .success("Successful Login!!")
                        // Invalid Username
                    } else if username != user.username {
                        state = .error("Invalid Email")
                    } else if password != user.password {
                        state = .error("Invalid Password")
                    }
                }
            } label: {
                Text("Login")
            }
            .buttonStyle(loginStyle)
        }
        
        Button {
            
        } label: {
            Text("Forgot Password")
        }
        .buttonStyle(forgotPasswordStyle)
        
        Button {
            isHidden.toggle()
        } label: {
            Text("Toggle Password")
        }
        
        Spacer()
        
        VStack {
            switch state {
            case .loading:
                ProgressView("Loading")
            case .success(let message):
                Text(message).foregroundColor(.green)
            case .error(let errorMessage):
                Text(errorMessage).foregroundColor(.red)
            }
        }
    }
    @ViewBuilder
    func passwordView(isHidden: Bool) -> some View {
        if isHidden {
            SecureField("Password", text: $password)
                .textfieldStyle
        } else {
            TextField("Password", text: $password)
                .textfieldStyle
        }
    }
}





#Preview {
    ContentView()
}
