//
//  TodoView.swift
//  SwiftUITodoWalkthrough
//
//  Created by Brayden Lemke on 10/2/23.
//

import SwiftUI

struct TodoView: View {
    @StateObject var todoController = TodosController()
    
    var body: some View {
        NavigationStack {
            VStack {
                HStack{
                    Text("Todos").font(.title)
                        .padding(.leading, 25)
                    Spacer()
                    NavigationLink {
                        CreateToDoView(todoController: todoController)
                    } label: {
                        Image(systemName: "plus")
                            .padding(.trailing, 25)
                            .font(.title.weight(.thin))
                    }
                }
                .padding()
                .frame(height: 40)
                
                List {
                    ForEach($todoController.sections) { $section in
                        Section(section.sectionTitle) {
                            ForEach($section.todos) { $todo in
                                TodoRowView(todo: $todo)
                            }
                            .onDelete { offsets in
                                deleteToDos(at: offsets, from: section)
                            }
                        }
                    }
                }.listStyle(.inset)
            }.toolbar(.hidden)
        }
    }
    
    func deleteToDos(at offsets: IndexSet, from section: TodoSection) {
        // Delete ToDo
        if let index = todoController.sections.firstIndex(of: section) {
            todoController.sections[index].todos.remove(atOffsets: offsets)
        }
    }
}

struct TodoView_Previews: PreviewProvider {
    static var previews: some View {
        TodoView()
    }
}
