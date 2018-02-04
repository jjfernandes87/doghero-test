//
//  Double.swift
//  doghero-test
//
//  Created by Julio Fernandes on 03/02/18.
//  Copyright © 2018 doghero. All rights reserved.
//

import UIKit

extension Double {
    
    func doubleToCurrencyAndMaximumFractionDigits(maximumFractionDigits: Int = 0) -> String? {
        let currencyFormatter = NumberFormatter()
        currencyFormatter.locale = Locale(identifier: "pt_BR")
        currencyFormatter.generatesDecimalNumbers = false
        currencyFormatter.maximumFractionDigits = 0
        
        currencyFormatter.generatesDecimalNumbers = maximumFractionDigits > 0
        currencyFormatter.maximumFractionDigits = maximumFractionDigits
        currencyFormatter.minimumFractionDigits = maximumFractionDigits
        
        return currencyFormatter.string(from: NSNumber(value: self))
    }
    
}
