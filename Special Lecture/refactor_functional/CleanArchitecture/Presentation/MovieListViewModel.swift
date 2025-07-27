//
//  MovieListViewModel.swift
//  CleanArchitecture
//
//  Created by Mason Kim on 1/17/24.
//

import Foundation

final class MovieListViewModel: ObservableObject {
    @Published private(set) var movies: [PresentingMovie] = []
    @Published private(set) var errorMessage: String = ""
    private let movieUseCase: MovieUseCase

    init(movieUseCase: MovieUseCase) {
        self.movieUseCase = movieUseCase
    }

    func fetchMovies() async throws {
        do {
            let movieEntities = try await movieUseCase.fetchMovies()
            let presentingMovies = movieEntities.map {
                // 화면에 나타내기 위한 어떤 처리.
                PresentingMovie(id: $0.id, title: $0.title, imageURL: URL(string: $0.imageURL), dateString: $0.uploadedDate.string())
            }

            self.movies = presentingMovies
        } catch {
            self.errorMessage = "에러 발생 위용위용"
            print(error)
        }
    }
}
