import Foundation
import PlaygroundSupport
PlaygroundPage.current.needsIndefiniteExecution = true

var greeting = "Hello, playground"


var components = URLComponents(string: "https://itunes.apple.com/search")!

components.queryItems = [
    "term": "1975",
    "media": "music",
    "limit": "4"
].map { URLQueryItem(name: $0.key, value: $0.value)}

let url = components.url!

Task {
    let (data, response) = try await URLSession.shared.data(from: url)
    
    if let httpResponse = response as? HTTPURLResponse,
       httpResponse.statusCode == 200,
       let dataString = String(data: data, encoding: .utf8) {
        print(dataString)
    }
}
