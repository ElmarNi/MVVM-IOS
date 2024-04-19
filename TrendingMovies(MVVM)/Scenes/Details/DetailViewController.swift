//
//  DetailViewController.swift
//  TrendingMovies(MVVM)
//
//  Created by Elmar Ibrahimli on 19.04.24.
//

import UIKit
import SnapKit
import SDWebImage

class DetailViewController: UIViewController {

    private var viewModel: DetailsViewModel
    private let mainImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.textAlignment = .center
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 14)
        return label
    }()
    
    init(viewModel: DetailsViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupUI()
        configure()
    }

    private func setupUI() {
        view.addSubview(mainImageView)
        view.addSubview(titleLabel)
        view.addSubview(descriptionLabel)
        
        mainImageView.backgroundColor = .red
        
        mainImageView.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(8)
            make.height.equalTo(200)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
            make.top.equalTo(mainImageView.snp.bottom).offset(8)
        }
        
        descriptionLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
            make.top.equalTo(titleLabel.snp.bottom).offset(8)
        }
    }
    
    private func configure() {
        titleLabel.text = viewModel.title
        descriptionLabel.text = viewModel.description
        mainImageView.sd_setImage(with: URL(string: NetworkConstants.shared.imageServerUrl + viewModel.imageUrl))
    }
}
