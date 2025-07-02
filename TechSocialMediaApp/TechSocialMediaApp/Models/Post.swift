//
//  Post.swift
//  TechSocialMediaApp
//
//  Created by Jestin Dorius on 6/27/25.
//
import SwiftUI

struct Post: Encodable, Decodable {
    var postid: Int
    var title: String
    var body: String
    var authorUserName: String
    var authorUserId: UUID
    var likes: Int
    var userLiked: Bool // If signed in user liked post
    var numComments: Int
    var createdDate: String
}
