//
//  PostView.swift
//  TechSocialMediaApp
//
//  Created by Jestin Dorius on 6/27/25.
//
import SwiftUI


struct AllPostsView: View {
    @Binding var viewModel: UserViewModel
    var body: some View {
        List {
            ForEach(viewModel.allPosts, id: \.postid) { post in
                VStack {
                    HStack {
                        Text(post.title)
                            .fontWeight(.bold)
                        Spacer()
                        Text("ID: ")
                            .font(.caption)
                        Text("\(post.postid)")
                            .font(.caption)
                    }
                    Text(post.body)
                    HStack {
                        Text("Likes: ")
                        Text("\(post.likes)")
                    }
                    HStack {
                        Text("Created At: ")
                        Text(post.createdDate)
                            .font(.caption)
                    }
                    HStack {
                        Text("Username: ")
                        Text(post.authorUserName)
                    }
                }
            }
        }
        .navigationTitle("All Posts")
        .onAppear {
            if viewModel.allPosts.isEmpty {
                Task {
                    defer {
                        print(viewModel.userProfile.posts)
                    }
                    do {
                        viewModel.allPosts = try await viewModel.getAllPosts(userSecret: viewModel.user.secret)
                    }
                }
            }
        }
        
    }
}
