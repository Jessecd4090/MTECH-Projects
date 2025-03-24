//
//  ToDo.swift
//  ToDoList
//
//  Created by Jestin Dorius on 3/24/25.
//
import Foundation

struct ToDo: Equatable {
    let id = UUID()
    var title: String
    var isComplete: Bool
    var dueDate: Date
    var notes: String?
    
    static func ==(lhs: ToDo, rhs: ToDo) -> Bool {
        return lhs.id == rhs.id
    }
    
    static func loadToDos() -> [ToDo]? {
        return nil
    }
    
    static func sampleToDos() -> [ToDo] {
        return [
            ToDo(title: "First Note", isComplete: true,
                 dueDate: .now),
            ToDo(title: "SecondNote", isComplete: false, dueDate: Date())
        ]
    }
}
