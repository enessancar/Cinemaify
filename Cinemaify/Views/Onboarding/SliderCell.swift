//
//  SliderCell.swift
//  Cinemaify
//
//  Created by Enes Sancar on 15.12.2023.
//

import UIKit
import SnapKit
import Lottie

final class SliderCell: UICollectionViewCell {
    
    //MARK: - Properties
    private lazy var lottieView: LottieAnimationView = {
        let lottieView = LottieAnimationView()
        lottieView.loopMode = .loop
        lottieView.contentMode = .scaleAspectFit
        return lottieView
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = MovieColor.playButonBG
        label.numberOfLines = .zero
        label.font = .systemFont(ofSize: FontSize.subHeadline, weight: .black)
        return label
    }()
    
    lazy var textLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .white
        label.numberOfLines = .zero
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureLottieView()
        configureTitleLabel()
        configureTextLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func configureLottieView() {
        contentView.addSubview(lottieView)
        
        lottieView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(140)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(300)
        }
    }
    
    private func configureTitleLabel() {
        contentView.addSubview(titleLabel)
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(lottieView.snp.bottom).offset(40)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
        }
    }
    
    private func configureTextLabel() {
        contentView.addSubview(textLabel)
        
        textLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(30)
            make.leading.trailing.equalTo(titleLabel)
        }
    }
    
    func animationSetup(animationName: String) {
        lottieView.animation = LottieAnimation.named(animationName)
        lottieView.play()
    }
}
