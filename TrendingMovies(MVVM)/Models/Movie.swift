//
//  Movie.swift
//  TrendingMovies(MVVM)
//
//  Created by Elmar Ibrahimli on 15.04.24.
//

import Foundation

struct Movie: Codable {
    let backdrop_path: String
    let id, vote_count: Int
    let original_title, overview, poster_path, release_date: String
    let media_type: MediaType
    let adult: Bool
    let title: String
    let genre_ids: [Int]
    let popularity: Double
    let video: Bool
    let vote_average: Double
}
