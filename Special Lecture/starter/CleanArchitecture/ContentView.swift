//
//  ContentView.swift
//  CleanArchitecture
//
//  Created by Mason Kim on 1/17/24.
//

import SwiftUI

struct ContentView: View {

    @State private var movies: [MovieDTO] = []

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
                let movies = try await fetchMovie()
                self.movies = sortMoviesByTitle(movies)
            } catch {
                print(error)
            }
        }
    }
    
    
    //🤓 앱의 복잡도가 올라간다면 어떤 문제 발생?
    // 일단은 뷰가 네트워킹 하는 코드를 가지고 있는 것이 문제 (뷰의 종속적임, 재사용, 테스킹도 불가)
    // 뷰가 movies: [MovieDTO] 에 의존하고 있어서 이 형태가 변경되면 뷰의 구성도 같이 변경 되어야함
    private func fetchMovie() async throws -> [MovieDTO] {
        let url = URL(string: "https://yts.mx/api/v2/list_movies.json")!
        let (data, _) = try await URLSession.shared.data(from: url)
        let movieResponse = try JSONDecoder().decode(BaseResponse<MovieDataDTO>.self, from: data)
        return movieResponse.data.movies
    }

    private func sortMoviesByTitle(_ movies: [MovieDTO]) -> [MovieDTO] {
        movies.sorted { $0.title < $1.title }
    }
}




#Preview {
    ContentView()
}
