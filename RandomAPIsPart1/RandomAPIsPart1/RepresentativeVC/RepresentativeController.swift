//
//  RepresentativeController.swift
//  RandomAPIsPart1
//
//  Created by Jestin Dorius on 4/28/25.
//
import Foundation

struct RepresentativeController {
    static func getRep(zipcode: String) async -> [Representative] {
        var testReps = [Representative(name: "Test", party: "NA", link: "WWW")]
        do {
            // Set URL Components
            var urlComponents = URLComponents(string: "https://whoismyrepresentative.com/getall_mems.php")!
            urlComponents.queryItems = [
                URLQueryItem(name: "zip", value: "\(zipcode ?? "84660")"),
                URLQueryItem(name: "output", value: "json")]
            // Define URL
            let url = urlComponents.url!
            print(url)
            // Get data from URL
            let (data, _) = try await URLSession.shared.data(from: url)
            // Convert the data to some Codable object
//            print(String(data: data, encoding: .utf8))
            let reps = try JSONDecoder().decode(RepresentativeResults.self, from: data)

            print(reps.results)
            return reps.results
            
        } catch {
            print(error)
        }
        return testReps
    }
}
