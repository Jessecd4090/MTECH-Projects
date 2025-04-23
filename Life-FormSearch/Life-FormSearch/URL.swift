//
//  URL.swift
//  Life-FormSearch
//
//  Created by Jestin Dorius on 4/21/25.
//

import Foundation

var URLcomponents = URLComponents(string: "https://eol.org/api/search/1.0.json")!

URLcomponents.queryItems = [
    "q": "Yellow",
    "page": "1"
].map { URLQueryItem(name: $0.key, value: $0.value)}

let url = URLcomponents.url!

Task {
    let (data, response) = try await URLSession.shared.data(from: url)
    
    if let httpResponse = response as HTTPURLResponse,
       httpResponse.statusCode == 200,
       let dataString = String(data: data, encoding: .utf8) {
        print(dataString)
    }
}
