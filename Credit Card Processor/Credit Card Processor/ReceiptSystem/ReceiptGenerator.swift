//
//  ReceiptGenerator.swift
//  Credit Card Processor
//
//  Created by Jestin Dorius on 4/17/25.
//

//MARK: Interface Segregation Principle
protocol ReceiptGenerator {
    func generateReceipt() -> Receipt
}
