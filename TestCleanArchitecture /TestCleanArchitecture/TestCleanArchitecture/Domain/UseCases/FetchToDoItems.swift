//
//  FetchToDoItems.swift
//  TestCleanArchitecture
//
//  Created by 정정욱 on 7/5/24.
//

import Foundation

// interactor를 통해서 필수 기능을 구현
struct FetchToDoItems {
    let interactor: ToDoInteractor

    func execute() -> [ToDoItem] {
        return interactor.fetchToDoItems()
    }
}
