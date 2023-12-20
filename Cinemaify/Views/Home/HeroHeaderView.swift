//
//  HeroHeaderView.swift
//  Cinemaify
//
//  Created by Enes Sancar on 15.12.2023.
//

import UIKit
import SnapKit
import Kingfisher

protocol HeroHeaderViewProtocol: AnyObject {
    func showDetail(movie: Movie)
}

final class HeroHeaderView: UIView {
    
    weak var delegate: HeroHeaderViewProtocol?
    var movie: Movie?
    
    //MARK: - Properties
    private lazy var movieName: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.font = .systemFont(ofSize: FontSize.headline, weight: .bold)
        return label
    }()
    
    private lazy var imdbStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 8
        stackView.alignment = .center
        return stackView
    }()
    
    lazy var imdbLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.font = .systemFont(ofSize: FontSize.headline, weight: .bold)
        return label
    }()
    
    private lazy var imdbImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.tintColor = MovieColor.goldColor
        imageView.image = UIImage(systemName: "star.fill")
        return imageView
    }()
    
    private lazy var playButton = MovieButton(bgColor: MovieColor.playButonBG,
                                         color:  MovieColor.playButonBG,
                                             title: "Play",
                                             systemImageName: "arrowtriangle.right.fill",
                                             cornerStyle: .small)
    
    private lazy var downloadButton = MovieButton(bgColor: .systemRed,
                                             color:  .systemRed,
                                             title: "Download",
                                             systemImageName: "arrow.down.to.line",
                                             cornerStyle: .small)
    
    private lazy var heroImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = .hero
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(heroImageView)
        
        addSubviews(playButton, downloadButton, movieName, imdbStackView)
        imdbStackView.addArrangedSubviewsExt(imdbLabel, imdbImageView)
        
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func configureUI() {
        configurePlayButton()
        configureDownloadButton()
        configureMovieName()
        configureStackView()
    }
    
    private func configurePlayButton() {
        playButton.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.bottom.equalToSuperview().offset(-30)
            make.width.equalTo(120)
            make.height.equalTo(46)
        }
        
        let action = UIAction { [weak self] _ in
            guard let self else { return }
            self.playButtonTapped()
        }
        playButton.addAction(action, for: .touchUpInside)
    }
    
    private func configureDownloadButton() {
        downloadButton.snp.makeConstraints { make in
            make.leading.equalTo(playButton.snp.trailing).offset(20)
            make.width.height.bottom.equalTo(playButton)
        }
    }
    
    private func configureMovieName() {
        movieName.snp.makeConstraints { make in
            make.leading.equalTo(playButton.snp.leading)
            make.bottom.equalTo(playButton.snp.top).offset(-20)
        }
    }
    
    private func configureStackView() {
        imdbStackView.snp.makeConstraints { make in
            make.leading.equalTo(movieName.snp.leading)
            make.bottom.equalTo(movieName.snp.top).offset(-10)
        }
    }
    
    private func playButtonTapped() {
        DispatchQueue.main.async {
            self.delegate?.showDetail(movie: self.movie!)
        }
    }
    
    func configure(with model: Movie) {
        movie = model
        
        guard let url = URL(string: "https://image.tmdb.org/t/p/w500/\(String(describing: model.poster_path))") else {
            return
        }
        heroImageView.kf.setImage(with: url)
        
        if let voteAverage = model.vote_average {
            let formattedValue = String(format: "%.1f", voteAverage)
            DispatchQueue.main.async {
                self.imdbLabel.text = formattedValue
                self.movieName.text = model.original_title ?? model.original_name
            }
        }
    }
}
