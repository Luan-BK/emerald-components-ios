//
//  UIColor+Palette.swift
//  EmeraldComponent
//
//  Created by João Mendes | Stone on 29/01/18.
//  Copyright © 2018 StoneCo. All rights reserved.
//

import UIKit

extension UIColor {
    
    @available(*, deprecated, message: "Use getTheme() method from ThemeManager class instead")
    public static func primaryColor(for theme: EmeraldTheme) -> UIColor {
        switch theme {
        case .stone:
            return ThemeManager.getTheme()
        }
    }
    
    /* Background gray scale colors */
    
    @available(*, deprecated, message: "Use UIColor.Palette.Dark.black5 instead")
    public static let veryDarkGrayScaleContentBackground: UIColor = Palette.Dark.black5
    
    @available(*, deprecated, message: "Use UIColor.Palette.Light.white5 instead")
    public static let darkGrayScaleContentBackground: UIColor = Palette.Light.white5
    
    @available(*, deprecated, message: "Use UIColor.Palette.Light.white4 instead")
    public static let lightGrayScaleContentBackground: UIColor = Palette.Light.white4
    
    @available(*, deprecated, message: "Use UIColor.Palette.Light.white3 instead")
    public static let veryLighGrayScaleContentBackground: UIColor = Palette.Light.white3
    
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
        
        public struct Basic {
            /// #95c93d - 149, 201, 61
            public static let primary   = UIColor(red: 149/255, green: 201/255, blue: 61/255, alpha: 1.0)
            /// #8036dc - 128, 58, 220
            public static let secondary = UIColor(red: 128/255, green: 58/255, blue: 220/255, alpha: 1.0)
            /// #e74c3c - 231, 76, 60
            public static let error     = UIColor(red: 231/255, green: 76/255, blue: 60/255, alpha: 1.0)
            /// #f9bf09 - 249, 191, 9
            public static let warning   = UIColor(red: 249/255, green: 191/255, blue: 9/255, alpha: 1.0)
            /// #2ECC71 - 46, 204, 113
            public static let success   = UIColor(red: 46/255, green: 204/255, blue: 113/255, alpha: 1.0)
        }
        
        // Payment status
        public struct Payment {
            /// #F9BF09 - 249, 191, 9
            @available(*, deprecated, message: "Use UIColor.Palette.Basic.warning instead")
            public static let pending   = UIColor(red: 249/255, green: 191/255, blue: 9/255, alpha: 1.0)
            /// #B9C3CC - 185, 195, 104
            @available(*, deprecated, message: "Use UIColor.Palette.Light.white4 instead")
            public static let scheduled = UIColor(red: 185/255, green: 195/255, blue: 204/255, alpha: 1.0)
            /// #C7352E - 199, 53, 46
            @available(*, deprecated, message: "Use UIColor.Palette.Basic.error instead")
            public static let rejected  = UIColor(red: 199/255, green: 53/255, blue: 46/255, alpha: 1.0)
            /// #31CD65 - 49, 205, 101
            @available(*, deprecated, message: "Use UIColor.Palette.Basic.success instead")
            public static let paid      = UIColor(red: 49/255, green: 205/255, blue: 101/255, alpha: 1.0)
            /// #B9C3CC - 185, 195, 204
            @available(*, deprecated, message: "Use UIColor.Palette.Light.white4 instead")
            public static let other     = UIColor(red: 185/255, green: 195/255, blue: 204/255, alpha: 1.0)
        }
        
    }
    
}
