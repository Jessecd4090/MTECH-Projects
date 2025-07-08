    //
    //  PostView.swift
    //  TechSocialMediaApp
    //
    //  Created by Jestin Dorius on 6/27/25.
    //
import SwiftUI


struct AllPostsView: View {
    @Binding var viewModel: UserViewModel
    @State var comments = [Comments]()
    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.allPosts, id: \.postid) { post in
                    postView(post: post)
                }
            }
        }
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
}

extension AllPostsView {
    @ViewBuilder
    func postView(post: Post) -> some View {
        VStack(alignment: .leading) {
            HStack {
                Text(post.title)
                    .fontWeight(.bold)
                    .font(.title2)
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
            if comments.isEmpty {
                HStack {
                    Text("Comments Count: ")
                        .font(.footnote)
                    Text("\(post.numComments)")
                        .font(.footnote)
                }
            } else {
                Text("Comments: ")
                    .foregroundStyle(
                        LinearGradient(
                            colors: [.purple, .yellow, .blue, .red],
                            startPoint: .top,
                            endPoint: .bottomTrailing
                        )
                    )
                Text(comments[0].body)
                Text(comments[0].userName)
                    .font(.footnote)
            }
        }
        .onAppear {
            if post.numComments > 0 {
                Task {
                    comments = await viewModel
                        .getComments(
                            secret: viewModel.user.secret,
                            postid: post.postid)
                }
            }
        }
    }
}
