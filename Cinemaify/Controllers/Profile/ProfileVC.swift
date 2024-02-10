//
//  ProfileVC.swift
//  Cinemaify
//
//  Created by Enes Sancar on 15.12.2023.
//

import UIKit

final class ProfileVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad() 
        
        view.backgroundColor = .secondarySystemBackground
        
        let button = UIButton(frame: .zero)
        view.addSubview(button)
        
        NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            button.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            button.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            button.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}
