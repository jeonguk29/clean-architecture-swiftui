//
//  MovieUseCase.swift
//  CleanArchitecture
//
//  Created by Mason Kim on 1/17/24.
//

import Foundation

final class MovieUseCase {
    let repository: FunctionalMovieRepository //는 구체적인 타입임(구조체) 다형성의 이점을 누릴 수가 있는 것임

    init(repository: FunctionalMovieRepository) {
        self.repository = repository
    }

    func fetchMovies() async throws -> [MovieEntity] {
        let movies = try await repository.fetchMovies() 
        return sortMoviesByTitle(movies)
    }

    private func sortMoviesByTitle(_ movies: [MovieEntity]) -> [MovieEntity] {
        movies.sorted { $0.title < $1.title }
    }
}
