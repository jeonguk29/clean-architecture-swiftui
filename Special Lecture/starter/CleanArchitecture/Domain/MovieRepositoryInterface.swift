//
//  MovieRepositoryInterface.swift
//  CleanArchitecture
//
//  Created by MAC on 7/25/25.
//

import Foundation

// 이건 interface를 통한 추상화라고 볼 수 있는 것임
protocol MovieRepositoryInterface {
    func fetchMovies() async throws -> [MovieEntity]
    // MovieDTO가 아니라 Entity로 해줌으로써 외부 Presentation, Data 레이어를 모르는 상태로 만들어야함
}
