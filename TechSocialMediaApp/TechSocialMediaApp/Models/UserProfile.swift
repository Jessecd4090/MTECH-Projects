//
//  UserProfile.swift
//  TechSocialMediaApp
//
//  Created by Jestin Dorius on 6/27/25.
//
import SwiftUI


struct UserProfile: Decodable, Encodable {
    var userUUID: UUID
    var userName: String
    var firstName: String
    var lastName: String
    var bio: String?
    var techInterests: String?
    var posts: [Post]
    
    init() {
        self.userUUID = UUID()
        self.userName = ""
        self.firstName = ""
        self.lastName = ""
        self.posts = []
    }
    init(userUUID: UUID, userName: String, firstName: String, lastName: String, bio: String? = nil, techInterests: String? = nil, posts: [Post]) {
        self.userUUID = userUUID
        self.userName = userName
        self.firstName = firstName
        self.lastName = lastName
        self.posts = posts
    }
}
