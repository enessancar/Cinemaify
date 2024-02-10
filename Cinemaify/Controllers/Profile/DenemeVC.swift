//
//  DenemeVC.swift
//  Cinemaify
//
//  Created by Enes Sancar on 10.02.2024.
//

import UIKit

final class DenemeVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .red
        
        let label = UILabel(frame: .zero)
        view.addSubview(label)
    }
}
