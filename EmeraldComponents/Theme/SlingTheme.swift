//
//  SlingTheme.swift
//  EmeraldComponents
//
//  Created by Luan Kalume | Stone on 04/05/2018.
//  Copyright © 2018 StoneCo. All rights reserved.
//

import UIKit

public enum SlingTheme: Int {
    case stone
}

extension SlingTheme {
    
    public var tintColor: UIColor {
        return UIColor.primaryColor(for: ThemeManager.currentTheme())
    }
    
    public var barStyle: UIBarStyle {
        return .default
    }
    
    public var buttonBackgroundColor: UIColor {
        return UIColor.primaryColor(for: ThemeManager.currentTheme())
    }
}
