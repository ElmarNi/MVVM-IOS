//
//  MovieTableViewCell.swift
//  TrendingMovies(MVVM)
//
//  Created by Elmar Ibrahimli on 17.04.24.
//

import UIKit
import SnapKit
import SDWebImage

class MovieTableViewCell: UITableViewCell {
    static let identifier = "MovieTableViewCell"
    private let mainView = UIView()
    
    private let mainImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 16, weight: .bold)
        return label
    }()
    
    private let dateLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12)
        return label
    }()
    
    private let rateLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12, weight: .bold)
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        separatorInset = .zero
        layoutMargins = .zero

        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        
        mainView.round()
        mainView.border(color: .lightGray, width: 1)
        mainView.backgroundColor = .lightGray.withAlphaComponent(0.2)
        mainImageView.round(8)
        
        mainView.addSubview(mainImageView)
        mainView.addSubview(titleLabel)
        mainView.addSubview(dateLabel)
        mainView.addSubview(rateLabel)
        addSubview(mainView)
        
        mainView.snp.makeConstraints({$0.edges.equalToSuperview().inset(8)})
        mainImageView.backgroundColor = .red
        mainImageView.snp.makeConstraints { make in
            make.left.top.equalToSuperview().offset(8)
            make.bottom.equalToSuperview().offset(-8)
            make.width.equalTo(120)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(12)
            make.left.equalTo(mainImageView.snp.right).offset(8)
            make.right.equalToSuperview().offset(-12)
        }
        
        rateLabel.snp.makeConstraints { make in
            make.left.equalTo(mainImageView.snp.right).offset(8)
            make.right.bottom.equalToSuperview().offset(-12)
        }
        
        dateLabel.snp.makeConstraints { make in
            make.left.equalTo(mainImageView.snp.right).offset(8)
            make.right.equalToSuperview().offset(-12)
            make.bottom.equalTo(rateLabel.snp.top).offset(-8)
        }
        
    }
    
    func configure(viewModel: MovieTableCellViewModel) {
        titleLabel.text = viewModel.title
        dateLabel.text = viewModel.date
        rateLabel.text = viewModel.rate
        mainImageView.sd_setImage(with: URL(string: NetworkConstants.shared.imageServerUrl + viewModel.imageUrl))
    }

}

