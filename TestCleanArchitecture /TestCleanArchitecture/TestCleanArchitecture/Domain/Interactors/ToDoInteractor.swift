//
//  ToDoInteractor.swift
//  TestCleanArchitecture
//
//  Created by 정정욱 on 7/5/24.
//

import Foundation

// 도메인 레이어와 데이터 레이어 간의 중재자 역할
class ToDoInteractor {
    let repository: ToDoRepository // 데이터 레이어와 연결

    init(repository: ToDoRepository) {
        self.repository = repository
    }

    func fetchToDoItems() -> [ToDoItem] {
        return repository.fetchToDoItems() // 실제 데이터 레이어에서 값을 호출
    }
}
