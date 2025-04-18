//
//  Logger.swift
//  Credit Card Processor
//
//  Created by Jestin Dorius on 4/18/25.
//

//MARK: Interface Segregation Principle
protocol Validatable { func validate() }
protocol Refundable { func refund() }


// Example 3: Logging separated from processing
protocol Logger {
    func log(message: String)
}
