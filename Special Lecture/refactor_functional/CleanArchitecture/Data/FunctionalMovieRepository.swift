//
//  MovieRepository.swift
//  CleanArchitecture
//
//  Created by Mason Kim on 1/17/24.
//

import Foundation

/*
 MovieRepository는 구체적인 타입인데도 불구하고 다양성을 누릴 수가 있는 것임
 요런 방식이 TCA에서 하는 방식과 비슷함
 */
struct FunctionalMovieRepository {
    // 인터페이스 역할...
    var fetchMovies: () async throws -> [MovieEntity]
}

extension FunctionalMovieRepository {
    
    // 실제 역할을 하는 애들을 live라고 함
    static let live: FunctionalMovieRepository = FunctionalMovieRepository {
        let url = URL(string: "https://yts.mx/api/v2/list_movies.json")!
        let urlRequest = URLRequest(url: url)
        let (data, _) = try await URLSession.shared.data(for: urlRequest)
        let movieResponse = try JSONDecoder().decode(BaseResponse<MovieDataDTO>.self, from: data)
        return movieResponse.data.movies.map { $0.toEntity() }
    }

    // 가짜 역할 해주는 애들도 정의
    static let mock: FunctionalMovieRepository = FunctionalMovieRepository {
        (0...4).map {
            MovieEntity(id: $0, title: "movie_\($0)", imageURL: "https://picsum.photos/200/300", uploadedDate: Date())
        }
    }
}
