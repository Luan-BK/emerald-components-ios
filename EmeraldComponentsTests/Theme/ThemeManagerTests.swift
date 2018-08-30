//
//  ThemeManagerTests.swift
//  SlingBasicComponentTests
//
//  Created by Luan Kalume | Stone on 07/05/2018.
//  Copyright © 2018 StoneCo. All rights reserved.
//

import XCTest
@testable import SlingBasicComponent

class ThemeManagerTests: XCTestCase {
    
    func testCurrentTheme() {
        //given
        UserDefaults.standard.set(nil, forKey: ThemeManager.currentThemeKey)
        
        //when
        let theme = ThemeManager.currentTheme()
        
        //then
        XCTAssertEqual(theme, .stone)
    }
    
    func testApplyTheme() {
        //given
        ThemeManager.applyTheme(.stone)
        
        //when
        let currentTheme = ThemeManager.currentTheme()
        
        //then
        XCTAssertEqual(currentTheme, .stone)
    }
    
}
