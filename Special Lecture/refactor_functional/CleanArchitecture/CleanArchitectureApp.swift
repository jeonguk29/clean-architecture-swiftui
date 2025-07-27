//
//  CleanArchitectureApp.swift
//  CleanArchitecture
//
//  Created by Mason Kim on 1/17/24.
//

import SwiftUI

@main
struct CleanArchitectureApp: App {

    var movieListViewModel: MovieListViewModel {
        let repository = FunctionalMovieRepository.live
        let useCase = MovieUseCase(repository: repository)
        return MovieListViewModel(movieUseCase: useCase)
    }

    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: movieListViewModel)
        }
    }
}
