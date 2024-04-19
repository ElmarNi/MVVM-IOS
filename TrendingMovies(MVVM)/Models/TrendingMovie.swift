//
//  TrendingMovie.swift
//  TrendingMovies(MVVM)
//
//  Created by Elmar Ibrahimli on 15.04.24.
//

import Foundation

struct TrendingMovie: Codable {
    let page: Int
    let results: [Movie]
    let total_pages, total_results: Int
}


