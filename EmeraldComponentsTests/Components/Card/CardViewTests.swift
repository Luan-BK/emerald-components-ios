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
    
    private let expectedMargin: CGFloat = 24.0

    internal var cardView: CardView!
    
    override func setUp() {
        super.setUp()
        self.cardView = CardView()
    }

    override func tearDown() {
        self.cardView = nil
        super.tearDown()
    }
    
    func testTitleSizeEnumFonts() {
        XCTAssertEqual(CardView.TitleSize.small.font, UIFont.systemFont(ofSize: 16.0, weight: .bold))
        XCTAssertEqual(CardView.TitleSize.medium.font, UIFont.systemFont(ofSize: 20.0, weight: .bold))
        XCTAssertEqual(CardView.TitleSize.big.font, UIFont.systemFont(ofSize: 24.0, weight: .bold))
    }
    
    func testSetHeaderTitleNotEmpty() {
        let emptyTitle = ""
        
        self.cardView.headerTitle = emptyTitle
        
        XCTAssertEqual(self.cardView.headerTitle, emptyTitle)
        XCTAssertEqual(self.cardView.headerTitleLabel.text, emptyTitle)
        XCTAssertTrue(self.cardView.headerView.isHidden)
    }
    
    func testSetHeaderTitleEmpty() {
        let title = "Some Header Title"
        
        self.cardView.headerTitle = title
        
        XCTAssertEqual(self.cardView.headerTitle, title)
        XCTAssertEqual(self.cardView.headerTitleLabel.text, title)
        XCTAssertFalse(self.cardView.headerView.isHidden)
    }
    
    func testSetTitleSizeAdapterWithValidInt() {
        let validSizeInt = 2
        
        self.cardView.titleSizeAdapter = validSizeInt
        
        XCTAssertEqual(self.cardView.titleSize, CardView.TitleSize(rawValue: validSizeInt)!)
    }
    
    func testSetTitleSizeAdapterWithInvalidInt() {
        let invalidSizeInt = -200
        
        self.cardView.titleSizeAdapter = invalidSizeInt
        
        XCTAssertEqual(self.cardView.titleSize, CardView.TitleSize.medium)
    }
    
    func testSetTitleSize() {
        let someSize = CardView.TitleSize.big
        
        self.cardView.titleSize = someSize
        
        XCTAssertEqual(self.cardView.headerTitleLabel.font, someSize.font)
    }
    
    func testSetCornerRadius() {
        let newCornerRadius: CGFloat = 20.0
        
        self.cardView.cornerRadius = newCornerRadius
        
        XCTAssertEqual(self.cardView.layer.cornerRadius, newCornerRadius)
        XCTAssertEqual(self.cardView.contentView.layer.cornerRadius, newCornerRadius)
    }
    
    func testSetShadowColor() {
        let newShadowRadius: CGFloat = 5.0
        
        self.cardView.shadowRadius = newShadowRadius
        
        XCTAssertEqual(self.cardView.layer.shadowRadius, newShadowRadius)
    }
    
    func testEnableSideMargins() {
        self.cardView.sideMarginsEnabled = true
        
        XCTAssertEqual(self.cardView.rightMarginConstraint.constant, expectedMargin)
        XCTAssertEqual(self.cardView.leftMarginConstraint.constant, expectedMargin)
    }
    
    func testDisableSideMargins() {
        self.cardView.sideMarginsEnabled = false
        
        XCTAssertEqual(self.cardView.rightMarginConstraint.constant, 0.0)
        XCTAssertEqual(self.cardView.leftMarginConstraint.constant, 0.0)
    }
    
    func testEnableTopMargin() {
        self.cardView.topMarginEnabled = true
        
        XCTAssertEqual(self.cardView.topMarginConstraint.constant, expectedMargin)
    }
    
    func testDisableTopMargin() {
        self.cardView.topMarginEnabled = false
        
        XCTAssertEqual(self.cardView.topMarginConstraint.constant, 0.0)
    }
    
    func testEnableBottomMargin() {
        self.cardView.bottomMarginEnabled = true
        
        XCTAssertEqual(self.cardView.bottomMarginConstraint.constant, expectedMargin)
    }
    
    func testDisableBottomMargin() {
        self.cardView.bottomMarginEnabled = false
        
        XCTAssertEqual(self.cardView.bottomMarginConstraint.constant, 0.0)
    }
    
    func testSetUpLayout() {
        self.cardView.setUpLayout()
        
        XCTAssertEqual(self.cardView.backgroundColor, .clear)
        XCTAssertEqual(self.cardView.layer.shadowColor, UIColor.black.cgColor)
        XCTAssertEqual(self.cardView.layer.shadowOpacity, 0.1)
        XCTAssertEqual(self.cardView.layer.shadowOffset, CGSize(width: 0.0, height: 5.0))
        XCTAssertEqual(self.cardView.layer.shadowRadius, self.cardView.shadowRadius)
        XCTAssertEqual(self.cardView.layer.cornerRadius, self.cardView.cornerRadius)
        
        XCTAssertTrue(self.cardView.contentView.clipsToBounds)
        XCTAssertEqual(self.cardView.contentView.layer.cornerRadius, self.cardView.cornerRadius)
        XCTAssertEqual(self.cardView.contentView.frame, self.cardView.bounds)
        XCTAssertEqual(self.cardView.contentView.backgroundColor, UIColor.Palette.Light.white1)
        XCTAssertFalse(self.cardView.contentView.translatesAutoresizingMaskIntoConstraints)
        
        XCTAssertFalse(self.cardView.containerView.translatesAutoresizingMaskIntoConstraints)
    }
    
    func testEmbedView() {
        let viewToEmbed = UIView()
        
        self.cardView.embedView(viewToEmbed)
        
        XCTAssertTrue(self.cardView.containerView.subviews.contains(viewToEmbed))
    }
    
    func testClearEmebeddedViews() {
        let viewToBeCleared = UIView()
        
        self.cardView.embedView(viewToBeCleared)
        self.cardView.clearEmbeddedViews()
        
        XCTAssertFalse(self.cardView.containerView.subviews.contains(viewToBeCleared))
    }
}
