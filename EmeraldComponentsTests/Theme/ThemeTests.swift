//
//  ThemeTests.swift
//  EmeraldComponentsTests
//
//  Created by Luan Kalume | Stone on 07/05/2018.
//  Copyright © 2018 StoneCo. All rights reserved.
//

import XCTest
@testable import EmeraldComponents

class ThemeTests: XCTestCase {
    
    private var theme: EmeraldTheme!
    private let themeManager = ThemeManager()
    
    func testTheme_Stone() {
        //given
        theme = EmeraldTheme.stone
        
        //then
        validateTintColor(themeManager.getTheme())
        validateBarStyle(.default)
        validateButtonBackgroundColor(themeManager.getTheme())
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
