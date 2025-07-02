//
//  NewPostView.swift
//  TechSocialMediaApp
//
//  Created by Jestin Dorius on 6/23/25.
//

import SwiftUI

struct NewPostView: View {
    @Environment(\.dismiss) var dismiss
    @Binding var viewModel: UserViewModel
    @State var title: String = ""
    @State var bodyText: String = ""
    var body: some View {
        VStack {
            Text("New Post")
                .font(.largeTitle)
                Spacer()
            TextField("Post Title", text: $title)
                .frame(maxWidth: 300)
                .textFieldStyle(.roundedBorder)
                .border(Color.gray.opacity(0.5))
            Text("Post Body")
            TextEditor(text: $bodyText)
                .frame(width: 300, height: 200)
                .border(Color.gray.opacity(0.5))
                Button("Save") {
                    Task {
                        do {
                            try await viewModel.createPost(secret: viewModel.user.secret, title: title, body: bodyText)
                            try await viewModel.getUserPosts(userSecret: viewModel.user.secret, userID: viewModel.userProfile.userUUID)
                        } catch {
                            print("CREATING_POST_FAILED_IN_VIEW: \(error)")
                        }
                    }
                    dismiss()
                }
                .buttonStyle(.borderedProminent)
                Button("Cancel") {
                    dismiss()
                }
                .buttonStyle(.borderedProminent)
            Spacer()
        }
    }
}

#Preview {
    NewPostView(viewModel: .constant(UserViewModel()))
}
