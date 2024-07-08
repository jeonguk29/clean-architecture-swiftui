//
//  ToDoListView.swift
//  TestCleanArchitecture
//
//  Created by 정정욱 on 7/5/24.
//

import SwiftUI

struct ToDoListView: View {
    let items: [ToDoItem]

    var body: some View {
        List(items) { item in
            ToDoRowView(item: item)
        }
    }
}
