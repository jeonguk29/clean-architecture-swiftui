//
//  CleanArchitectureApp.swift
//  CleanArchitecture
//
//  Created by Mason Kim on 1/17/24.
//

import SwiftUI

@main
struct CleanArchitectureApp: App {
    
    let useCase: MovieUseCase = {
        let repository = MovieRepository()
        return MovieUseCase(repository: repository)
    }()
    
    var body: some Scene {
        WindowGroup {
            ContentView(
                useCase: useCase
            )
        }
    }
}
