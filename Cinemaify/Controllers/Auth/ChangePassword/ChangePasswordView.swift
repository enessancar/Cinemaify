//
//  ChangePasswordView.swift
//  Cinemaify
//
//  Created by Enes Sancar on 20.12.2023.
//

import UIKit
import SnapKit

protocol ChangePasswordViewDelegate: AnyObject {
    func resetButtonTapped()
}

final class ChangePasswordView: UIView {
    
    weak var delegate: ChangePasswordViewDelegate?
    
    //MARK: - Properties
    private let headLabel = TitleLabel(textAlignment: .left, fontSize: FontSize.subHeadline)
    
    let passwordTextField = CustomTextField(fieldType: .password)
    let repasswordTextField = CustomTextField(fieldType: .password)
    
    private let resetButton = MovieButton(bgColor: MovieColor.playButonBG, color: MovieColor.playButonBG, title: "Reset", fontSize: .big)
    
    //MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureHeadLabel()
        configureTextFields()
        configureResetButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func configureHeadLabel() {
        addSubview(headLabel)
        headLabel.text = "Reset Password"
        
        headLabel.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(10)
            make.leading.equalToSuperview().offset(20)
        }
    }
    
    private func configureTextFields() {
        addSubviews(passwordTextField, repasswordTextField)
        
        passwordTextField.placeholder = "New Password"
        repasswordTextField.placeholder = "Confirm Password"
        
        passwordTextField.snp.makeConstraints { make in
            make.top.equalTo(headLabel.snp.bottom).offset(30)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.height.equalTo(50)
        }
        
        repasswordTextField.snp.makeConstraints { make in
            make.top.equalTo(passwordTextField.snp.bottom).offset(20)
            make.leading.trailing.height.equalTo(passwordTextField)
        }
    }
    
    private func configureResetButton() {
        addSubview(resetButton)
        resetButton.configuration?.cornerStyle = .capsule
        
        resetButton.snp.makeConstraints { make in
            make.top.equalTo(repasswordTextField.snp.bottom).offset(20)
            make.leading.trailing.height.equalTo(passwordTextField)
        }
        
        let action = UIAction { [weak self] _ in
            guard let self else { return }
            self.didTapResetButton()
        }
        resetButton.addAction(action, for: .touchUpInside)
    }
    
    private func didTapResetButton() {
        delegate?.resetButtonTapped()
    }
}
