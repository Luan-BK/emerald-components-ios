//
//  LabelTests+Icon.swift
//  EmeraldComponentsTests
//
//  Created by João Mendes | Stone on 24/10/18.
//  Copyright © 2018 StoneCo. All rights reserved.
//

import XCTest
@testable import EmeraldComponents

extension LabelTests {
    
    func testTextIcon_typeFill() {
        // given
        let image: UIImage? = nil
        // when
        let label = self.label.setTextIconFor(type: .fill, and: UIImage())
        // then
        XCTAssertEqual(image, label)
    }
    
    func testTextIcon_typeOutline() {
        // given
        let image: UIImage? = nil
        // when
        let label = self.label.setTextIconFor(type: .outline, and: UIImage())
        // then
        XCTAssertEqual(image, label)
    }
    
    func testTextIcon_typeImage() {
        // given
        let imageName = "icon-password-show"
        let image: UIImage = UIImage(named: imageName, in: Bundle.emerald, compatibleWith: nil)!
            .withRenderingMode(.alwaysTemplate)
        // when
        let label = self.label.setTextIconFor(type: .image, and: image)
        // then
        XCTAssertEqual(image, label!)
    }
    
}
