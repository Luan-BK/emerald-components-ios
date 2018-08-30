//
//  SlingThemeTests.swift
//  EmeraldComponentsTests
//
//  Created by Luan Kalume | Stone on 07/05/2018.
//  Copyright © 2018 StoneCo. All rights reserved.
//

import XCTest
@testable import EmeraldComponents

class SlingThemeTests: XCTestCase {
    
    private var theme: SlingTheme!
    
    func testTheme_Stone() {
        //given
        theme = SlingTheme.stone
        
        //then
        validateTintColor(UIColor.primaryColor(for: ThemeManager.currentTheme()))
        validateBarStyle(.default)
        validateButtonBackgroundColor(UIColor.primaryColor(for: ThemeManager.currentTheme()))
    }
    
    func validateTintColor(_ color: UIColor) {
        XCTAssertEqual(self.theme.tintColor, color)
    }
    
    func validateBarStyle(_ style: UIBarStyle) {
        XCTAssertEqual(self.theme.barStyle, style)
    }
    
    func validateButtonBackgroundColor(_ color: UIColor) {
        XCTAssertEqual(self.theme.buttonBackgroundColor, color)
    }
    
}
