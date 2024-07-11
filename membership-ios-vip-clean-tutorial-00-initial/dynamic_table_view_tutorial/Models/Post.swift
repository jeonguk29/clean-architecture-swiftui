//
//  Post.swift
//  dynamic_table_view_tutorial
//
//  Created by 정정욱 on 7/8/24.
//  Copyright © 2024 Tuentuenna. All rights reserved.
//

import Foundation

struct Post {
    var id : String = UUID().uuidString
    let title: String
    let content: String
    
    init(title: String, content: String) {
        self.title = title
        self.content = content
    }
    
    // entity를 하나 넣으면 Post 라는 데이터가 하나 나오는걸 만든 것임
    init(_ entity: PostRealmEntity) {
        self.id = entity._id.stringValue
        self.title = entity.title ?? ""
        self.content = entity.content ?? ""
    }
}
