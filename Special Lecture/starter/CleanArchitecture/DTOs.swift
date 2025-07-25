//
//  DTOs.swift
//  CleanArchitecture
//
//  Created by Mason Kim on 1/17/24.
//

import Foundation

// 특정 서버 API (yts) 의 응답 요구사항에 맞춰져 있는 DTO
// -> 이 중 하나의 필드라도 네이밍이 변경되거나 구성이 변경되면 앱이 동작하지 않음...
// 특정 서버에 종속적인 형태

struct BaseResponse<T: Decodable>: Decodable {
    let status: String
    let status_message: String
    let data: T
}

struct MovieDataDTO: Decodable {
    let movie_count, limit: Int
    let movies: [MovieDTO]
}

struct MovieDTO: Decodable {
    let id: Int
    let url: String
    let title: String
    let summary: String
    let background_image: String
    let medium_cover_image: String
    let rating: Double
    let year: Int
    var myRating: Float?
    let date_uploaded: String
}
