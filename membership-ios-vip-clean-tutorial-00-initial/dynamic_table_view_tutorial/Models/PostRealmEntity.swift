//
//  PostRealmEntity.swift
//  dynamic_table_view_tutorial
//
//  Created by 정정욱 on 7/11/24.
//  Copyright © 2024 Tuentuenna. All rights reserved.

//Entity는 서버에서 들어온 데이터, 실제 저장 데이터
import Foundation
import RealmSwift

// https://www.mongodb.com/docs/realm/sdk/swift/quick-start/#define-your-object-model
class PostRealmEntity: Object {
    @Persisted(primaryKey: true) var _id: ObjectId
    @Persisted var title: String?
    @Persisted var content: String?
    @Persisted var createdAt: Date
    @Persisted var updatedAt: Date
    
    convenience init(title: String?, content: String?) {
        self.init()
        self.title = title
        self.content = content
        self.createdAt = Date()
        self.updatedAt = Date()
    }
}
