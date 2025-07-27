//
//  ContentView.swift
//  CleanArchitecture
//
//  Created by Mason Kim on 1/17/24.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject private var viewModel: MovieListViewModel

    init(viewModel: MovieListViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        ScrollView {
            VStack {
                ForEach(viewModel.movies, id: \.id) { movie in
                    HStack {
                        Text("\(movie.title)")
                        
                        Text(movie.uploadedDate.string())
                            .font(.callout)
                    }
                    
                    AsyncImage(url: URL(string: movie.imageURL)!) { phase in
                        phase.image?
                            .resizable()
                            .frame(width: 100, height: 100)
                    }
                }
            }
        }
        .padding()
        .task {
            do {
                try await viewModel.fetchMovies()
            } catch {
                print(error)
            }
        }
    }
}

#Preview {
    ContentView(
        viewModel: .init(
            movieUseCase: .init(
                repository: MockMovieRepository()
            )
        )
    )
}
