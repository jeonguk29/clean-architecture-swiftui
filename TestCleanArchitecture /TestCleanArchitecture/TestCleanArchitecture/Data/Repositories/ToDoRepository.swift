//
//  ToDoRepository.swift
//  TestCleanArchitecture
//
//  Created by 정정욱 on 7/5/24.
//

import Foundation

protocol ToDoRepository {
    func fetchToDoItems() -> [ToDoItem]
}

class LocalToDoRepository: ToDoRepository {
    func fetchToDoItems() -> [ToDoItem] {
        return [
            ToDoItem(id: UUID(), title: "Buy groceries"),
            ToDoItem(id: UUID(), title: "Walk the dog"),
            ToDoItem(id: UUID(), title: "Read a book")
        ]
    }
}
