//
//  UIViewController+Ext.swift
//  Cinemaify
//
//  Created by Enes Sancar on 16.12.2023.
//

import UIKit

extension UIViewController {
    
    func presentAlert(title: String, message: String, buttonTitle: String) {
        let alertVC = AlertVC(title: title, message: message, buttonTitle: buttonTitle)
        alertVC.modalTransitionStyle = .crossDissolve
        alertVC.modalPresentationStyle = .overFullScreen
        present(alertVC, animated: true)
    }
    
    func presentDefualtError() {
        let alertVC = AlertVC(title: "Something Wnt Wrong !",
                              message: "We were unable to complete your task at this time . Please try again.",
                              buttonTitle: "Ok")
        alertVC.modalPresentationStyle  = .overFullScreen
        alertVC.modalTransitionStyle    = .crossDissolve
        present(alertVC, animated: true)
    }
    
    func showLoading() {
        let loadingVC = MovieDataLoadingVC()
        loadingVC.showLoadingView()
        
        loadingVC.modalPresentationStyle = .overFullScreen
        loadingVC.modalTransitionStyle = .crossDissolve
        present(loadingVC, animated: true)
    }
    
    func dismissLoading() {
        DispatchQueue.main.async {
            self.dismiss(animated: true)
        }
    }
}
