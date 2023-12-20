//
//  ChangePasswordVC.swift
//  Cinemaify
//
//  Created by Enes Sancar on 20.12.2023.
//

import UIKit
import SnapKit

final class ChangePasswordVC: UIViewController {
    
    private let changePasswordView = ChangePasswordView()
    private let authVM: AuthViewModel? = AuthViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        view.backgroundColor = .systemBackground
        view.addSubview(changePasswordView)
        
        changePasswordView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        changePasswordView.delegate = self
    }
}

extension ChangePasswordVC: ChangePasswordViewDelegate {
    func resetButtonTapped() {
        guard let password = changePasswordView.passwordTextField.text,
              let repassword = changePasswordView.repasswordTextField.text else {
            
            presentAlert(title: "Alert!", message: "Email ? Password ? ", buttonTitle: "Ok")
            return
        }
        
        guard password.isValidPassword(password: password) else {
            guard password.count >= 6 else {
                presentAlert(title: "Alert", message: "Password must be at least 6 charachters", buttonTitle: "Ok")
                return
            }
            
            guard password.containsDigits(password) else {
                presentAlert(title: "Alert!", message: "Password must contain at least 1 digit", buttonTitle: "Ok")
                return
            }
            
            guard password.containsLowerCase(password) else {
                presentAlert(title: "Alert!", message: "Password must contain at least 1 lowercase character", buttonTitle: "Ok")
                return
            }
            
            guard password.containsUpperCase(password) else {
                presentAlert(title: "Alert!", message: "Password must contain at least 1 uppercase character", buttonTitle: "Ok")
                return
            }
            
            guard password == repassword else {
                presentAlert(title: "Alert!", message: "Password and repassword are not same", buttonTitle: "Ok")
                return
            }
            return
        }
        
        authVM?.changePassword(password: password, completion: { [weak self] success, error in
            guard let self else { return }
            
            if success {
                self.presentAlert(title: "Alert!", message: "Password change Successful 🥳", buttonTitle: "Ok")
                
                changePasswordView.passwordTextField.text = ""
                changePasswordView.repasswordTextField.text = ""
            } else {
                self.presentAlert(title: "Error!", message: error, buttonTitle: "Ok")
            }
        })
    }
}

#Preview {
    ChangePasswordVC()
}
