//
//  ContentView.swift
//  CleanArchitecture
//
//  Created by Mason Kim on 1/17/24.
//

import SwiftUI

struct ContentView: View {

    @State private var movies: [MovieDTO] = []
    private let repository = MovieRepository()
    var body: some View {
        ScrollView {
            VStack {
                ForEach(movies, id: \.id) { movie in
                    HStack {
                        Text("\(movie.title)")

                        Text(movie.date_uploaded.date().string())
                            .font(.callout)
                    }

                    AsyncImage(url: URL(string: movie.background_image)!) { phase in
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
                let movies = try await repository.fetchMovie()
                self.movies = repository.sortMoviesByTitle(movies)
            } catch {
                print(error)
            }
        }
    }
}




#Preview {
    ContentView()
}
