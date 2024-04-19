//
//  NetworkConstants.swift
//  TrendingMovies(MVVM)
//
//  Created by Elmar Ibrahimli on 15.04.24.
//

import Foundation

final class NetworkConstants {
    public static let shared = NetworkConstants()
    public var apiKey: String {
        get {
            return "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI4YWNhMDEwNmFlZThlY2U0ZDMwOThlNTcwNGQxZTJkMCIsInN1YiI6IjY1MTZkMGEzOTY3Y2M3MDBhY2I4NzJhZCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.oQF0cgq58KX3nIam3qWauiK4iaG3B6IwhyNQkv7fsAQ"
        }
    }
    public var baseUrl: String {
        get {
            return "https://api.themoviedb.org/3/"
        }
    }
    
    public var imageServerUrl: String {
        get {
            return "https://image.tmdb.org/t/p/w200/"
        }
    }
}
