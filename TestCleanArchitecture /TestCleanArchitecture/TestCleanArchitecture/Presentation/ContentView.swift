//
//  ContentView.swift
//  TestCleanArchitecture
//
//  Created by 정정욱 on 7/5/24.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: ToDoListViewModel
    
    var body: some View {
        NavigationView {
            ToDoListView(items: viewModel.toDoItems)
                .navigationBarTitle("To-Do List")
        }
        .onAppear {
            viewModel.fetchToDoItems()
        }
    }
}

#Preview {
    ContentView(viewModel: ToDoListViewModel())
}
