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
        let width = label.setBorderWidthFor(type: .fill)
        // then
        XCTAssertEqual(text, width)
    }
    
    func testBorderWidth_typeOutline() {
        // given
        let text: CGFloat = 1.0
        // when
        let width = label.setBorderWidthFor(type: .outline)
        // then
        XCTAssertEqual(text, width)
    }
    
    func testBorderWidth_typeImage() {
        // given
        let text: CGFloat = 0.0
        // when
        let width = label.setBorderWidthFor(type: .image)
        // then
        XCTAssertEqual(text, width)
    }
    
}
