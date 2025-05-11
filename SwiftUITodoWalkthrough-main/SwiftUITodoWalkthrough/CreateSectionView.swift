//
//  CreateSectionView.swift
//  SwiftUITodoWalkthrough
//
//  Created by Jestin Dorius on 5/11/25.
//

import SwiftUI

struct CreateSectionView: View {
    @Environment(\.dismiss) var dismiss
    
    @State var newToDoSection = ""
    @State var todoController: TodosController
    var body: some View {
        
        VStack {
            Text("New Section")
                .font(.largeTitle)
                .fontWeight(.thin)
                .padding(.top)
            Spacer()
            TextField("New Section", text: $newToDoSection)
                .padding()
                .background(RoundedRectangle(cornerRadius: 25).stroke(.gray, style: StrokeStyle(lineWidth: 0.5)))
                .frame(width: 275)
                .padding(300)
            Button {
                if !newToDoSection.isEmpty {
                    addSection(for: TodoSection(sectionTitle: newToDoSection, todos: []))
                    print(todoController.sections)
                    dismiss()
                }
            } label: {
                Text("Subit Section")
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity)
                    .padding(EdgeInsets(top: 15, leading: 0, bottom: 15, trailing: 0))
                    .background(RoundedRectangle(cornerSize: CGSize(width: 15, height: 15)))
            }
            .padding()
            
        }
    }
    func addSection(for sectionTitle: TodoSection?) {
        // Need to check if section already exists
        guard let sectionTitle else { return }
        if !todoController.sections.contains(sectionTitle) {
            todoController.sections.append(sectionTitle)
        }
//        if let sectionExsists = todoController.sections.firstIndex(where: { $0 == sectionTitle }) {
//            
//        } else {
//            todoController.sections.append(sectionTitle ?? TodoSection(sectionTitle: "TEST", todos: []))
//        }
//        if let sectionIndex = todoController.sections.firstIndex(where: { $0 == sectionTitle }) {
//            todoController.sections[sectionIndex].todos.append(Todo(markedComplete: false, title: toDoTitle))
//        }
    }
}

#Preview {
    CreateSectionView(todoController: TodosController())
}
