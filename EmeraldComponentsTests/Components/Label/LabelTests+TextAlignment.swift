//
//  LabelTests+TextAlignment.swift
//  EmeraldComponentsTests
//
//  Created by João Mendes | Stone on 24/10/18.
//  Copyright © 2018 StoneCo. All rights reserved.
//

import XCTest
@testable import EmeraldComponents

extension LabelTests {
    
    func testTextAlignment_typeFill() {
        // given
        let text: NSTextAlignment = .center
        // when
        let align = label.setTextAlignmentFor(type: .fill)
        // then
        XCTAssertEqual(text, align)
    }
    
    func testTextAlignment_typeOutline() {
        // given
        let text: NSTextAlignment = .center
        // when
        let align = label.setTextAlignmentFor(type: .outline)
        // then
        XCTAssertEqual(text, align)
    }
    
    func testTextAlignment_typeImage() {
        // given
        let text: NSTextAlignment = .left
        // when
        let align = label.setTextAlignmentFor(type: .image)
        // then
        XCTAssertEqual(text, align)
    }
    
}
