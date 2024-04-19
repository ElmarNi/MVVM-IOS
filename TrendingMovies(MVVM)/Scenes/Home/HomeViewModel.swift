//
//  HomeViewModel.swift
//  TrendingMovies(MVVM)
//
//  Created by Elmar Ibrahimli on 09.04.24.
//

import Foundation

final class HomeViewModel {
    
    var isLoading: Observable<Bool> = Observable(false)
    var cellDataSource: Observable<[MovieTableCellViewModel]> = Observable(nil)
    var dataSource: TrendingMovie?
    
    func numberOfRowsInSection() -> Int {
        dataSource?.results.count ?? 0
    }
    
    func data(urlSessionDelegate: URLSessionDelegate) {
        if let isLoading = isLoading.value, isLoading {
            return
        }
        isLoading.value = true
        APICaller.request(endpoint: "trending/movie/day", type: TrendingMovie.self, urlSessionDelegate: urlSessionDelegate) {[weak self] result in
            self?.isLoading.value = false
            switch result {
            case let .success(data):
                self?.dataSource = data
                self?.mapCellData()
            case let .failure(error):
                print(error)
            }
        }
    }
    private func mapCellData() {
        cellDataSource.value = dataSource?.results.compactMap({ MovieTableCellViewModel(movie: $0)})
    }
    func getMovie(_ id: Int) -> Movie? {
        dataSource?.results.first { $0.id == id }
    }
}
