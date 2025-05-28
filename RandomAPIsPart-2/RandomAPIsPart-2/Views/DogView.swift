//
//  DogView.swift
//  RandomAPIsPart-2
//
//  Created by Jestin Dorius on 5/17/25.
//

import SwiftUI

struct DogView: View {
    @State var dogData: DogData
    @State var dogPic: UIImage?
    @State var dogName = String()
    @State var dogs = [Dog]()
    @State var animationStarted = Bool()
    var body: some View {
        NavigationStack {
            VStack {
                
                Image(uiImage: (dogPic ?? UIImage(systemName: "person.slash.fill")!))
                    .resizable()
                    .scaleEffect(animationStarted ? 1.5 : 1)
                    .frame(height: 350)
                    .padding()
                
                TextField("Title", text: $dogName)
                    .frame(width: 300, height: 40)
                    .border(Color.cyan)
                
                Button {
                    getDog()
                    withAnimation(.spring(duration: 1)) {
                        animationStarted.toggle()
                    } completion: {
                        withAnimation(.spring(duration: 0.75)) {
                            animationStarted.toggle()
                        }
                        
                    }
                    if !dogName.isEmpty {
                        let dog = Dog(name: dogName, image: dogPic!)
                        dogs.append(dog)
                    }
                } label: {
                    Text("Save & Get New Dog")
                }
                .padding(75)
                
            }
            List {
                ForEach(self.$dogs, id: \.name) { dog in
                    DogListCell(dog: dog)
                }
            }
        }
    }
    
    func getDog() {
        Task {
            do {
                dogData = await DogNetwork.getDogFromAPI()
                let dogImageURL = dogData.image
                dogPic = await DogNetwork.getDogPic(url: dogImageURL)
                print(dogPic)
            }
        }
    }
}

#Preview {
    DogView(dogData: DogData(image: "TEST"))
}
