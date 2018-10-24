//
//  LabelTests+BorderWidth.swift
//  EmeraldComponentsTests
//
//  Created by João Mendes | Stone on 24/10/18.
//  Copyright © 2018 StoneCo. All rights reserved.
//

import XCTest
@testable import EmeraldComponents

extension LabelTests {
    
    func testBorderWidth_typeFill() {
        // given
        let text: CGFloat = 0.0
        // when
        let width = label.borderWidth(forState: .error, andType: .fill)
        // then
        XCTAssertEqual(text, width)
    }
    
    func testBorderWidth_typeOutline() {
        // given
        let text: CGFloat = 1.0
        // when
        let width = label.borderWidth(forState: .error, andType: .outline)
        // then
        XCTAssertEqual(text, width)
    }
    
    func testBorderWidth_typeText() {
        // given
        let text: CGFloat = 0.0
        // when
        let width = label.borderWidth(forState: .error, andType: .text)
        // then
        XCTAssertEqual(text, width)
    }
    
    func testBorderWidth_typeImage() {
        // given
        let text: CGFloat = 0.0
        // when
        let width = label.borderWidth(forState: .error, andType: .image)
        // then
        XCTAssertEqual(text, width)
    }
    
}
