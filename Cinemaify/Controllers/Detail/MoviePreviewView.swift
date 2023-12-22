//
//  MoviePreviewView.swift
//  Cinemaify
//
//  Created by Enes Sancar on 20.12.2023.
//

import UIKit
import SnapKit
import WebKit

final class MoviePreviewView: UIView {
    
    private var movies: Movie? = nil
    
    //MARK: - Properties
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: FontSize.subHeadline, weight: .bold)
        label.text = "Harry potter"
        return label
    }()
    
    private let overviewLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .regular)
        label.numberOfLines = 0
        label.text = "This is the best movie ever to watch as a kid!"
        return label
    }()
    
    private lazy var downloadButton = MovieButton(bgColor: .red,
                                                  color: .red,
                                                  title: "Download",
                                                  systemImageName: "arrow.down.circle.dotted",
                                                  cornerStyle: .small)
    
    private lazy var webView: WKWebView = {
        let webView = WKWebView()
        return webView
    }()
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.isScrollEnabled = true
        scrollView.showsVerticalScrollIndicator = true
        scrollView.showsHorizontalScrollIndicator = false
        return scrollView
    }()
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 25
        return stackView
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
        image.contentMode = .scaleAspectFit
        image.clipsToBounds = true
        image.tintColor = .label
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemBackground
        
        addSubviews(webView, scrollView)
        scrollView.addSubview(stackView)
        
        stackView.addArrangedSubviewsExt(titleLabel, dateStackView)
        dateStackView.addArrangedSubviewsExt(releaseDateImage, movieReleaseDate)
        stackView.addArrangedSubviewsExt(overviewLabel, downloadButton)
        
        configureConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func configureConstraints() {
        configureWebView()
        configureScrollView()
        configureStackView()
        configureTitleLabel()
        configureDateStackView()
        configureOverviewLabel()
        configureDownloadButton()
    }
    
    private func configureWebView() {
        webView.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(300)
        }
    }
    
    private func configureScrollView() {
        scrollView.snp.makeConstraints { make in
            make.top.equalTo(webView.snp.bottom).offset(10)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom)
        }
    }
    
    private func configureStackView() {
        stackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.width.equalTo(scrollView.snp.width)
        }
    }
    
    private func configureTitleLabel() {
        titleLabel.snp.makeConstraints { make in
            make.top.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview()
        }
    }
    
    private func configureDateStackView() {
        dateStackView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
        }
        
        releaseDateImage.snp.makeConstraints { make in
            make.width.height.equalTo(20)
        }
    }
    
    private func configureOverviewLabel() {
        overviewLabel.snp.makeConstraints { make in
            make.top.equalTo(dateStackView.snp.bottom).offset(25)
            make.leading.trailing.equalTo(dateStackView)
        }
    }
    
    private func configureDownloadButton() {
        downloadButton.snp.makeConstraints { make in
            make.top.equalTo(overviewLabel.snp.bottom).offset(25)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.height.equalTo(50)
        }
        
        let action = UIAction { [weak self] _ in
            guard let self else { return }
            self.didTapDownloadButton()
        }
        downloadButton.addAction(action, for: .touchUpInside)
    }
    
    private func didTapDownloadButton() {
        
    }
    
    public func configure(with model: MoviePreviewModel, movieModelIsFavori: Movie) {
        self.movies = movieModelIsFavori
        
        titleLabel.text = model.title
        overviewLabel.text = model.movieOverview
        movieReleaseDate.text = model.release_date
        
        guard let url = URL(string: "https://www.youtube.com/embed/\(model.youtubeView.id.videoId)") else {
            return
        }
        webView.load(URLRequest(url: url))
    }
}
