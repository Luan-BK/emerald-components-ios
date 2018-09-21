//
//  Double.swift
//  EmeraldComponents
//
//  Created by João Mendes | Stone on 20/09/18.
//  Copyright © 2018 StoneCo. All rights reserved.
//

import Foundation

extension Double {
    
    func formattedAsCurrency() -> String? {
        let formatter = NumberFormatter()
        formatter.locale = Locale(identifier: "pt_BR")
        formatter.numberStyle = .currency
        formatter.currencySymbol = "R$ "
        
        let number = NSNumber(value: self)
        
        return formatter.string(from: number)
    }
    
    func onlyDigitsCurrency() -> String? {
        let formatter = NumberFormatter()
        formatter.locale = Locale(identifier: "pt_BR")
        formatter.numberStyle = .currency
        formatter.currencySymbol = " "
        
        return formatter.string(from: NSNumber(value: self))
    }
    
}
