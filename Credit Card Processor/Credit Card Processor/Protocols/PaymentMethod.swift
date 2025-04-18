//
//  PaymentMethod.swift
//  Credit Card Processor
//
//  Created by Jestin Dorius on 4/17/25.
//

//MARK: Open and Closed
// Example 1: PaymentMethod protocol (extendable)
protocol PaymentMethodProtocol {
    func process(amount: Double)
}


class PaymentMethod: PaymentMethodProtocol {
    func process(amount: Double) {
        return
    }
    
   
}




