//
//  CreditCardProcessor.swift
//  Credit Card Processor
//
//  Created by Jestin Dorius on 4/17/25.
//

//MARK: Liskov Substitution
// Subclass 1: Works interchangeably
class CreditCard: PaymentMethod {
    override func process(amount: Double) { /* Credit card logic */ }
}

// Subclass 2: Works interchangeably
class DebitCard: PaymentMethod {
    override func process(amount: Double) { /* Debit card logic */ }
}

