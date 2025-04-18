//
//  PayPalProcessor.swift
//  Credit Card Processor
//
//  Created by Jestin Dorius on 4/17/25.
//

//MARK: Liskov Substitution
// Example 3: Add PayPal without changing existing code
class PayPal: PaymentMethod {
    override func process(amount: Double) { /* PayPal logic */ }
}
