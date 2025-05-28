//
//  DogDetail.swift
//  RandomAPIsPart-2
//
//  Created by Jestin Dorius on 5/28/25.
//

import SwiftUI

struct DogDetail: View {
    @Environment(\.dismiss) var dismiss
    @Binding var dog: Dog
    var body: some View {
        VStack {
            Text("Name:")
                .font(.title)
            
            Text(dog.name)
            
            Image(uiImage: dog.image)
                .resizable()
                .scaledToFit()
            
            TextField("Edit Dog Name", text: $dog.name)
                .frame(width: 300, height: 30)
                .border(Color.gray)
                .padding()
            
            Button {
                dismiss()
            } label: {
                Text("Save Edited Name")
            }
        }
    }
}

#Preview {
    DogDetail(dog: .constant(Dog(name: "TEST", image: UIImage(systemName: "person.slash.fill")!)))
}
