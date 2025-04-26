//
//  DogController.swift
//  RandomAPIsPart1
//
//  Created by Jestin Dorius on 4/25/25.
//
import Foundation
import UIKit

struct DogNetworkController {
    static func getDogFromAPI() async -> Dog {
            do {
                //Define URL
                let url = URL(string: "https://dog.ceo/api/breeds/image/random")!
                //Get Data from URL
                let (data, _) = try await URLSession.shared.data(from: url)
                //Convert the data to some Codable object
                let dog = try JSONDecoder().decode(Dog.self, from: data)
                return dog
            } catch {
                print(error)
                fatalError()
        }
    }
}

//func getDogPicFromAPI(input: String) -> UIImage {
//    let url = URL(string: input)!
//    
//    Task {
//        let (data, response) = try await URLSession.shared.data(from: url)
//        
//        if let httpsResponse = response as? HTTPURLResponse, httpsResponse.statusCode == 200, let dataImage = UIImage(data: data) {
//            print(dataImage)
//            return dataImage
//        }
//      return
//    }
//    
//}
