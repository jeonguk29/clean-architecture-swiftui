//
//  PresentingMovie.swift
//  CleanArchitecture
//
//  Created by MAC on 7/27/25.
//

import Foundation

struct PresentingMovieModel: Identifiable {
    let id: Int
    let title: String
    let imageURL: URL?
    let dateString: String
}
