//
//  MovieRepository.swift
//  CleanArchitecture
//
//  Created by MAC on 7/25/25.
//

import Foundation

final class MovieRepository {
    func fetchMovie() async throws -> [MovieDTO] {
        let url = URL(string: "https://yts.mx/api/v2/list_movies.json")!
        let (data, _) = try await URLSession.shared.data(from: url)
        let movieResponse = try JSONDecoder().decode(BaseResponse<MovieDataDTO>.self, from: data)
        return movieResponse.data.movies
    }

    func sortMoviesByTitle(_ movies: [MovieDTO]) -> [MovieDTO] {
        movies.sorted { $0.title < $1.title }
    }
}
