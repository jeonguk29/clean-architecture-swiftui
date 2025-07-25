//
//  ContentView.swift
//  CleanArchitecture
//
//  Created by Mason Kim on 1/17/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var movies: [MovieEntity] = []
    private let repository: MovieRepositoryInterface
    
    init(repository: MovieRepositoryInterface) {
        self.repository = repository
    }
    
    var body: some View {
        ScrollView {
            VStack {
                ForEach(movies, id: \.id) { movie in
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
                let moviesEntities = try await repository.fetchMovies()
                self.movies = moviesEntities
                // repository.sortMoviesByTitle(movies)
            } catch {
                print(error)
            }
        }
    }
}


#Preview {
    ContentView(repository: MockMovieRepository())
}
