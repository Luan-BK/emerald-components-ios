//
//  String.swift
//  SlingBasicComponent
//
//  Created by João Mendes | Stone on 13/07/18.
//  Copyright © 2018 StoneCo. All rights reserved.
//

import Foundation

extension String {
    
    public func currencyFormatter(_ text: String) -> String {
        
        var number: NSNumber!
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = Locale(identifier: "pt_BR")
        formatter.currencySymbol = "R$ "
        formatter.groupingSeparator = "."
        formatter.decimalSeparator = ","
        formatter.paddingCharacter = " "
        formatter.maximumFractionDigits = 2
        formatter.minimumFractionDigits = 2
        formatter.maximumIntegerDigits = 12
        
        var amountWithPrefix = text
        
        let regex = try! NSRegularExpression(pattern: "[^0-9]", options: .caseInsensitive)
        amountWithPrefix = regex.stringByReplacingMatches(in: amountWithPrefix,
                                                          options: NSRegularExpression.MatchingOptions(rawValue: 0),
                                                          range: NSRange(location: 0, length: text.count),
                                                          withTemplate: "")
        
        let double = (amountWithPrefix as NSString).doubleValue
        number = NSNumber(value: (double / 100))
        
        return formatter.string(from: number)!
        
    }
    
}
