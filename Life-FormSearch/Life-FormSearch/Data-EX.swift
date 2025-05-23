//
//  Data-EX.swift
//  Life-FormSearch
//
//  Created by Jestin Dorius on 4/21/25.
//

import Foundation
extension Data {
    func prettyPrintedJSONString() {
        guard let jsonObject = try? JSONSerialization.jsonObject(with: self, options: []),
              let jsonData = try? JSONSerialization.data(withJSONObject: jsonObject, options: [.prettyPrinted]),
              let prettyJSONString = String(data: jsonData, encoding: .utf8)
        else { print("Failed to read JSON Object")
            return }
        print(prettyJSONString)
    }
}
