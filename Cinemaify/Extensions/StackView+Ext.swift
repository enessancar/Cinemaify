//
//  StackView+Ext.swift
//  Cinemaify
//
//  Created by Enes Sancar on 15.12.2023.
//

import UIKit

extension UIStackView {
    
    func addArrangedSubviewsExt(_ views: UIView...) {
        for view in views { addArrangedSubview(view) }
    }
}

