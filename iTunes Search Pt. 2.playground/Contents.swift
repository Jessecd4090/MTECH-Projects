import Foundation
import PlaygroundSupport
//PlaygroundPage.current.needsIndefiniteExecution = true

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

enum StoreItemError: Error, LocalizedError {
    case itemsNotFound
    case invalidResponse
}

let query = [
    "term": "Apple",
    "media": "ebook",
    "attribute": "authorTerm",
    "lang": "en_us",
    "limit": "5"
]

func fetchItems(matching query: [String: String]) async throws -> [StoreItem] {
    
    var urlComponents = URLComponents(string: "https://itunes.apple.com/search")!
    urlComponents.queryItems = query.map { URLQueryItem(name: $0.key, value: $0.value)}
        //this limit is broken? 3 pulls 3, 4 pulls 5, 20 pulls 24
//    guard let url = urlComponents.url else { return [] }
    let (data, response) = try await URLSession.shared.data(from: urlComponents.url!)
    
    guard let httpResponse = response as? HTTPURLResponse,
            httpResponse.statusCode == 200 else { throw StoreItemError.itemsNotFound }
    
    let decoder = JSONDecoder()
    let searchResponse = try decoder.decode(SearchResponse.self, from: data)
    
    return [] // searchResponse.results
}




Task {
    do {
        let storeItems = try await fetchItems(matching: query)
        storeItems.forEach { item in
            print("""
                Name: \(item.name)
                Artist: \(item.artist)
                Kind: \(item.kind)
                Artwork URL: \(item.artworkUrl)
                
                """)
        }
    } catch {
        print(error)
    }
//    let (data, response) = try await URLSession.shared.data(from: url)
//    if let httpResponse = response as? HTTPURLResponse,
//       httpResponse.statusCode == 200,
//       let dataString = String(data: data, encoding: .utf8) {
//        data.prettyPrintedJSONString()
////        print(dataString)
//    }
}




struct StoreItem: Codable {
    var name: String = ""
    var artist: String = ""
    var kind: String = ""
    var artworkUrl: String = "" // Really a URL
//    var description: String?
//    var longDescription: String?
    
    enum CodingKeys: String, CodingKey {
        //
        case name = "trackName"
        //
        case kind = ""
        //
        case artist = "artistName"
        //
        case artworkUrl = "artworkUrl100"
        //
//        case description
//        case longDescription
    }
    
    init(from decoder: any Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        print(values)
        name = try values.decodeIfPresent(String.self, forKey: .name) ?? ""
        artist = try values.decodeIfPresent(String.self, forKey: .artist) ?? ""
        kind = try values.decodeIfPresent(String.self, forKey: .kind) ?? ""
        artworkUrl = try values.decodeIfPresent(String.self, forKey: .artworkUrl) ?? ""
//        description = try? values.decode(String.self, forKey: .description)
//        description = try values.decode(String.self, forKey: .description)
//        longDescription = try? values.decodeIfPresent(String.self, forKey: .longDescription)
//        longDescription = try values.decode(String.self, forKey: .longDescription)
    }
}

struct SearchResponse: Codable {
    let results: [StoreItem]
}
