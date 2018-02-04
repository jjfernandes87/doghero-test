//
//  Button.swift
//  doghero-test
//
//  Created by Julio Fernandes on 03/02/18.
//  Copyright © 2018 doghero. All rights reserved.
//

import UIKit

extension UIButton {
    
    func set(filled: String, unfilled: String, isSelected: Bool) {
        self.isSelected = isSelected
        self.setImage(UIImage(named: unfilled), for: .normal)
        self.setImage(UIImage(named: filled), for: .selected)
    }
    
}
