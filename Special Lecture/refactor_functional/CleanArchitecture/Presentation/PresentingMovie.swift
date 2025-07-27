//
//  PresentingMovie.swift
//  CleanArchitecture
//
//  Created by Mason Kim on 1/17/24.
//

import Foundation

struct PresentingMovie: Identifiable {
    let id: Int
    let title: String
    let imageURL: URL?
    let dateString: String
}
