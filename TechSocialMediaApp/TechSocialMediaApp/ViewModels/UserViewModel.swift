    //
    //  UserViewModel.swift
    //  TechSocialMediaApp
    //
    //  Created by Jestin Dorius on 6/23/25.
    //
import SwiftUI

@MainActor
@Observable
class UserViewModel {
    var user: User = User()
    var error: Error?
    var userProfile: UserProfile = UserProfile()
    var usersPosts: [Post] = []
    var allPosts: [Post] = []
    var gettingUserPosts = false
    var fetchingUser = false
    var fetchingUserProfile = false
    var isAuthenticated = false
    
    enum ViewModelErrors: Error {
        case getUserFailedInDo
        case getUserFailed
        case getUserProfileFailedInDo
        case getUserProfileFailed
    }
    
    private let authenticationController = AuthController()
    private let networkController = NetworkController()
    
        // Auth func
    func login(email: String, password: String) async throws -> User {
        fetchingUser = true
        defer {
            fetchingUser = false
        }
        do {
                // Get user first
            user = try await authenticationController.signIn(email: email, password: password)
            isAuthenticated = true
            return user
        }
    }
    
    func fetchUserProfile(userUUID: UUID, userSecret: UUID) async throws -> UserProfile {
        fetchingUserProfile = true
        defer {
            fetchingUserProfile = false
        }
        do {
            userProfile = try await networkController.getUserProfile(userUUID: userUUID, userSecret: userSecret)
            return userProfile
        } catch {
            print("Getting User Profile Failed: error \(error)")
            self.error = error
        }
        return userProfile
    }
    
    func getAllPosts(userSecret: UUID) async throws -> [Post] {
        do {
            allPosts = try await networkController.getFirstTwentyPosts(userSecret: userSecret)
            let secondArrayOfPosts = try await networkController.getSecondTwentyPosts(userSecret: userSecret)
            allPosts += secondArrayOfPosts
                //            allPosts.append(secondArrayOfPosts)
            return allPosts
        } catch {
            print("GETTING_USER_POSTS_FAILED: \(error)")
            self.error = error
        }
        return allPosts
    }
    
    func getUserPosts(userSecret: UUID, userID: UUID) async throws  {
        do {
            usersPosts = try await networkController.getUserPosts(userSecret: userSecret, userUUID: userID)
        } catch {
            print("GETTING_USER_POSTS_FAILED: \(error)")
        }
    }
    
    func createPost(secret: UUID, title: String, body: String) async throws {
        do {
            let data = try await networkController.createPost(userSecret: secret, title: title, body: body)
            print(data)
        } catch {
            print("CREATING_POST_FAILED: \(error)")
            self.error = error
        }
    }
    
    func deletePosts(at offsets: IndexSet) async {
            // 1. Extract postIDs to delete
        let postIDsToDelete = offsets.map { usersPosts[$0].postid }
        
            // 2. Remove locally first for instant UI update
        usersPosts.remove(atOffsets: offsets)
        
            // 3. Call API to delete remotely
        do {
            try await networkController.deletePost(userSecret: user.secret, postIDs: postIDsToDelete)
            print("POSTS_DELETED")
            print(usersPosts.count)
            try await getUserPosts(userSecret: user.secret, userID: userProfile.userUUID)
        } catch {
            print("DELETING_POSTS_FAILED: \(error)")
        }
    }
    
    func deleteAllPosts() async {
        let postIDs = usersPosts.map { $0.postid }
        for num in postIDs {
            usersPosts.removeAll(where: { $0.postid == num })
        }
        do {
            try await networkController.deletePost(userSecret: user.secret, postIDs: postIDs)
            print("POST_DELETED!!!")
        } catch {
            print("DELETING_POST_FAILED: \(error)")
        }
    }
    
    func editPost(secret: UUID, post: Post) async {
        do {
            try await networkController.editPost(userSecret: secret, post: post)
        } catch {
            print("EDITING_POST_FAILED \(error)")
        }
    }
    
    func editProfile(secret: UUID, userName: String, bio: String, techInterests: String) async {
        do {
            try await networkController.editProfile(
                secret: secret,
                userName: userName,
                bio: bio,
                techInterests: techInterests)
        } catch {
            print("EDITING_PROFILE_FAILED: \(error)")
        }
    }
    
    func getComments(secret: UUID, postid: Int) async -> [Comments] {
        var comments = [Comments]()
        do {
            comments = try await networkController
                .getComments(secret: secret, postid: postid)
            return comments
        } catch {
            print("GETTING_COMMENTS_FAILED: \(error)")
        }
        return comments
    }
}
