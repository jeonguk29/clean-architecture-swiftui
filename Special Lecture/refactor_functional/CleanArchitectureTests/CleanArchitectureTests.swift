//
//  CleanArchitectureTests.swift
//  CleanArchitectureTests
//
//  Created by Mason Kim on 1/17/24.
//

import XCTest
@testable import CleanArchitecture

final class CleanArchitectureTests: XCTestCase {

    var repository: FunctionalMovieRepository = .mock
    var viewModel: MovieListViewModel!

    override func tearDownWithError() throws {
        viewModel = nil
    }

    func test_빈_결과값인_경우() {
        repository.fetchMovies = { return [] }

        viewModel = MovieListViewModel(movieUseCase: .init(repository: repository))
    }

    func test_Repository가_에러를_밷는_경우() {
        repository.fetchMovies = {
            throw NSError.init(domain: "BlahBlah", code: 404)
        }

        viewModel = MovieListViewModel(movieUseCase: .init(repository: repository))

        XCTAssertEqual(viewModel.errorMessage, "에러 발생 위용위용")
    }
}
