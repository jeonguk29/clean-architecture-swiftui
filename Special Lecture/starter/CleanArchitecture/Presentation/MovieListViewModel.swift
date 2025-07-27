//
//  MovieListViewModel.swift
//  CleanArchitecture
//
//  Created by MAC on 7/27/25.
//

import Foundation

// ObservableObject로 관찰 가능하게 만들어주고 외부에서 수정을 못하게 private으로 값 선언
final class MovieListViewModel: ObservableObject {
    @Published private(set) var movies: [MovieEntity] = []
    private let movieUseCase: MovieUseCase

    init(movieUseCase: MovieUseCase) {
        self.movieUseCase = movieUseCase
    }

    func fetchMovies() async throws {
        do {
            self.movies = try await movieUseCase.fetchMovies()
        } catch {
            print(error)
        }
    }
}
