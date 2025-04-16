//
//  User.swift
//  SOLID(UserLogin)
//
//  Created by Jestin Dorius on 4/10/25.
//



class User: UpdatedUser {
    func saveUser(_ user: User) {
        print("User Saved")
    }
    
    var name: String
    var age: Int
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}
