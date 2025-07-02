//
//  User.swift
//  techSocialMediaApp
//
//  Created by Brayden Lemke on 10/25/22.
//

import Foundation

// Network Call object
struct User: Decodable, Encodable {
    var firstName: String
    var lastName: String
    var email: String
    var userUUID: UUID
    var secret: UUID
    var userName: String
    
    init(firstName: String, lastName: String, email: String, userUUID: UUID, secret: UUID, userName: String) {
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
        self.userUUID = userUUID
        self.secret = secret
        self.userName = userName
    }
    init() {
        self.firstName = ""
        self.lastName = ""
        self.email = ""
        self.userUUID = UUID()
        self.secret = UUID()
        self.userName = ""
    }
}




