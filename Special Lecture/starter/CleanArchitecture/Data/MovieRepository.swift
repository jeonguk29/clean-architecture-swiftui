//
//  MovieRepository.swift
//  CleanArchitecture
//
//  Created by MAC on 7/25/25.
//

import Foundation

// 채택함으로 MovieEntity를 강제로 반환하게 되니까 ContentView는 이제 데이터에 대해서 전혀 모르는 상태가 된다고 볼 수 있음
final class MovieRepository: MovieRepositoryInterface {
    func fetchMovies() async throws -> [MovieEntity] {
        let url = URL(string: "https://yts.mx/api/v2/list_movies.json")!
        let urlRequest = URLRequest(url: url)
        let (data, _) = try await URLSession.shared.data(for: urlRequest)
        let movieResponse = try JSONDecoder().decode(BaseResponse<MovieDataDTO>.self, from: data)
        return movieResponse.data.movies.map { $0.toEntity() }
    }
    
    func sortMoviesByTitle(_ movies: [MovieDTO]) -> [MovieDTO] {
        movies.sorted { $0.title < $1.title }
    }
}
