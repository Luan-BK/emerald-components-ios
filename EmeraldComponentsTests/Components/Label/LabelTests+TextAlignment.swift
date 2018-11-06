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
        let align = label.textAlignment(forState: .success, andType: .fill)
        // then
        XCTAssertEqual(text, align)
    }
    
    func testTextAlignment_typeOutline() {
        // given
        let text: NSTextAlignment = .center
        // when
        let align = label.textAlignment(forState: .success, andType: .outline)
        // then
        XCTAssertEqual(text, align)
    }
    
    func testTextAlignment_typeText() {
        // given
        let text: NSTextAlignment = .left
        // when
        let align = label.textAlignment(forState: .success, andType: .text)
        // then
        XCTAssertEqual(text, align)
    }
    
    func testTextAlignment_typeImage() {
        // given
        let text: NSTextAlignment = .left
        // when
        let align = label.textAlignment(forState: .success, andType: .image)
        // then
        XCTAssertEqual(text, align)
    }
    
}
