//
//  LabelTests+TextColor.swift
//  EmeraldComponentsTests
//
//  Created by João Mendes | Stone on 24/10/18.
//  Copyright © 2018 StoneCo. All rights reserved.
//

import XCTest
@testable import EmeraldComponents

extension LabelTests {
    
    // MARK: - Text fill color
    
    func testTextColor_typeFill() {
        // given
        let text: UIColor = UIColor.Palette.Light.white1
        // when
        let color = label.textColor(forState: .error, andType: .fill)
        // then
        XCTAssertEqual(text, color)
    }
    
    // MARK: - Text outline colors
    
    func testTextColor_typeOutline_stateError() {
        // given
        let text: UIColor = UIColor.Palette.Basic.error
        // when
        let color = label.textColor(forState: .error, andType: .outline)
        // then
        XCTAssertEqual(text, color)
    }
    
    func testTextColor_typeOutline_stateWarning() {
        // given
        let text: UIColor = UIColor.Palette.Basic.warning
        // when
        let color = label.textColor(forState: .warning, andType: .outline)
        // then
        XCTAssertEqual(text, color)
    }
    
    func testTextColor_typeOutline_stateNeutral() {
        // given
        let text: UIColor = UIColor.Palette.Light.white4
        // when
        let color = label.textColor(forState: .neutral, andType: .outline)
        // then
        XCTAssertEqual(text, color)
    }
    
    func testTextColor_typeOutline_stateSuccess() {
        // given
        let text: UIColor = UIColor.Palette.Basic.success
        // when
        let color = label.textColor(forState: .success, andType: .outline)
        // then
        XCTAssertEqual(text, color)
    }
    
    func testTextColor_typeOutline_stateInfo() {
        // given
        let text: UIColor = UIColor.Palette.Basic.secondary
        // when
        let color = label.textColor(forState: .info, andType: .outline)
        // then
        XCTAssertEqual(text, color)
    }

    // MARK: - Text text colors
    
    func testTextColor_typeText_stateError() {
        // given
        let text: UIColor = UIColor.Palette.Basic.error
        // when
        let color = label.textColor(forState: .error, andType: .text)
        // then
        XCTAssertEqual(text, color)
    }
    
    func testTextColor_typeText_stateWarning() {
        // given
        let text: UIColor = UIColor.Palette.Basic.warning
        // when
        let color = label.textColor(forState: .warning, andType: .text)
        // then
        XCTAssertEqual(text, color)
    }
    
    func testTextColor_typeText_stateNeutral() {
        // given
        let text: UIColor = UIColor.Palette.Light.white4
        // when
        let color = label.textColor(forState: .neutral, andType: .text)
        // then
        XCTAssertEqual(text, color)
    }
    
    func testTextColor_typeText_stateSuccess() {
        // given
        let text: UIColor = UIColor.Palette.Basic.success
        // when
        let color = label.textColor(forState: .success, andType: .text)
        // then
        XCTAssertEqual(text, color)
    }
    
    func testTextColor_typeText_stateInfo() {
        // given
        let text: UIColor = UIColor.Palette.secondary
        // when
        let color = label.textColor(forState: .info, andType: .text)
        // then
        XCTAssertEqual(text, color)
    }
    
    // MARK: - Text image colors
    
    func testTextColor_typeImage_stateError() {
        // given
        let text: UIColor = UIColor.Palette.Basic.error
        // when
        let color = label.textColor(forState: .error, andType: .image)
        // then
        XCTAssertEqual(text, color)
    }
    
    func testTextColor_typeImage_stateWarning() {
        // given
        let text: UIColor = UIColor.Palette.Basic.warning
        // when
        let color = label.textColor(forState: .warning, andType: .image)
        // then
        XCTAssertEqual(text, color)
    }
    
    func testTextColor_typeImage_stateNeutral() {
        // given
        let text: UIColor = UIColor.Palette.Light.white4
        // when
        let color = label.textColor(forState: .neutral, andType: .image)
        // then
        XCTAssertEqual(text, color)
    }
    
    func testTextColor_typeImage_stateSuccess() {
        // given
        let text: UIColor = UIColor.Palette.Basic.success
        // when
        let color = label.textColor(forState: .success, andType: .image)
        // then
        XCTAssertEqual(text, color)
    }
    
    func testTextColor_typeImage_stateInfo() {
        // given
        let text: UIColor = UIColor.Palette.secondary
        // when
        let color = label.textColor(forState: .info, andType: .image)
        // then
        XCTAssertEqual(text, color)
    }
    
}
