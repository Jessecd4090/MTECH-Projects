//
//  User.swift
//  Credit Card Processor
//
//  Created by Jestin Dorius on 4/9/25.
//

    //Single Responsibility
class User {
    var name: String
    var CC: CreditCard?
    
    init(name: String, CC: CreditCard? = nil) {
        self.name = name
        self.CC = CC
    }
}
