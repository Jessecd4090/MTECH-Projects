//
//  DogListCell.swift
//  RandomAPIsPart-2
//
//  Created by Jestin Dorius on 5/28/25.
//

import Foundation
import SwiftUI

struct DogListCell: View {
    @Binding var dog: Dog
    var body: some View {
        
        HStack {
            Image(uiImage: dog.image)
                .resizable()
                .frame(width: 60, height: 60)
                .scaledToFit()
            NavigationLink {
                DogDetail(dog: $dog)
            } label: {
                Text(dog.name)
            }
        }
    }
}


struct DogListCell_Previews: PreviewProvider {
    static var previews: some View {
        DogListCell(dog: .constant(Dog(name: "TEST", image: UIImage(systemName: "person")!))).previewLayout(.sizeThatFits)
    }
}
