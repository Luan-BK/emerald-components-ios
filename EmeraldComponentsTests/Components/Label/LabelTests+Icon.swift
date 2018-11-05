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
        let label = self.label.textIcon(forState: .error, andType: .fill)
        // then
        XCTAssertEqual(image, label)
    }
    
    func testTextIcon_typeOutline() {
        // given
        let image: UIImage? = nil
        // when
        let label = self.label.textIcon(forState: .error, andType: .outline)
        // then
        XCTAssertEqual(image, label)
    }
    
    func testTextIcon_typeText() {
        // given
        let image: UIImage = UIImage(named: "icon-dot", in: Bundle.basic, compatibleWith: nil)!
            .withRenderingMode(.alwaysTemplate)
        // when
        let label = self.label.textIcon(forState: .error, andType: .text)
        // then
        XCTAssertEqual(image, label)
    }
    
    func testTextIcon_typeImage() {
        // given
        let imageName = "icon-password-show"
        let image: UIImage = UIImage(named: "icon-password-show", in: Bundle.basic, compatibleWith: nil)!
            .withRenderingMode(.alwaysTemplate)
        // when
        self.label.setIcon(name: "icon-password-show")
        let label = self.label.textIcon(forState: .error, andType: .image)
        // then
        XCTAssertEqual(image, label!)
        XCTAssertEqual(self.label.auxIconLabel, imageName)
    }
    
}
