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
        NavigationStack {
            List {
                ForEach(viewModel.allPosts, id: \.postid) { post in
                    postView(post: post)
                }
            }
        }
//        .toolbar(.hidden, for: .navigationBar)
//        .toolbarVisibility(.hidden, for: .navigationBar)
        .navigationTitle("All Posts")
        .onAppear {
            if viewModel.allPosts.isEmpty {
                Task {
                    do {
                        viewModel.allPosts = try await viewModel.getAllPosts(userSecret: viewModel.user.secret)
                    }
                }
            }
        }
    }
    @ViewBuilder
    func postView(post: Post) -> some View {
        VStack(alignment: .leading) {
            HStack {
                Text(post.title)
                    .fontWeight(.bold)
                Spacer()
                VStack {
                    HStack {
                        Text("ID: ")
                            .font(.caption)
                        Text("\(post.postid)")
                            .font(.caption)
                    }
                }
            }
            Text(post.body)
                .padding(.bottom, 15)
            HStack {
                HStack {
                    Text("Comments Count: ")
                        .font(.footnote)
                    Text("\(post.numComments)")
                        .font(.footnote)
                }
                HStack {
                    Text("Likes: ")
                        .font(.footnote)
                    Text("\(post.likes)")
                        .font(.footnote)
                }
            }
            HStack {
                HStack {
                    Text("Created At: ")
                        .font(.footnote)
                    Text(post.createdDate)
                        .font(.footnote)
                }
                Spacer()
                HStack {
                    Text("Written by: ")
                        .font(.footnote)
                    Text(post.authorUserName)
                        .font(.footnote)
                        .fontWeight(.bold)
                }
            }
        }
    }
}
