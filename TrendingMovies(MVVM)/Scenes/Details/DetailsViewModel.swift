//
//  DetailsViewModel.swift
//  TrendingMovies(MVVM)
//
//  Created by Elmar Ibrahimli on 19.04.24.
//

import Foundation

final class DetailsViewModel {
    
    var title: String
    var description: String
    var imageUrl: String
    
    init(movie: Movie) {
        title = movie.title
        description = movie.overview
        imageUrl = movie.poster_path
    }
}
