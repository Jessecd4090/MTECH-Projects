//
//  ContentView.swift
//  TechSocialMediaApp
//
//  Created by Jestin Dorius on 6/19/25.
//

import SwiftUI


struct LogInView: View {
    @Binding var isLoggedIn: Bool
    @State var email = ""
    @State var password = ""
    @State var errorMessage = ""
    var authenticationController = AuthenticationController()
    var body: some View {
        VStack {
            Text("Tech Social Media App")
                .font(.title)
            TextField("Email", text: $email)
                .textFieldStyle(.roundedBorder)
            SecureField("Password", text: $password)
                .textFieldStyle(.roundedBorder)
                .padding(.bottom, 24)
            Text(errorMessage)
                .foregroundStyle(.red)
            Button("Sign In") {
                signInButtonTapped()
            }
            .padding(.top, 25)
            .disabled(email.isEmpty ||
                      password.isEmpty)
        }
        .padding()
        .onAppear {
#if DEBUG
//        Uncomment the three lines below and enter your credentials to
//        automatically sign in everytime you launch the app.

//        email = "jestindorius@gmail.com"
//        password = "Test123"
//        signInButtonTapped()
#endif
        }
    }
    func signInButtonTapped() {
        Task {
            do {
                // Make the API Call
                isLoggedIn = try await authenticationController.signIn(email: email, password: password)
                
            } catch {
                print(error)
                errorMessage = "Invalid Username or Password"
            }
        }
    }
    
}



#Preview {
    LogInView(isLoggedIn: .constant(false))
}
