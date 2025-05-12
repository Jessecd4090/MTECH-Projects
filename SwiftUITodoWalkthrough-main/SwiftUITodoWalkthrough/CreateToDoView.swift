//
//  CreateToDoView.swift
//  SwiftUITodoWalkthrough
//
//  Created by Jestin Dorius on 5/9/25.
//

import SwiftUI

struct CreateToDoView: View {
    @Environment(\.dismiss) var dismiss
    
    @State var newToDoText = ""
    @State var selectedSection: TodoSection
    @ObservedObject var todosController: TodosController
    
    init(todoController: TodosController) {
        self._todosController = ObservedObject(wrappedValue: todoController)
        self._selectedSection = State(initialValue: todoController.sections[0])
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("Create New ToDo")
                    .font(.largeTitle)
                    .fontWeight(.thin)
                    .padding(.top)
                Spacer()
                HStack {
                    TextField("ToDo", text: $newToDoText)
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 15).stroke(.gray, style: StrokeStyle(lineWidth: 0.2)))
                        .padding()
                    Picker("For Section", selection: $selectedSection) {
                        ForEach(todosController.sections, id: \.self) { section in
                            Text(section.sectionTitle)
                        }
                    }
                    .padding(.trailing)
                }
                Spacer()
                VStack {
                    NavigationLink {
                        CreateSectionView(todoController: todosController)
                    } label: {
                        Text("Create New Section")
                    }
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity)
                    .padding(EdgeInsets(top: 15, leading: 0, bottom: 15, trailing: 0))
                    .background(RoundedRectangle(cornerSize: CGSize(width: 15, height: 15)))
                }
                Button {
                    if !newToDoText.isEmpty {
                        // Add new View
                        addNewToDo(newToDoText, for: selectedSection)
                        // Dismiss View
                        dismiss()
                    }
                } label: {
                    Text("Create New ToDo")
                        .foregroundStyle(.white)
                        .frame(maxWidth: .infinity)
                        .padding(EdgeInsets(top: 15, leading: 0, bottom: 15, trailing: 0))
                        .background(RoundedRectangle(cornerSize: CGSize(width: 15, height: 15)))
                }
                Button {
                    //Dismiss the View
                    dismiss()
                } label: {
                    Text("Cancel")
                        .foregroundStyle(.red)
                        .frame(maxWidth: .infinity)
                        .padding(EdgeInsets(top: 15, leading: 0, bottom: 15, trailing: 0))
                        .background(RoundedRectangle(cornerSize: CGSize(width: 15, height: 15)).stroke(.red))
                }
            }
            .padding()
        }
    }
    
    
    func addNewToDo(_ toDoTitle: String, for sectionTitle: TodoSection?) {
        if let sectionIndex = todosController.sections.firstIndex(where: { $0 == sectionTitle }) {
            todosController.sections[sectionIndex].todos.append(Todo(markedComplete: false, title: toDoTitle))
        }
    }
}


struct CreateToDoView_Previews: PreviewProvider {
    static var previews: some View {
        CreateToDoView(todoController: TodosController())
    }
}

#Preview {
    CreateToDoView(todoController: TodosController())
}
