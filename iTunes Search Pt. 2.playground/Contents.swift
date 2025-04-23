import Foundation
import PlaygroundSupport
PlaygroundPage.current.needsIndefiniteExecution = true



var components = URLComponents(string: "https://itunes.apple.com/search")!

components.queryItems = [
    "term": "Apple",
    "media": "ebook",
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

struct StoreItem: Codable {
    var name: String
    var artist: String
    var kind: String
    var artworkUrl: URL
    var description: String
    var longDescription: String
    
    enum CodingKeys: String, CodingKey {
        case name, artist, kind
        case artworkUrl
        case description
        case longDescription
    }
}


extension Data {
    func prettyPrintedJSONString() {
        guard let jsonObject = try? JSONSerialization.jsonObject(with: self, options: []),
              let jsonData = try? JSONSerialization.data(withJSONObject: jsonObject, options: [.prettyPrinted]),
              let prettyJSONString = String(data: jsonData, encoding: .utf8) else {
            print("Failed to read JSON Object")
            return
        }
        print(prettyJSONString)
    }
}

//enum StoreItemErrors: Error, LocalizedError {
//    case itemsNotFound
//    case invalidResponse
//}
//
//struct SearchResponse: Codable {
//    let results: [StoreItem]
//}
//
//struct StoreItem: Codable {
//    var trackName: String?
//    var collectionName: String?
//    var artistName: String?
//    var kind: String?
//    var description: String?
//    var longDescription: String?
//    var artworkURL: URL?
//    
//    enum CodingKeys: String, CodingKey {
//        case trackName
//        case collectionName
//        case artistName
//        case kind
//        case description
//        case longDescription
//        case artworkURL = "artworkUrl100"
//    }
//    
//    init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//        
//        trackName = try container.decodeIfPresent(String.self, forKey: .trackName)
//        collectionName = try container.decodeIfPresent(String.self, forKey: .collectionName)
//        artistName = try container.decodeIfPresent(String.self, forKey: .artistName)
//        kind = try container.decodeIfPresent(String.self, forKey: .kind)
//        description = try container.decodeIfPresent(String.self, forKey: .description)
//        longDescription = try container.decodeIfPresent(String.self, forKey: .longDescription)
//        artworkURL = try container.decodeIfPresent(URL.self, forKey: .artworkURL)
//    }
//}
//
//func fetchItems(matching query: [String: String]) async throws -> [StoreItem] {
//    var urlComponents = URLComponents(string: "https://itunes.apple.com/search")!
//    urlComponents.queryItems = query.map { URLQueryItem(name: $0.key, value: $0.value) }
//    
//    guard let url = urlComponents.url else { throw StoreItemErrors.itemsNotFound }
//    
//    let (data, response) = try await URLSession.shared.data(from: url)
//    
//    guard let httpResponse = response as? HTTPURLResponse,
//          httpResponse.statusCode == 200 else {
//        throw StoreItemErrors.invalidResponse
//    }
//    
//    let decoder = JSONDecoder()
//    let searchResponse = try decoder.decode(SearchResponse.self, from: data)
//    
//    return searchResponse.results
//}
//
//let query = [
//    "term": "1975",
//    "media": "music",
//    "attribute": "authorTerm",
//    "lang": "en_us",
//    "limit": "10"
//]
//
//Task {
//    do {
//        let storeItems = try await fetchItems(matching: query)
//        for item in storeItems {
//            print("""
//                Name: \(item.trackName ?? "N/A")
//                Artist: \(item.artistName ?? "N/A")
//                Kind: \(item.kind ?? "N/A")
//                Description: \(item.description ?? item.longDescription ?? "N/A")
//                Artwork URL: \(item.artworkURL?.absoluteString ?? "N/A")
//                --------------------------
//                """)
//        }
//    } catch {
//        print("Error occurred: \(error.localizedDescription)")
//        if let decodingError = error as? DecodingError {
//            print("Decoding error details: \(decodingError)")
//        }
//    }
//}
//
//

//


