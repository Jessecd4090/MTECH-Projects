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
    var body: some View {
        ZStack {
            if viewModel.fetchingUserProfile {
                progressView()
            } else {
                VStack {
                    profileView()
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
                                VStack {
                                    HStack {
                                        Text(post.title)
                                            .fontWeight(.bold)
                                        Spacer()
                                        VStack {
                                            Button("Edit") {
                                                editPostSheet.toggle()
                                            }
                                            .sheet(isPresented: $editPostSheet) {
                                                EditPostView(post: post, viewModel: $viewModel)
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
                                    HStack {
                                        Text("Comments Count: ")
                                        Text("\(post.numComments)")
                                    }
                                    HStack {
                                        Text("Likes: ")
                                        Text("\(post.likes)")
                                    }
                                    HStack {
                                        Text("Created At: ")
                                        Text(post.createdDate)
                                            .font(.caption)
                                    }
                                }
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
        .sheet(isPresented: $newPostSheet) {
            NewPostView(viewModel: $viewModel)
        }
        
        .toolbar(content: {
            if viewModel.fetchingUserProfile == false {
                EditButton()
                Menu("", systemImage: "gear") {
                    addPostButton()
                    NavigationLink("All Posts") {
                        AllPostsView(viewModel: $viewModel)
                    }
                    Button("Delete All Users Posts") {
                        Task {
                            await viewModel.deleteAllPosts()
                            try await viewModel.getUserPosts(userSecret: viewModel.user.secret, userID: viewModel.userProfile.userUUID)
                        }
                    }
                }
                
            }
        })
        .task {
            await getUserProfile()
            await getUserPosts()
            
        }
    }
    
}
#Preview {
    NavigationStack {
        MainView(viewModel: .constant(UserViewModel()))
    }
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
                .padding(.trailing, 75)
            VStack {
                
                Text(viewModel.userProfile.firstName + " " + viewModel.userProfile.lastName)
                    .font(.largeTitle)
                Text("@" + viewModel.userProfile.userName)
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
        techInterestsAndBio()
    }
}

