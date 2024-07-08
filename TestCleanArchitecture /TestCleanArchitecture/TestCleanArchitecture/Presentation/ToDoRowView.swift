//
//  ToDoRowView.swift
//  TestCleanArchitecture
//
//  Created by 정정욱 on 7/5/24.
//

import SwiftUI

struct ToDoRowView: View {
    let item: ToDoItem

    var body: some View {
        Text(item.title)
    }
}
