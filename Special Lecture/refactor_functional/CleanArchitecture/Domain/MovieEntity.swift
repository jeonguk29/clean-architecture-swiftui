//
//  MovieEntity.swift
//  CleanArchitecture
//
//  Created by Mason Kim on 1/17/24.
//

import Foundation

// 앱에서 가장 핵심이 되는 엔터티. 가장 변하지 않는 중심이 되는 객체.
struct MovieEntity {
    let id: Int
    let title: String
    let imageURL: String
    let uploadedDate: Date
}
