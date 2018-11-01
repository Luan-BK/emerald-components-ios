//
//  UIColor+Palette.swift
//  EmeraldComponent
//
//  Created by João Mendes | Stone on 29/01/18.
//  Copyright © 2018 StoneCo. All rights reserved.
//

import UIKit

extension UIColor {
    
    // MARK: - Main colors
    
    public static func primaryColor(for theme: EmeraldTheme) -> UIColor {
        switch theme {
        case .stone:
            return Palette.Stone.digital
        }
    }
    
    /* Text colors */
    
    public static let primaryText: UIColor = UIColor.white
    
    public static let secondaryText: UIColor =  Palette.iron
    
    /* Background colors */
    
    public class func primaryContentBackground(for colorTheme: CompanyTheme) -> UIColor {
        switch colorTheme {
        case .stone:        return Palette.Stone.keyAccount
        case .mundiPagg:    return Palette.MundiPagg.navy
        }
    }
    
    public class func secondaryContentBackground(for colorTheme: CompanyTheme) -> UIColor {
        switch colorTheme {
        case .stone:        return Palette.Stone.keyExpansion
        case .mundiPagg:    return Palette.MundiPagg.green
        }
    }
    
    public class func tertiaryContentBackground(for colorTheme: CompanyTheme) -> UIColor {
        switch colorTheme {
        case .stone:        return Palette.Stone.digital
        case .mundiPagg:    return Palette.MundiPagg.turquoise
        }
    }
    
    /* Background gray scale colors */
    
    public static let veryDarkGrayScaleContentBackground: UIColor = Palette.Gray.veryDark
    
    public static let darkGrayScaleContentBackground: UIColor = Palette.Gray.dark
    
    public static let mediumGrayScaleContentBackground: UIColor = Palette.Gray.medium
    
    public static let lightGrayScaleContentBackground: UIColor = Palette.Gray.light
    
    public static let veryLighGrayScaleContentBackground: UIColor = Palette.Gray.veryLigh
        
    /* Others colors */
    
    public static let warning: UIColor = Palette.Basic.warning
    
    public static let failure: UIColor = Palette.Basic.error
    
    // MARK: - Color modifiers
    
    /// Returns a lighter version of this UIColor.
    ///
    /// - parameters:
    ///   - percentage: The percentage amount to lighthen the color.
    public func lighter(by percentage: CGFloat = 30.0) -> UIColor {
        return self.adjustBrightness(by: abs(percentage))
    }
    
    /// Returns a darker version of this UIColor.
    ///
    /// - parameters:
    ///   - percentage: The percentage amount to brighthen the color.
    public func darker(by percentage: CGFloat = 30.0) -> UIColor {
        return self.adjustBrightness(by: -abs(percentage))
    }
    
    private func adjustBrightness(by percentage: CGFloat = 30.0) -> UIColor {
        var hue: CGFloat = 0, sat: CGFloat = 0, bright: CGFloat = 0, alpha: CGFloat = 0
        
        if self.getHue(&hue, saturation: &sat, brightness: &bright, alpha: &alpha) {
            if bright < 1.0 {
                
                // Makes the code work with black as well as colors
                let newB: CGFloat
                if bright == 0.0 {
                    newB = max(min(bright + percentage/100, 1.0), 0.0)
                } else {
                    newB = max(min(bright + (percentage/100.0)*bright, 1.0), 0,0)
                }
                return UIColor(hue: hue, saturation: sat, brightness: newB, alpha: alpha)
            } else {
                let newS: CGFloat = min(max(sat - (percentage/100.0)*sat, 0.0), 1.0)
                return UIColor(hue: hue, saturation: newS, brightness: bright, alpha: alpha)
            }
        }
        return self
    }
}

extension UIColor {
    
    public struct Palette {
        
        public struct Light {
            /// #FFFFFF - 255, 255, 255
            public static let white1 = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1.0)
            /// #FAFAFC - 250, 250, 252
            public static let white2 = UIColor(red: 250/255, green: 250/255, blue: 252/255, alpha: 1.0)
            /// #EBEBF0 - 235, 235, 240
            public static let white3 = UIColor(red: 235/255, green: 235/255, blue: 240/255, alpha: 1.0)
            /// #C3C8D2 - 195, 200, 210
            public static let white4 = UIColor(red: 195/255, green: 200/255, blue: 210/255, alpha: 1.0)
            /// #96A0AF - 150, 160, 175
            public static let white5 = UIColor(red: 150/255, green: 160/255, blue: 175/255, alpha: 1.0)
        }
        
