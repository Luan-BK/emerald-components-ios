//
//  ThemeManager.swift
//  EmeraldComponents
//
//  Created by Luan Kalume | Stone on 04/05/2018.
//  Copyright © 2018 StoneCo. All rights reserved.
//

import UIKit

public struct ThemeManager {
    
    @available(*, deprecated, message: "Prefer to use `theme` property insted")
    internal static let currentThemeKey = "EmeraldComponentsTheme"
    
    internal let defaults = UserDefaults.standard
    
    /// Key that'll be used to store and retrieave the custom color
    internal let theme = "EmeraldComponentsThemeKey"
    
    @available(*, deprecated, message: "This method will be replaced for ThemeManager().getTheme()")
    public static func currentTheme() -> EmeraldTheme {
        guard let storedTheme = UserDefaults.standard.value(forKey: ThemeManager.currentThemeKey) as? Int else {
            return .stone
        }
        return EmeraldTheme(rawValue: storedTheme)!
    }

    @available(*, deprecated, message: "This method will be replaced for ThemeManager().set(theme: UIColor)")
    public static func applyTheme(_ theme: EmeraldTheme) {
        UserDefaults.standard.set(theme.rawValue, forKey: ThemeManager.currentThemeKey)
        UserDefaults.standard.synchronize()
        
        UIApplication.shared.delegate?.window??.tintColor = theme.tintColor
        UINavigationBar.appearance().barStyle = theme.barStyle
    }
    
    /// Return the theme color that was previouslly stored.
    ///
    /// If no color was setted, so it'll use the default `Palette.Basic.primary` color.
    ///
    /// - Returns: Returns the stored color.
    public func getTheme() -> UIColor {
        guard let storedTheme = defaults.colorFor(key: self.theme) else {
            return UIColor.Palette.Basic.primary
        }
        return storedTheme
    }
    
    /// Sets a default theme color to be used with some components.
    ///
    /// - Parameter theme: Color to be stored.
    public func set(theme: UIColor) {
        defaults.set(color: theme, forKey: self.theme)
    }
    
}
