//
//  MainView.swift
//  TechSocialMediaApp
//
//  Created by Jestin Dorius on 6/19/25.
//
import SwiftUI

struct MainView: View {
    @Binding var viewModel: UserViewModel
    @State var newPostSheet = false
    @State var editPostSheet = false
    @State var alertShowing = false
    @State var editingPost = false
    var body: some View {
            VStack {
                if viewModel.fetchingUserProfile {
                    progressView()
                } else {
                    VStack {
                        profileView()
                            .padding(.trailing, 145)
                        techInterestsAndBio()
                        VStack {
                            Text("Posts")
                                .font(.largeTitle)
                        }
                        Spacer()
                        if viewModel.usersPosts.isEmpty {
                            empyPostView()
                            Spacer()
                        } else {
                            List {
                                ForEach(viewModel.usersPosts, id: \.postid) { post in
                                    postView(post: post, editingPost: editingPost)
                                }
                                .onDelete { indexSet in
                                    Task {
                                        await viewModel.deletePosts(at: indexSet)
                                    }
                                }
                            }
                        }
                    }
                }
            }
        
//        .toolbarVisibility(.visible, for: .navigationBar)
        .toolbar(content: {
            toolbarContent()
        })
        .sheet(isPresented: $newPostSheet) {
            NewPostView(viewModel: $viewModel)
        }
        
        .task {
            await getUserProfile()
            await getUserPosts()
        }
    }
}

#Preview {
        MainView(viewModel: .constant(UserViewModel()))
}

// ViewBuilder and Extra Functions
extension MainView {
    func getUserProfile() async {
        if viewModel.userProfile.userName.isEmpty {
            viewModel.fetchingUserProfile = true
            defer {
                viewModel.fetchingUserProfile = false
            }
            do {
                viewModel.userProfile = try await viewModel.fetchUserProfile(userUUID: viewModel.user.userUUID, userSecret: viewModel.user.secret)
            } catch {
                print(error)
            }
        }
    }
    
    func getUserPosts() async {
        viewModel.gettingUserPosts = true
        defer {
            viewModel.gettingUserPosts = false
        }
        do {
            try await viewModel.getUserPosts(userSecret: viewModel.user.secret, userID: viewModel.userProfile.userUUID)
        } catch {
            print(("GETTING_USER_POSTS_FAILED"))
        }
    }
    
    func getAllPosts() {
        Task {
            do {
                viewModel.userProfile.posts = try await viewModel.getAllPosts(userSecret: viewModel.user.secret)
            } catch {
                print(error)
            }
        }
    }
    
    @ViewBuilder
    func progressView() -> some View {
        VStack {
            Text("You're signed in!")
                .font(.largeTitle)
            ProgressView()
        }
    }
    
    @ViewBuilder
    func toolbarContent() -> some View {
        if viewModel.fetchingUserProfile == false {
            EditButton()
            Menu("", systemImage: "gear") {
                addPostButton()
                Button("Edit Posts", systemImage: "pencil") {
                    editingPost.toggle()
                }
                Button("Delete All Users Posts", systemImage: "trash") {
                    Task {
                        await viewModel.deleteAllPosts()
                        try await viewModel.getUserPosts(userSecret: viewModel.user.secret, userID: viewModel.userProfile.userUUID)
                    }
                }
            }
        }
    }
    
    @ViewBuilder
    func postView(post: Post, editingPost: Bool) -> some View {
        VStack(alignment: .leading) {
            HStack {
                Text(post.title)
                    .fontWeight(.bold)
                Spacer()
                VStack {
                    if editingPost {
                        Button("Edit") {
                            editPostSheet.toggle()
                        }
                        .sheet(isPresented: $editPostSheet) {
                            EditPostView(post: post, viewModel: $viewModel)
                        }
                    }
                    
                    HStack {
                        Text("ID: ")
                            .font(.caption)
                        Text("\(post.postid)")
                            .font(.caption)
                    }
                }
            }
            Text(post.body)
                .padding(.bottom, 10)
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
                Text("Created At: ")
                    .font(.footnote)
                Text(post.createdDate)
                    .font(.footnote)
            }
        }
    }
    
    @ViewBuilder
    func defaultPersonImage() -> some View {
        ZStack {
            Circle()
                .fill(LinearGradient(colors: [.red, .green, .blue], startPoint: .top, endPoint: .bottomTrailing))
                .frame(width: 75, height: 75)
            Image(systemName: "person.fill")
                .resizable()
                .frame(width: 45, height: 45)
        }
    }
    
    @ViewBuilder
    func addPostButton() -> some View {
        Button {
            newPostSheet.toggle()
            print(newPostSheet)
        } label: {
            Image(systemName: "plus")
            Text("New Post")
        }
    }
    
    @ViewBuilder
    func empyPostView() -> some View {
        Text("No Posts yet!!")
            .font(.largeTitle)
    }
    
    @ViewBuilder
    func userPhotoAndName() -> some View {
        HStack {
            defaultPersonImage()
            VStack(alignment: .leading) {
                Text(viewModel.userProfile.firstName + " " + viewModel.userProfile.lastName)
                    .font(.largeTitle)
                Text("@" + viewModel.userProfile.userName)
                    .foregroundStyle(.blue)
            }
        }
    }
    
    @ViewBuilder
    func techInterestsAndBio() -> some View {
        VStack {
            HStack {
                Text("Bio: ")
                    .fontWeight(.bold)
                Text("\(viewModel.userProfile.bio ?? "Empty")")
            }
            HStack {
                Text("Tech Interests: ")
                    .fontWeight(.bold)
                Text("\(viewModel.userProfile.techInterests ?? "Empty")")
            }
        }
    }
    
    @ViewBuilder
    func profileView() -> some View {
        userPhotoAndName()
    }
}

