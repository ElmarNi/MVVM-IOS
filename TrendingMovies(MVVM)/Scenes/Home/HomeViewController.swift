//
//  HomeViewController.swift
//  TrendingMovies(MVVM)
//
//  Created by Elmar Ibrahimli on 09.04.24.
//

import UIKit

class HomeViewController: UIViewController {
    
    internal let tableView = UITableView()
    private let spinner = UIActivityIndicatorView()
    internal let viewModel = HomeViewModel()
    internal var cellDataSource = [MovieTableCellViewModel]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        setupTableView()
        setupUI()
        viewModel.data(urlSessionDelegate: self)
        bindViewModel()
        
    }
    
    private func setupUI() {
        view.addSubview(tableView)
        view.addSubview(spinner)
        spinner.center = view.center
        tableView.frame = view.bounds
    }
    
    private func bindViewModel() {
        
        viewModel.isLoading.bind { [weak self] isLoading in
            guard let isLoading = isLoading, let self = self else { return }
            DispatchQueue.main.async {
                isLoading ? self.spinner.startAnimating() : self.spinner.stopAnimating()
            }
        }
        
        viewModel.cellDataSource.bind { [weak self] movies in
            guard let movies = movies, let self = self else { return }
            DispatchQueue.main.async {
                self.cellDataSource = movies
                self.tableView.reloadData()
            }
        }
    }
}
