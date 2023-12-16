//
//  ProfileUIView.swift
//  Cinemaify
//
//  Created by Enes Sancar on 16.12.2023.
//

import UIKit
import SnapKit

final class ProfileUIView: UIView {
    
    //MARK: - Properties
    lazy var containerImage: UIView = {
        let container = UIView()
        container.layer.cornerRadius = 60
        container.layer.shadowColor = UIColor.label.cgColor
        container.layer.shadowOffset = CGSize(width: 0, height: 0)
        container.layer.shadowOpacity = 0.9
        container.layer.shadowRadius = 8
        return container
    }()
    
    lazy var userImage: UIImageView = {
        let imageView = UIImageView()
        let config = UIImage.SymbolConfiguration(weight: .ultraLight)
        imageView.image = UIImage(systemName: "person.circle", withConfiguration: config)
        imageView.backgroundColor = .systemBackground
        imageView.tintColor = .lightGray
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 60
        return imageView
    }()
    
    lazy var userAddImageIcon: UIImageView = {
        let imageView = UIImageView()
        let config = UIImage.SymbolConfiguration(weight: .bold)
        imageView.image = UIImage(systemName: "pencil.circle.fill", withConfiguration: config)
        imageView.tintColor = MovieColor.playButonBG
        return imageView
    }()
    
    lazy var userName: UILabel = {
        let label = UILabel()
        label.text = "Enes Sancar"
        label.font = .systemFont(ofSize: FontSize.subHeadline)
        label.textColor = .label
        return label
    }()
    
    lazy var userMesage: UILabel = {
        let label = UILabel()
        label.text = "Tekrardan Hoşgeldin Enes"
        label.font = UIFont.systemFont(ofSize: FontSize.body)
        label.textColor = .secondaryLabel
        label.numberOfLines = .zero
        return label
    }()
    
    //MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews(containerImage, userAddImageIcon, userName, userMesage)
        containerImage.addSubview(userImage)
        configureContainerImage()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func configureContainerImage() {
        containerImage.snp.makeConstraints { make in
            make.width.height.equalTo(120)
            make.leading.equalToSuperview().offset(20)
            make.centerY.equalToSuperview()
        }
    }
    
    private func configureImage() {
        userImage.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        userAddImageIcon.snp.makeConstraints { make in
            make.bottom.equalTo(userImage.snp.bottom).offset(-5)
            make.trailing.equalTo(userImage.snp.trailing).offset(-5)
            make.width.height.equalTo(30)
        }
    }
    
    private func configureLabel() {
        userName.snp.makeConstraints { make in
            make.top.equalTo(userImage.snp.top).offset(20)
            make.leading.equalTo(userImage.snp.trailing).offset(20)
        }
        
        userMesage.snp.makeConstraints { make in
            userMesage.snp.makeConstraints { make in
                make.top.equalTo(userName.snp.bottom).offset(10)
                make.leading.equalTo(userImage.snp.trailing).offset(20)
                make.trailing.equalToSuperview()
            }
        }
    }
}
