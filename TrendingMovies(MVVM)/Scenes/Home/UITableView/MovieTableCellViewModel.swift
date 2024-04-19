//
//  MovieTableCellViewModel.swift
//  TrendingMovies(MVVM)
//
//  Created by Elmar Ibrahimli on 17.04.24.
//

import Foundation

final class MovieTableCellViewModel {
    var id: Int
    var title: String
    var date: String
    var rate: String
    var imageUrl: String
    
    init(movie: Movie) {
        id = movie.id
        title = movie.title
        date = movie.release_date
        rate = "\(movie.vote_average)/10"
        imageUrl = movie.poster_path
    }
}
