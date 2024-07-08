//
//  ToDoListViewModel.swift
//  TestCleanArchitecture
//
//  Created by 정정욱 on 7/5/24.
//

import Foundation
import Combine

// Presentation 레이어에 ViewModel을 사용하여 클린 아키텍처의 각 레이어를 연결

class ToDoListViewModel: ObservableObject {
    @Published var toDoItems: [ToDoItem] = [] // toDoItems라는 목록이 변경될 때마다 앱에게 그 변경된 내용을 알려주는 역할
    // 변경사항을 추적하여 View를 다시 그림

    private let fetchToDoItemsUseCase: FetchToDoItems
    /*
     fetchToDoItemsUseCase: 이 변수는 할 일 목록을 가져오는 역할을 담당해요.
     이 변수는 FetchToDoItems라는 작업을 실행할 수 있는 데요, 그 작업은 ToDoInteractor라는 도우미를 통해 실제로 데이터를 가져올 거예요.
     Interactor => Repositories =>
     */

    init() {
        let repository = LocalToDoRepository() //  Data/Repositories/LocalToDoRepository
        let interactor = ToDoInteractor(repository: repository) // Domain/Interactors/ToDoInteractor : 도메인 걔층의 인터렉터를 사용하여 Data계층의 Repositories를 연결
        self.fetchToDoItemsUseCase = FetchToDoItems(interactor: interactor) // Domain/UseCases/FetchToDoItems : 도메인 계층의 유즈케이스와 ViewModel을 연결하여 View를 제어
    }

    func fetchToDoItems() {
        self.toDoItems = fetchToDoItemsUseCase.execute() // 도메인 계층의 UseCase의 기능을 호출 하여 상태값을 변경하여 View를 변경
    }
}
