//
//  ThemeManager.swift
//  EmeraldComponents
//
//  Created by Luan Kalume | Stone on 04/05/2018.
//  Copyright © 2018 StoneCo. All rights reserved.
//

import UIKit

public struct ThemeManager {
    
    internal static let currentThemeKey = "EmeraldComponentsTheme"
    
    public static func currentTheme() -> EmeraldTheme {
        guard let storedTheme = UserDefaults.standard.value(forKey: ThemeManager.currentThemeKey) as? Int else {
            return .stone
        }
        return EmeraldTheme(rawValue: storedTheme)!
    }
    
    public static func applyTheme(_ theme: EmeraldTheme) {
        UserDefaults.standard.set(theme.rawValue, forKey: ThemeManager.currentThemeKey)
        UserDefaults.standard.synchronize()
        
        UIApplication.shared.delegate?.window??.tintColor = theme.tintColor
        UINavigationBar.appearance().barStyle = theme.barStyle
    }

}
