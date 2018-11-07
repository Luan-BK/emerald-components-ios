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
        let text: UIColor = neutralColor
        // when
        let color = label.setBackgroundFor(color: neutralColor, and: .fill)
        // then
        XCTAssertEqual(text, color)
    }
    
    // MARK: - Border outline color
    
    func testBackgroundColor_typeOutline() {
        // given
        let text: UIColor = clearColor
        // when
        let color = label.setBackgroundFor(color: clearColor, and: .outline)
        // then
        XCTAssertEqual(text, color)
    }
    
    // MARK: - Border image color
    
    func testBackgroundColor_typeImage() {
        // given
        let text: UIColor = clearColor
        // when
        let color = label.setBackgroundFor(color: clearColor, and: .image)
        // then
        XCTAssertEqual(text, color)
    }
    
}
