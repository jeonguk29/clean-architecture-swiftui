//
//  MovieListViewModel.swift
//  CleanArchitecture
//
//  Created by MAC on 7/27/25.
//

import Foundation

// ObservableObject로 관찰 가능하게 만들어주고 외부에서 수정을 못하게 private으로 값 선언
final class MovieListViewModel: ObservableObject {
    @Published private(set) var movies: [PresentingMovieModel] = []
    private let movieUseCase: MovieUseCase

    init(movieUseCase: MovieUseCase) {
        self.movieUseCase = movieUseCase
    }

    func fetchMovies() async throws {
        do {
            let movieEntities = try await movieUseCase.fetchMovies()
            let presentingMovies = movieEntities.map {
                // 화면에 나타내기 위한 어떤 처리.
                PresentingMovieModel(
                    id: $0.id,
                    title: $0.title,
                    imageURL: URL (
                        string: $0.imageURL
                    ),
                    dateString: "오늘의 날짜 \($0.uploadedDate.string())"
                )
            }

            self.movies = presentingMovies
        } catch {
            print(error)
        }
    }
}
