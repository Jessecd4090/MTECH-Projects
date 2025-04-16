//
//  CreditCard.swift
//  Credit Card Processor
//
//  Created by Jestin Dorius on 4/9/25.
//
class CreditCard {
    var cardNum: Int
    var expireDate: Int
    var securityCode: Int
    
    
    init(cardNum: Int, expireDate: Int, securityCode: Int) {
        self.cardNum = cardNum
        self.expireDate = expireDate
        self.securityCode = securityCode
    }
}
