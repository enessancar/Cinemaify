//
//  MovieTableViewCell.swift
//  Cinemaify
//
//  Created by Enes Sancar on 17.12.2023.
//

import UIKit
import SnapKit
import Kingfisher

final class MovieTableViewCell: UITableViewCell {
    static let identifier = "MovieTableViewCell"
    
    //MARK: - Properties
    private lazy var containerView: UIView = {
        let container = UIView()
        container.backgroundColor = .secondarySystemBackground
        container.layer.cornerRadius = 15
        container.layer.shadowColor = UIColor.label.cgColor
        container.layer.shadowOffset = CGSize(width: 0, height: 0)
        container.layer.shadowOpacity = 0.6
        container.layer.shadowRadius = 4
        container.layer.masksToBounds = false
        return container
    }()
    
    private lazy var titleStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 8
        stackView.alignment = .center
        return stackView
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.lineBreakMode = .byTruncatingTail
        label.numberOfLines = 1
        return label
    }()
    
    private let playTitleButton: UIButton = {
        let button = UIButton()
        let image = UIImage(systemName: "play.circle", withConfiguration: UIImage.SymbolConfiguration(pointSize: 35))
        button.setImage(image, for: .normal)
        button.tintColor = .label
        return button
    }()
    
    lazy var titlePosterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.image = .hero
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 15
        return imageView
    }()
    
    private lazy var dateStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 8
        stackView.alignment = .center
        return stackView
    }()
    
    lazy var movieReleaseDate: UILabel = {
        let label = UILabel()
        label.text = "2023-07-07"
        label.font = .systemFont(ofSize: FontSize.body, weight: .medium)
        label.textColor = .secondaryLabel
        return label
    }()
    
    private lazy var releaseDateImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "calendar.badge.clock")
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.tintColor = .label
        return image
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
        label.text = "6.6"
        label.textColor = .label
        label.font = .systemFont(ofSize: FontSize.body, weight: .bold)
        return label
    }()
    
    lazy var imdbImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.tintColor = MovieColor.goldColor
        imageView.image = UIImage(systemName: "star.fill")
        return imageView
    }()
    
    //MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .secondarySystemBackground
        selectionStyle = .none
        contentView.addSubview(containerView)
        
        containerView.addSubviews(
            titlePosterImageView, titleStackView, dateStackView, imdbStackView
        )
        
        titleStackView.addArrangedSubviewsExt(titleLabel, playTitleButton)
        dateStackView.addArrangedSubviewsExt(releaseDateImage, movieReleaseDate)
        imdbStackView.addArrangedSubviewsExt(imdbLabel, imdbImage)
        
        setupContainerView()
        setupTitlePosterImageView()
        setupTitleStackView()
        setupDateStackView()
        setupImdbStackView()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func setupContainerView() {
        containerView.snp.makeConstraints { make in
            make.leading.equalTo(contentView.snp.leading).offset(10)
            make.trailing.equalTo(contentView.snp.trailing).offset(-10)
            make.bottom.equalTo(contentView.snp.bottom).offset(-10)
            make.top.equalTo(contentView.snp.top).offset(10)
        }
    }
    
    private func setupTitlePosterImageView() {
        titlePosterImageView.snp.makeConstraints { make in
            make.top.leading.equalToSuperview()
            make.bottom.equalToSuperview()
            make.width.equalTo(100)
        }
    }
    
    private func setupTitleStackView() {
        titleStackView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20)
            make.leading.equalTo(titlePosterImageView.snp.trailing).offset(10)
            make.trailing.equalToSuperview().offset(-10)
        }
        
        playTitleButton.snp.makeConstraints { make in
            make.width.height.equalTo(35)
        }
    }
    
    private func setupDateStackView() {
        dateStackView.snp.makeConstraints { make in
            make.leading.equalTo(titlePosterImageView.snp.trailing).offset(10)
            make.bottom.equalToSuperview().offset(-10)
        }
    }
    
    private func setupImdbStackView() {
        imdbStackView.snp.makeConstraints { make in
            make.bottom.trailing.equalToSuperview().offset(-10)
        }
    }
    
    func configure(with model: MovieCellModel) {
        
        guard let url = URL(string: "https://image.tmdb.org/t/p/w500/\(model.posterURL)") else {
            return
        }
        
        titlePosterImageView.kf.setImage(with: url)
        titleLabel.text = model.titleName
        movieReleaseDate.text = model.release_date
        
        if let vote_average = model.vote_average {
            let formattedValue = String(format: "%.1f", vote_average)
            self.imdbLabel.text = formattedValue
        }
    }
}
