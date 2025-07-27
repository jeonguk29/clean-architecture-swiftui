//
//  MovieUseCase.swift
//  CleanArchitecture
//
//  Created by MAC on 7/27/25.
//

import Foundation

final class MovieUseCase {
    let repository: MovieRepositoryInterface

    init(repository: MovieRepositoryInterface) {
        self.repository = repository
    }

    func fetchMovies()  async throws -> [MovieEntity] {
        let movies = try await repository.fetchMovies()  // 더더욱 이제 Presentation에서 Data영역을 모르게 됨
        return sortMoviesByTitle(movies)
    }

    private func sortMoviesByTitle(_ movies: [MovieEntity]) -> [MovieEntity] {
        movies.sorted { $0.title < $1.title }
    }
}
