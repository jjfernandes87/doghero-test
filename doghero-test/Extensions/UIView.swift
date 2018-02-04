//
//  UIView.swift
//  doghero-test
//
//  Created by Julio Fernandes on 03/02/18.
//  Copyright © 2018 doghero. All rights reserved.
//

import UIKit

public extension UIView {
    
    public func popAnimation() {
        UIView.animate(withDuration: 0.2, animations: {
            self.transform = CGAffineTransform(scaleX: 1.2, y: 1.2);
        }) { (true) in
            UIView.animate(withDuration: 0.2, animations: {
                self.transform = CGAffineTransform(scaleX: 1.0, y: 1.0);
            })
        }
    }
    
}

