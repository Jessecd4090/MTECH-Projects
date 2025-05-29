//
//  DogView.swift
//  RandomAPIsPart-2
//
//  Created by Jestin Dorius on 5/17/25.
//

import SwiftUI

struct DogView: View {
    
    @State private var viewModel = DogViewModel()
    
    var body: some View {
        NavigationStack {
            
            VStack {
                Image(uiImage: (viewModel.dogPic))
                    .resizable()
                    .frame(height: 350)
                    .scaleEffect(viewModel.animationToggle ? 1.5 : 1)
                    .padding()
                
                TextField("Title", text: $viewModel.dogName)
                    .frame(width: 250, height: 40)
                    .border(Color.cyan)
                
                Button {
                    viewModel.getDog()
                    withAnimation(.spring(duration: 1)) {
                        viewModel.animationToggle.toggle()
                    } completion: {
                        withAnimation(.spring(duration: 0.75)) {
                            viewModel.animationToggle.toggle()
                        }
                    }
                    // Checks to make sure name and pic has value
                    if !viewModel.dogName.isEmpty && viewModel.dogPic != UIImage() {
                        let dog = Dog(name: viewModel.dogName, image: viewModel.dogPic)
                        viewModel.dogs.append(dog)
                    }
                } label: {
                    Text("Save & Get New Dog")
                }
                /* Not sure which element this is on, but it
                 allows me to pull a dog pic on open
                 */
                .onAppear(perform: viewModel.getDog)
                .padding(50)
            }
            
            List {
                // Make sure to make the data identifiable for easy listing
                ForEach($viewModel.dogs) { dog in
                    DogListCell(dog: dog)
                }
            }
        }
    }
    
    
}

#Preview {
    DogView()
}
