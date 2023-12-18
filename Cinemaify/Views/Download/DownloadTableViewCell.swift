//
//  DownloadTableViewCell.swift
//  Cinemaify
//
//  Created by Enes Sancar on 18.12.2023.
//

import UIKit
import SnapKit

final class DownloadTableViewCell: UITableViewCell {
    
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
    
    lazy var movieImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.image = .hero
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 15
        return imageView
    }()
    
    lazy var movieName: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: FontSize.subHeadline, weight: .bold)
        label.textColor = .label
        return label
    }()
    
    lazy var movieOverview: UILabel = {
        let label = UILabel()
        label.text = "Celebrated sleuth Hercule Poirot, now retired and living in self-imposed exile in Venice, reluctantly attends a Halloween séance at a decaying,"
        label.font = .systemFont(ofSize: FontSize.body, weight: .medium)
        label.numberOfLines = 2
        label.textColor = .label
        return label
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
        label.textColor = .label
        label.font = .systemFont(ofSize: FontSize.body, weight: .bold)
        return label
    }()
    
    private lazy var imdbImageView: UIImageView = {
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
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        containerView.layer.shadowColor = UIColor.label.cgColor
    }
    
    private func configureUI() {
        contentView.addSubview(containerView)
        containerView.addSubviews(movieName,movieImage,movieOverview,dateStackView,imdbStackView)
        
        dateStackView.addArrangedSubviewsExt(releaseDateImage, movieReleaseDate)
        imdbStackView.addArrangedSubviewsExt(imdbLabel, imdbImageView)
        
        configureContainerView()
        configureMovieImage()
        configureMovieName()
        configureMovieOverview()
        configureDateStackView()
        configureImdbStackView()
    }
    
    private func configureContainerView(){
        containerView.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top).offset(10)
            make.leading.equalTo(contentView.snp.leading).offset(10)
            make.trailing.equalTo(contentView.snp.trailing).offset(-10)
            make.bottom.equalTo(contentView.snp.bottom).offset(-10)
        }
    }
    
    private func configureMovieImage() {
        movieImage.snp.makeConstraints { make in
            make.top.leading.bottom.equalToSuperview()
            make.width.equalTo(100)
        }
    }
    
    private func configureMovieName() {
        movieName.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(18)
            make.leading.equalTo(movieImage.snp.trailing).offset(10)
            make.trailing.equalTo(imdbImageView.snp.leading).offset(-10)
        }
    }
    
    private func configureMovieOverview() {
        movieOverview.snp.makeConstraints { make in
            make.top.equalTo(movieName.snp.bottom).offset(10)
            make.leading.equalTo(movieImage.snp.trailing).offset(10)
            make.trailing.equalToSuperview().offset(-10)
        }
    }
    
    private func configureDateStackView() {
        dateStackView.snp.makeConstraints { make in
            make.top.equalTo(movieOverview.snp.bottom).offset(10)
            make.leading.equalTo(movieImage.snp.trailing).offset(10)
            make.bottom.equalToSuperview().offset(-4)
            
        }
    }
    
    private func configureImdbStackView(){
        imdbStackView.snp.makeConstraints { make in
            make.top.equalTo(movieOverview.snp.bottom).offset(10)
            make.bottom.equalToSuperview().offset(-4)
            make.trailing.equalToSuperview().offset(-10)
        }
    }
}
