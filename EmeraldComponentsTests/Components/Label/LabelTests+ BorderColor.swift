//
//  LabelTests+ BorderColor.swift
//  EmeraldComponentsTests
//
//  Created by João Mendes | Stone on 24/10/18.
//  Copyright © 2018 StoneCo. All rights reserved.
//

import XCTest
@testable import EmeraldComponents

extension LabelTests {
    
    // MARK: - Border fill colors
    
    func testBorderColor_typeFill_stateError() {
        // given
        let text: CGColor = UIColor.Palette.Basic.error.cgColor
        // when
        let color = label.borderColor(forState: .error, andType: .fill)
        // then
        XCTAssertEqual(text, color)
    }
    
    func testBorderColor_typeFill_stateWarning() {
        // given
        let text: CGColor = UIColor.Palette.Basic.warning.cgColor
        // when
        let color = label.borderColor(forState: .warning, andType: .fill)
        // then
        XCTAssertEqual(text, color)
    }
    
    func testBorderColor_typeFill_stateNeutral() {
        // given
        let text: CGColor = UIColor.Palette.Light.white4.cgColor
        // when
        let color = label.borderColor(forState: .neutral, andType: .fill)
        // then
        XCTAssertEqual(text, color)
    }
    
    func testBorderColor_typeFill_stateSuccess() {
        // given
        let text: CGColor = UIColor.Palette.Basic.success.cgColor
        // when
        let color = label.borderColor(forState: .success, andType: .fill)
        // then
        XCTAssertEqual(text, color)
    }
    
    func testBorderColor_typeFill_stateInfo() {
        // given
        let text: CGColor = UIColor.Palette.secondary.cgColor
        // when
        let color = label.borderColor(forState: .info, andType: .fill)
        // then
        XCTAssertEqual(text, color)
    }
    
    // MARK: - Border outline colors
    
    func testBorderColor_typeOutline_stateError() {
        // given
        let text: CGColor = UIColor.Palette.Basic.error.cgColor
        // when
        let color = label.borderColor(forState: .error, andType: .outline)
        // then
        XCTAssertEqual(text, color)
    }
    
    func testBorderColor_typeOutline_stateWarning() {
        // given
        let text: CGColor = UIColor.Palette.Basic.warning.cgColor
        // when
        let color = label.borderColor(forState: .warning, andType: .outline)
        // then
        XCTAssertEqual(text, color)
    }
    
    func testBorderColor_typeOutline_stateNeutral() {
        // given
        let text: CGColor = UIColor.Palette.Light.white4.cgColor
        // when
        let color = label.borderColor(forState: .neutral, andType: .outline)
        // then
        XCTAssertEqual(text, color)
    }
    
    func testBorderColor_typeOutline_stateSuccess() {
        // given
        let text: CGColor = UIColor.Palette.Basic.success.cgColor
        // when
        let color = label.borderColor(forState: .success, andType: .outline)
        // then
        XCTAssertEqual(text, color)
    }
    
    func testBorderColor_typeOutline_stateInfo() {
        // given
        let text: CGColor = UIColor.Palette.secondary.cgColor
        // when
        let color = label.borderColor(forState: .info, andType: .outline)
        // then
        XCTAssertEqual(text, color)
    }
    
    // MARK: - Border text color
    
    func testBorderColor_typeText() {
        // given
        let text: CGColor = UIColor.clear.cgColor
        // when
        let color = label.borderColor(forState: .error, andType: .text)
        // then
        XCTAssertEqual(text, color)
    }
    
    // MARK: - Border image color
    
    func testBorderColor_typeImage() {
        // given
        let text: CGColor = UIColor.clear.cgColor
        // when
        let color = label.borderColor(forState: .error, andType: .image)
        // then
        XCTAssertEqual(text, color)
    }
    
}
