//
//  MovieCollectionViewCell.swift
//  Cinemaify
//
//  Created by Enes Sancar on 21.12.2023.
//

import UIKit
import SnapKit
import Kingfisher

final class MovieCollectionViewCell: UICollectionViewCell {
    static let identifier = "MovieCollectionViewCell"
    
    //MARK: - Properties
    private lazy var posterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private lazy var imdbButton = MovieButton(bgColor: .red,
                                              color: MovieColor.playButonBG,
                                              title: "",
                                              cornerStyle: .capsule)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func configureUI() {
        contentView.addSubview(posterImageView)
        posterImageView.addSubview(imdbButton)
        
        posterImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        imdbButton.snp.makeConstraints { make in
            make.top.equalTo(posterImageView.snp.top).offset(8)
            make.trailing.equalTo(posterImageView.snp.trailing).offset(-8)
            make.width.equalTo(50)
            make.height.equalTo(25)
        }
    }
    
    func configure(with model: Movie) {
        guard let posterPath = model.poster_path else {
            return
        }
        guard let url = URL(string: "https://image.tmdb.org/t/p/w500/\(posterPath)") else {
            return
        }
        posterImageView.kf.setImage(with: url)
        
        if let voteAverage = model.vote_average {
            let formattedValue = String(format: "%.1f", voteAverage)
            imdbButton.setTitle(formattedValue, for: .normal)
        }
    }
}
