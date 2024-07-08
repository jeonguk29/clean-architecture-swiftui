//
//  TestCleanArchitectureApp.swift
//  TestCleanArchitecture
//
//  Created by 정정욱 on 7/5/24.
//

import SwiftUI

@main
struct TestCleanArchitectureApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: ToDoListViewModel()) // 뷰모델을 외부에서 주입 
        }
    }
}
