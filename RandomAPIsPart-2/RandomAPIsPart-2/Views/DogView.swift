//
//  DogView.swift
//  RandomAPIsPart-2
//
//  Created by Jestin Dorius on 5/17/25.
//

import SwiftUI

struct DogView: View {
    @State var dog: Dog
    @State var dogPic: UIImage?
    var body: some View {
        NavigationStack {
            VStack {
                Image(systemName: "x.circle")
                    .resizable()
                    .scaledToFit()
                
                Button {
                    getDog()
                } label: {
                    Text("Get New Dog")
                }
                .padding(75)
                
            }
            .navigationTitle("Get New Dog")
        }
        
    }
    func getDog() {
        Task {
            do {
                dog = await DogNetwork.getDogFromAPI()
                let dogImageURL = dog.image
                dogPic = await DogNetwork.getDogPic(url: dogImageURL)
                print(dogPic)
            }
        }
    }
//    func getDogPic(url: String) async -> UIImage {
//        do {
//            // Define URL
//            let url = URL(string: url)!
//            // Get Data from URL
//            let (data, _) = try await URLSession.shared.data(from: url)
//            // Convert the data to some codable object
//            guard let dogImage = UIImage(data: data) else { return UIImage(systemName: "person.fill")! }
//            return dogImage
//        } catch {
//            print(error)
//        }
//        return UIImage()
//    }
}

#Preview {
    DogView(dog: Dog(image: "TEST"))
}
