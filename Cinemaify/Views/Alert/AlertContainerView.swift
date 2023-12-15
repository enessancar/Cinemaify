//
//  AlertContainerView.swift
//  Cinemaify
//
//  Created by Enes Sancar on 15.12.2023.
//

import UIKit

final class AlertContainerView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func configure() {
       backgroundColor     = .systemBackground
       layer.cornerRadius  = 16
       layer.borderWidth   = 2
       layer.borderColor   = UIColor.white.cgColor
    }
}
