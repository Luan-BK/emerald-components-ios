//
//  LabelTests+BackgroundColor.swift
//  EmeraldComponentsTests
//
//  Created by João Mendes | Stone on 24/10/18.
//  Copyright © 2018 StoneCo. All rights reserved.
//

import XCTest
@testable import EmeraldComponents

extension LabelTests {
    
    // MARK: - Border fill colors
    
    func testBackgroundColor_typeFill_stateError() {
        // given
        let text: UIColor = UIColor.Palette.Basic.error
        // when
        let color = label.backgroundColor(forState: .error, andType: .fill)
        // then
        XCTAssertEqual(text, color)
    }
    
    func testBackgroundColor_typeFill_stateWarning() {
        // given
        let text: UIColor = UIColor.Palette.Basic.warning
        // when
        let color = label.backgroundColor(forState: .warning, andType: .fill)
        // then
        XCTAssertEqual(text, color)
    }
    
    func testBackgroundColor_typeFill_stateNeutral() {
        // given
        let text: UIColor = UIColor.Palette.Light.white4
        // when
        let color = label.backgroundColor(forState: .neutral, andType: .fill)
        // then
        XCTAssertEqual(text, color)
    }
    
    func testBackgroundColor_typeFill_stateSuccess() {
        // given
        let text: UIColor = UIColor.Palette.Basic.success
        // when
        let color = label.backgroundColor(forState: .success, andType: .fill)
        // then
        XCTAssertEqual(text, color)
    }
    
    func testBackgroundColor_typeFill_stateInfo() {
        // given
        let text: UIColor = UIColor.Palette.Basic.secondary
        // when
        let color = label.backgroundColor(forState: .info, andType: .fill)
        // then
        XCTAssertEqual(text, color)
    }
    
    // MARK: - Border outline color
    
    func testBackgroundColor_typeOutline() {
        // given
        let text: UIColor = UIColor.clear
        // when
        let color = label.backgroundColor(forState: .error, andType: .outline)
        // then
        XCTAssertEqual(text, color)
    }
    
    // MARK: - Border text color
    
    func testBackgroundColor_typeText() {
        // given
        let text: UIColor = UIColor.clear
        // when
        let color = label.backgroundColor(forState: .error, andType: .text)
        // then
        XCTAssertEqual(text, color)
    }
    
    // MARK: - Border image color
    
    func testBackgroundColor_typeImage() {
        // given
        let text: UIColor = UIColor.clear
        // when
        let color = label.backgroundColor(forState: .error, andType: .image)
        // then
        XCTAssertEqual(text, color)
    }
    
}
