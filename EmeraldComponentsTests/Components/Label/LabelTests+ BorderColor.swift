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
        let text: CGColor = neutralColor.cgColor
        // when
        let color = label.setBorderFor(color: neutralColor, type: .fill)
        // then
        XCTAssertEqual(text, color)
    }
    
    // MARK: - Border outline colors
    
    func testBorderColor_typeOutline_stateError() {
        // given
        let text: CGColor = neutralColor.cgColor
        // when
        let color = label.setBorderFor(color: neutralColor, type: .outline)
        // then
        XCTAssertEqual(text, color)
    }
    
    // MARK: - Border image color
    
    func testBorderColor_typeImage() {
        // given
        let text: CGColor = clearColor.cgColor
        // when
        let color = label.setBorderFor(color: clearColor, type: .image)
        // then
        XCTAssertEqual(text, color)
    }
    
}
