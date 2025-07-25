//
//  MovieEntity.swift
//  CleanArchitecture
//
//  Created by MAC on 7/25/25.
//

import Foundation

// 앱에서 가장 핵심이 되는 엔터티. 가장 변하지 않는 중심이 되는 객체. (앱에서 필요로 하는 것만 정의)
struct MovieEntity {
    let id: Int
    let title: String
    let imageURL: String
    let uploadedDate: Date
}
