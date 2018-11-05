//
//  LabelTests+Constraint.swift
//  EmeraldComponentsTests
//
//  Created by João Mendes | Stone on 24/10/18.
//  Copyright © 2018 StoneCo. All rights reserved.
//

import XCTest
@testable import EmeraldComponents

extension LabelTests {
    
    func testConstraint_typeFill() {
        // given
        let height: CGFloat = 0.0
        let leading: CGFloat = 0.0
        // when
        self.label.setVisibilityConstraints(forState: .error, andType: .fill)
        // then
        XCTAssertEqual(self.label.iconImageHeightConstraint.constant, height)
        XCTAssertEqual(self.label.textLabelLeadingConstraint.constant, leading)
    }
    
    func testConstraint_typeOutline() {
        // given
        let height: CGFloat = 0.0
        let leading: CGFloat = 0.0
        // when
        self.label.setVisibilityConstraints(forState: .error, andType: .outline)
        // then
        XCTAssertEqual(self.label.iconImageHeightConstraint.constant, height)
        XCTAssertEqual(self.label.textLabelLeadingConstraint.constant, leading)
    }
    
    func testConstraint_typeText() {
        // given
        let height: CGFloat = 30.0
        let leading: CGFloat = 8.0
        // when
        self.label.setVisibilityConstraints(forState: .error, andType: .text)
        // then
        XCTAssertEqual(self.label.iconImageHeightConstraint.constant, height)
        XCTAssertEqual(self.label.textLabelLeadingConstraint.constant, leading)
    }
    
    func testConstraint_typeImage() {
        // given
        let height: CGFloat = 30.0
        let leading: CGFloat = 8.0
        // when
        self.label.setVisibilityConstraints(forState: .error, andType: .image)
        // then
        XCTAssertEqual(self.label.iconImageHeightConstraint.constant, height)
        XCTAssertEqual(self.label.textLabelLeadingConstraint.constant, leading)
    }
    
}