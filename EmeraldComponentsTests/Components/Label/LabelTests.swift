//
//  LabelTests.swift
//  EmeraldComponentsTests
//
//  Created by João Mendes | Stone on 24/10/18.
//  Copyright © 2018 StoneCo. All rights reserved.
//

import XCTest
@testable import EmeraldComponents

class LabelTests: XCTestCase {

    internal var label: EmeraldLabel!
    
    internal let neutralColor = UIColor.Palette.Light.white4
    internal let clearColor = UIColor.Palette.State.clear
    
    override func setUp() {
        super.setUp()
        let frame = CGRect(x: 0.0, y: 0.0, width: 140, height: 30)
        self.label = EmeraldLabel(frame: frame)
        
        self.label.configureFor(text: "Label", color: neutralColor, type: .outline, and: nil)
    }

    override func tearDown() {
        self.label = nil
        super.tearDown()
    }

    // MARK: - Init
    
    func testContetView_frame() {
        // given
        let boundsContentView = self.label.contentView.bounds
        let frameContentView = self.label.contentView.frame
        // when
        XCTAssertEqual(boundsContentView, frameContentView)
    }
    
    func testContetView_autoresizingMask() {
        // given
        let autoresizingMask = UIView()
        autoresizingMask.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        // then
        let contentView = self.label.contentView.autoresizingMask
        // when
        XCTAssertEqual(autoresizingMask.autoresizingMask, contentView)
    }
    
    func testDefaultvalues_corderRadius() {
        // given
        let cornerRadius: CGFloat = 15.0
        // then
        let label = self.label.textLabel.layer.cornerRadius
        // when
        XCTAssertEqual(cornerRadius, label)
    }
    
    func testDefaultvalues_masksToBounds() {
        // given
        let masksToBounds = true
        // then
        let label = self.label.textLabel.layer.masksToBounds
        // when
        XCTAssertEqual(masksToBounds, label)
    }
    
    func testDefaultvalues_font() {
        // given
        let font = UIFont.systemFont(ofSize: 15.0, weight: .heavy)
        // then
        let label = self.label.textLabel.font
        // when
        XCTAssertEqual(font, label)
    }
    
    // MARK: - Text
    
    func testText() {
        // given
        let text = "New"
        // then
        XCTAssertNotNil(self.label.setTextFor(label: text))
    }
    
}
