//
//  ContentView.swift
//  TechSocialMediaApp
//
//  Created by Jestin Dorius on 6/19/25.
//

import SwiftUI

struct LogInView: View {
    @State var passwordHidden = true
    @State var email = ""
    @State var password = ""
    @State var errorMessage = ""
    @Binding var viewModel: UserViewModel
    
    var body: some View {
        VStack {
            Text("Tech Social Media App")
                .font(.title)
            TextField("Email", text: $email)
                .textFieldStyle(.roundedBorder)
                .onChange(of: email) {
                    errorMessage = ""
                }
            if passwordHidden {
                HStack {
                    SecureField("Password", text: $password)
                        .textFieldStyle(.roundedBorder)
                        .padding(.bottom, 24)
                        .onChange(of: password) {
                            errorMessage = ""
                        }
                    Button("Show", systemImage: "eye") {
                        passwordHidden.toggle()
                    }
                }
            } else {
                HStack {
                    TextField("Password", text: $password)
                        .textFieldStyle(.roundedBorder)
                        .padding(.bottom, 24)
                        .onChange(of: password) {
                            errorMessage = ""
                        }
                    Button("Show", systemImage: "eye") {
                        passwordHidden.toggle()
                    }
                }
            }
            if viewModel.fetchingUser {
                ProgressView()
            } else {
                Text(errorMessage)
                    .foregroundStyle(.red)
            }
            Button("Sign In") {
                Task {
                    await signInButtonTapped(email: email, password: password)
                }
            }
            .padding(.top, 25)
            .disabled(email.isEmpty ||
                      password.isEmpty || viewModel.fetchingUser)
        }
        .padding()
        .task {
#if DEBUG
            email = "jestindorius@gmail.com"
            password = "Buvvyw-wynpe0-wecbuh"
            await signInButtonTapped(email: email, password: password)
#endif
        }
        //        .onAppear {
        //#if DEBUG
        //            //        Uncomment the three lines below and enter your credentials to
        //            //        automatically sign in everytime you launch the app.
        //
        //                email = "jestindorius@gmail.com"
        //                password = "Buvvyw-wynpe0-wecbuh"
        //                signInButtonTapped()
        //
        //#endif
        //        }
    }
    func signInButtonTapped(email: String, password: String) async {
        Task {
            do {
                viewModel.user = try await viewModel.login(email: email, password: password)
            } catch {
                
                print(error)
                errorMessage = "Invalid Username or Password"
            }
        }
        
        //        isLoading = true
        //        Task {
        //            defer {
        //                isLoading = false
        //            }
        //            do {
        //                // Make the API Call
        //                loggedInUser = try await authenticationController.signIn(email: email, password: password)
        //            } catch {
        //                print(error)
        //                errorMessage = "Invalid Username or Password"
        //            }
        //        }
    }
}



#Preview {
    LogInView(viewModel: .constant(UserViewModel()))
}
