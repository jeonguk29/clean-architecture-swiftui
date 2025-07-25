//
//  ContentView.swift
//  CleanArchitecture
//
//  Created by Mason Kim on 1/17/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var movies: [MovieEntity] = []
    private let repository = MovieRepository()
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
                let moviesDTOs = try await repository.fetchMovie()
                let moviesEntities = moviesDTOs.map { $0.toEntity() }
                self.movies = moviesEntities
                // repository.sortMoviesByTitle(movies)
            } catch {
                print(error)
            }
        }
    }
}


#Preview {
    ContentView()
}
