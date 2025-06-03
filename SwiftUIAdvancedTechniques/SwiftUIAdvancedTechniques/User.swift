//
//  User.swift
//  SwiftUIAdvancedTechniques
//
//  Created by Jestin Dorius on 6/2/25.
//

import Foundation
@Observable
class UserTest {
    var savedUsers = User.savedUsers
}
struct User: Identifiable {
    var id: UUID = UUID()
    var username: String
    var password: String
    
    static var savedUsers = [User(username: "TEST@TEST.com", password: "TEST123")]
}
