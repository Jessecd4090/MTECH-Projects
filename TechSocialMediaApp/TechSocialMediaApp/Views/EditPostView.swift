//
//  EditPostView.swift
//  TechSocialMediaApp
//
//  Created by Jestin Dorius on 7/2/25.
//

import SwiftUI

struct EditPostView: View {
    @Environment(\.dismiss) var dismiss
    @State var post: Post
    @Binding var viewModel: UserViewModel
    var body: some View {
        VStack {
            Text("Edit Post")
                .font(.largeTitle)
            Spacer()
            Text("Post Title")
            TextField("Post Title", text: $post.title)
                .frame(maxWidth: 300)
                .textFieldStyle(.roundedBorder)
                .border(Color.gray.opacity(0.5))
            Text("Post Body")
            TextEditor(text: $post.body)
                .frame(width: 300, height: 200)
                .border(Color.gray.opacity(0.5))
            Spacer()
            Button("Save") {
                Task {
                    await viewModel.editPost(secret: viewModel.user.secret, post: post)
                    try await viewModel.getUserPosts(userSecret: viewModel.user.secret, userID: viewModel.userProfile.userUUID)
                }
                dismiss()
            }
            .buttonStyle(.borderedProminent)
            Button("Dismiss") {
                dismiss()
            }
            .buttonStyle(.borderedProminent)
            Spacer()
        }
    }
}

#Preview {
    EditPostView(post: .init(postid: 1, title: "FAKE", body: "FAKE", authorUserName: "", authorUserId: .init(), likes: 1, userLiked: true, numComments: 1, createdDate: ""), viewModel: .constant(UserViewModel()))
}