        public struct Dark {
            /// #0C1219 - 12, 18, 25
            public static let black1 = UIColor(red: 12/255, green: 18/255, blue: 25/255, alpha: 1.0)
            /// #181C24 - 24, 28, 36
            public static let black2 = UIColor(red: 24/255, green: 28/255, blue: 36/255, alpha: 1.0)
            /// #242932 - 36, 41, 50
            public static let black3 = UIColor(red: 36/255, green: 41/255, blue: 50/255, alpha: 1.0)
            /// #2D3844 - 45, 56, 68
            public static let black4 = UIColor(red: 45/255, green: 56/255, blue: 68/255, alpha: 1.0)
            /// #424B54 - 66, 75, 84
            public static let black5 = UIColor(red: 66/255, green: 75/255, blue: 84/255, alpha: 1.0)
        }
        
        // Others colors
        
        /// #262626 - 38, 38, 38
        static let iron     = UIColor(red: 38/255, green: 38/255, blue: 38/255, alpha: 1.0)
        /// #8036dc - 128, 58, 220
        static let purple   = UIColor(red: 128/255, green: 58/255, blue: 220/255, alpha: 1.0)
        
        public struct Basic {
            /// #e74c3c - 231, 76, 60
            public static let error            = UIColor(red: 231/255, green: 76/255, blue: 60/255, alpha: 1.0)
            /// #f9bf09 - 249, 191, 9
            public static let warning          = UIColor(red: 249/255, green: 191/255, blue: 9/255, alpha: 1.0)
            /// #2ECC71 - 46, 204, 113
            public static let success          = UIColor(red: 46/255, green: 204/255, blue: 113/255, alpha: 1.0)
        }
        
        // Payment status
        public struct Payment {
            /// #F9BF09 - 249, 191, 9
            public static let pending          = UIColor(red: 249/255, green: 191/255, blue: 9/255, alpha: 1.0)
            /// #B9C3CC - 185, 195, 104
            public static let scheduled        = UIColor(red: 185/255, green: 195/255, blue: 204/255, alpha: 1.0)
            /// #C7352E - 199, 53, 46
            public static let rejected         = UIColor(red: 199/255, green: 53/255, blue: 46/255, alpha: 1.0)
            /// #31CD65 - 49, 205, 101
            public static let paid             = UIColor(red: 49/255, green: 205/255, blue: 101/255, alpha: 1.0)
            /// #B9C3CC - 185, 195, 204
            public static let other            = UIColor(red: 185/255, green: 195/255, blue: 204/255, alpha: 1.0)
        }
        
        // Stone palette
        public struct Stone {
            static let keyExpansion     = UIColor(red: 20/255, green: 170/255, blue: 75/255, alpha: 1.0)
            static let keyAccount       = UIColor(red: 16/255, green: 58/255, blue: 33/255, alpha: 1.0)
            static let digital          = UIColor(red: 149/255, green: 201/255, blue: 61/255, alpha: 1.0)
        }
        
        // MundiPagg palette
        public struct MundiPagg {
            static let navy             = UIColor(red: 9/255, green: 39/255, blue: 89/255, alpha: 1.0)
            static let green            = UIColor(red: 24/255, green: 130/255, blue: 120/255, alpha: 1.0)
            static let turquoise        = UIColor(red: 0/255, green: 185/255, blue: 181/255, alpha: 1.0)
        }
        
        // Gray scale
        public struct Gray {
            static let veryDark         = UIColor(red: 65/255, green: 75/255, blue: 84/255, alpha: 1.0)
            static let dark             = UIColor(red: 130/255, green: 150/255, blue: 166/255, alpha: 1.0)
            static let medium           = UIColor(red: 178/255, green: 192/255, blue: 204/255, alpha: 1.0)
            static let light            = UIColor(red: 206/255, green: 214/255, blue: 220/255, alpha: 1.0)
            static let veryLigh         = UIColor(red: 232/255, green: 235/255, blue: 238/255, alpha: 1.0)
        }
        
    }
    
}
