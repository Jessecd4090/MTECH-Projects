//
//  TodosController.swift
//  SwiftUITodoWalkthrough
//
//  Created by Jestin Dorius on 5/9/25.
//

import Foundation

class TodosController: ObservableObject {
    @Published var sections: [TodoSection]
    
    init() {
        self.sections = TodoSection.dummySections
    }
}
