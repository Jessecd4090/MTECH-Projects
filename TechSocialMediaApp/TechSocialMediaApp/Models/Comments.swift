//
//  Comments.swift
//  TechSocialMediaApp
//
//  Created by Jestin Dorius on 7/8/25.
//


struct Comments: Encodable, Decodable {
    var commentId: Int
    var body: String
    var userName: String
    var userId: String
    var createdDate: String
}