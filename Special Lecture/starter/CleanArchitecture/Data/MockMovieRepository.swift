//
//  MockMovieRepository.swift
//  CleanArchitecture
//
//  Created by MAC on 7/25/25.
//

import Foundation

// 테스팅을 위해 가짜 정보를 반환 하도록 채택해서 만들면 됨
final class MockMovieRepository: MovieRepositoryInterface {
    func fetchMovies() async throws -> [MovieEntity] {
        (0...4).map {
            MovieEntity(id: $0, title: "movie_\($0)", imageURL: "https://picsum.photos/200/300", uploadedDate: Date())
        }
    }
}
