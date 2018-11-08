//
//  EmeraldTheme.swift
//  EmeraldComponents
//
//  Created by Luan Kalume | Stone on 04/05/2018.
//  Copyright © 2018 StoneCo. All rights reserved.
//

import UIKit

public enum EmeraldTheme: Int {
    case stone
}

extension EmeraldTheme {
    
    public var tintColor: UIColor {
        return ThemeManager.getThemeColor()
    }
    
    public var barStyle: UIBarStyle {
        return .default
    }
    
    public var buttonBackgroundColor: UIColor {
        return ThemeManager.getThemeColor()
    }
}
