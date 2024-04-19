//
//  HomeViewController+TableView.swift
//  TrendingMovies(MVVM)
//
//  Created by Elmar Ibrahimli on 09.04.24.
//

import Foundation
import UIKit

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(MovieTableViewCell.self, forCellReuseIdentifier: MovieTableViewCell.identifier)
        tableView.separatorStyle = .none
        tableView.backgroundColor = .systemBackground
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfRowsInSection()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MovieTableViewCell.identifier, for: indexPath) as? MovieTableViewCell
        else {
            return UITableViewCell()
        }
        cell.configure(viewModel: cellDataSource[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        200
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let movieId = cellDataSource[indexPath.row].id
        let movie = viewModel.getMovie(movieId)
        
        guard let movie = movie else { return }
        DispatchQueue.main.async {[weak self] in
            self?.navigationController?.pushViewController(DetailViewController(viewModel: DetailsViewModel(movie: movie)), animated: true)
        }
    }
    
}
