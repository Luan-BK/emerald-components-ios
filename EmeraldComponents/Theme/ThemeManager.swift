//
//  ThemeManager.swift
//  EmeraldComponents
//
//  Created by Luan Kalume | Stone on 04/05/2018.
//  Copyright © 2018 StoneCo. All rights reserved.
//

import UIKit

public struct ThemeManager {
    
    internal static let defaults = UserDefaults.standard
    
    /// Key that'll be used to store and retrieave the custom color
    internal static let theme = "EmeraldComponentsThemeKey"
    
    /// Return the theme color that was previouslly stored.
    ///
    /// If no color was setted, so it'll use the default `Palette.Basic.primary` color.
    ///
    /// - Returns: Returns the stored color.
    public static func getThemeColor() -> UIColor {
        guard let storedTheme = ThemeManager.defaults.colorFor(key: self.theme) else {
            return UIColor.Palette.Main.primary
        }
        return storedTheme
    }
    
    /// Sets a default theme color to be used with some components.
    ///
    /// - Parameter theme: Color to be stored.
    public static func set(theme: UIColor) {
        ThemeManager.defaults.set(color: theme, forKey: self.theme)
    }
    
}
