//
//  CardViewTests.swift
//  EmeraldComponentsTests
//
//  Created by João Mendes | Stone on 12/12/18.
//  Copyright © 2018 StoneCo. All rights reserved.
//

import XCTest
@testable import EmeraldComponents

class CardViewTests: XCTestCase {

    internal var cardView: CardView!
    
    internal var frame: CGRect!
    internal var view: UIView!
    
    override func setUp() {
        super.setUp()
        
        self.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
        self.view = UIView(frame: frame)
        self.cardView = CardView()
    }

    override func tearDown() {
        self.cardView = nil
        self.frame = nil
        self.view = nil
        
        super.tearDown()
    }
    
    func testLayoutSubviews_frame() {
        // given
        let frame = self.cardView.shadowView.frame
        let bounds = self.cardView.shadowView.bounds
        // then
        XCTAssertEqual(frame, bounds)
    }
    
    func testLayoutSubviews_autoresizingMask() {
        // given
        let autoresizingMask: UIView.AutoresizingMask = [.flexibleHeight, .flexibleWidth]
        // then
        XCTAssertEqual(autoresizingMask,
                       self.cardView.shadowView.autoresizingMask)
    }
    
    func testLayoutSubviews_backgroundColor() {
        // given
        let color = UIColor.clear
        // then
        XCTAssertEqual(color,
                       self.cardView.shadowView.backgroundColor)
    }

    func testLayoutSubviews_clipsToBounds() {
        // given
        let clipsToBounds = false
        // then
        XCTAssertEqual(clipsToBounds,
                       self.cardView.shadowView.clipsToBounds)
    }
    
    func testLayoutSubviews_shadowColor() {
        // given
        let shadowColor = UIColor.black.cgColor
        // then
        XCTAssertEqual(shadowColor,
                       self.cardView.shadowView.layer.shadowColor)
    }
    
    func testLayoutSubviews_shadowOpacity() {
        // given
        let shadowOpacity: Float = 0.10000000149011612
        // then
        XCTAssertEqual(shadowOpacity,
                       self.cardView.shadowView.layer.shadowOpacity)
    }
    
    func testLayoutSubviews_shadowOffset() {
        // given
        let shadowOffset = CGSize(width: 0.0, height: 4.0)
        // then
        XCTAssertEqual(shadowOffset,
                       self.cardView.shadowView.layer.shadowOffset)
    }
    
    func testLayoutSubviews_shadowRadius() {
        // given
        let shadowRadius: CGFloat = 18.0
        // then
        XCTAssertEqual(shadowRadius,
                       self.cardView.shadowView.layer.shadowRadius)
    }
    
    func testLayoutSubviews_cornerRadius() {
        // given
        let cornerRadius: CGFloat = 10.0
        // then
        XCTAssertEqual(cornerRadius,
                       self.cardView.shadowView.layer.cornerRadius)
    }
    
    func testSetProperty_corderRadius() {
        // given
        let cornerRadius: CGFloat = 10.0
        // when
        self.cardView.setPropertyTo(view: self.view, cornerRadius: cornerRadius)
        // then
        XCTAssertEqual(cornerRadius, self.cardView.cornerRadius)
    }
    
    func testSetProperty_shadowRadius() {
        // given
        let shadowRadius: CGFloat = 10.0
        // when
        self.cardView.setPropertyTo(view: self.view, shadowRadius: shadowRadius)
        // then
        XCTAssertEqual(shadowRadius, self.cardView.shadowRadius)
    }
    
    func testAddSuperview() {
        // given
        // when
        self.cardView.addSuperviewTo(customView: self.view,
                                     width: frame.size.width,
                                     height: frame.size.height)
        // then
        XCTAssertEqual(self.cardView.shadowView.subviews.first, self.view)
    }
    
    func testSetProperty_customView_corderRadius() {
        // when
        self.cardView.setPropertiesTo(customView: self.view)
        // then
        XCTAssertEqual(self.view.layer.cornerRadius,
                       self.cardView.cornerRadius)
    }
    
    func testSetProperty_customView_autorezing() {
        // when
        self.cardView.setPropertiesTo(customView: self.view)
        // then
        XCTAssertEqual(self.view.translatesAutoresizingMaskIntoConstraints,
                       false)
    }
    
    func testSetConstraint_horizontal() {
        // when
        self.cardView.setConstraintTo(customView: self.view,
                                      with: self.frame.size.width,
                                      and: self.frame.size.height)
        // then
        XCTAssertEqual(self.cardView.shadowView.constraints.count, 4)
    }
    
}
