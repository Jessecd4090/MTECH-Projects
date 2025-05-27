//
//  Dog.swift
//  RandomAPIsPart-2
//
//  Created by Jestin Dorius on 5/17/25.
//
import Foundation
import UIKit

struct Dog: Codable {
    var image: String // really a URL
    
    enum CodingKeys: String, CodingKey {
        case image = "message"
    }
    
}

struct DogNetwork {
    static func getDogFromAPI() async -> Dog {
        do {
            // Define the URL
            let url = URL(string: "https://dog.ceo/api/breeds/image/random")!
            // Get data from URL
            let (data, _) = try await URLSession.shared.data(from: url)
            // Convert Data to some Codable object
            let dog = try JSONDecoder().decode(Dog.self, from: data)
            return dog
        } catch {
            print(error)
        }
        return Dog(image: "DogRetrieveFailed")
    }
    
    static func getDogPic(url: String) async -> UIImage {
        do {
            // Define URL
            let url = URL(string: url)!
            // Get data from URL
            let (data, _) = try await URLSession.shared.data(from: url)
            // Convert data into some Codable Object
            guard let dogImage = UIImage(data: data) else { return UIImage() }
            return dogImage
        } catch {
            print(error)
        }
        print("Getting Dog Image Failed")
        return UIImage(systemName: "person.slash")!
    }
}
