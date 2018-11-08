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
        let color = label.setTextFor(color: neutralColor, and: .fill)
        // then
        XCTAssertEqual(text, color)
    }
    
    // MARK: - Text outline colors
    
    func testTextColor_typeOutline() {
        // given
        let text: UIColor = neutralColor
        // when
        let color = label.setTextFor(color: neutralColor, and: .outline)
        // then
        XCTAssertEqual(text, color)
    }
    
    // MARK: - Text image colors
    
    func testTextColor_typeImage() {
        // given
        let text: UIColor = neutralColor
        // when
        let color = label.setTextFor(color: neutralColor, and: .image)
        // then
        XCTAssertEqual(text, color)
    }
    
}
