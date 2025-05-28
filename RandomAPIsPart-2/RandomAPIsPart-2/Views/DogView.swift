//
//  DogView.swift
//  RandomAPIsPart-2
//
//  Created by Jestin Dorius on 5/17/25.
//

import SwiftUI

struct DogView: View {
    
    @State var dogPic = UIImage()
    @State var dogName = String()
    @State var dogs = [Dog]()
    @State var animationToggle = Bool()
    
    var body: some View {
        NavigationStack {
            
            VStack {
                Image(uiImage: (dogPic))
                    .resizable()
                    .frame(height: 350)
                    .scaleEffect(animationToggle ? 1.5 : 1)
                    .padding()
                
                TextField("Title", text: $dogName)
                    .frame(width: 250, height: 40)
                    .border(Color.cyan)
                
                Button {
                    getDog()
                    withAnimation(.spring(duration: 1)) {
                        animationToggle.toggle()
                    } completion: {
                        withAnimation(.spring(duration: 0.75)) {
                            animationToggle.toggle()
                        }
                    }
                    // Checks to make sure name and pic has value
                    if !dogName.isEmpty && dogPic != UIImage() {
                        let dog = Dog(name: dogName, image: dogPic)
                        dogs.append(dog)
                    }
                } label: {
                    Text("Save & Get New Dog")
                }
                /* Not sure which element this is on, but it
                 allows me to pull a dog pic on open
                 */
                .onAppear(perform: getDog)
                .padding(50)
            }
            
            List {
                // Make sure to make the data identifiable for easy listing
                ForEach(self.$dogs) { dog in
                    DogListCell(dog: dog)
                }
            }
        }
    }
    
    // API Call
    func getDog() {
        Task {
            do {
                let dogData = await DogNetwork.getDogFromAPI()
                let dogImageURL = dogData.image
                dogPic = await DogNetwork.getDogPic(url: dogImageURL)
                print(dogPic)
            }
        }
    }
}

#Preview {
    DogView()
}
