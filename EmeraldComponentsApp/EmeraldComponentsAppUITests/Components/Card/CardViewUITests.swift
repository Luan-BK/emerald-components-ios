//
//  CardViewUITests.swift
//  EmeraldComponentsAppUITests
//
//  Created by João Mendes | Stone on 12/12/18.
//  Copyright © 2018 StoneCo. All rights reserved.
//

import XCTest

class CardViewUITests: XCTestCase {

    let app = XCUIApplication()
    var tablesQuery: XCUIElementQuery!
    var attachment: AttachmentHelper!
    
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        tablesQuery = app.tables
        attachment = AttachmentHelper()
    }
    
    func launch() {
        setupSnapshot(app)
        app.launch()
        tablesQuery.staticTexts["Card"].tap()
    }

    func testCards() {
        
        self.launch()
        
        XCTContext.runActivity(named: "Get Cards") { _ in
            self.attachment.fullScreenshot("Card-1: Get first custom cardView cell")
            
            app.scrollViews.children(matching: .other).element.swipeUp()
            
            let staticTexts = app.scrollViews.otherElements.staticTexts
            
            XCTAssertTrue(staticTexts["One Title"].exists)
            XCTAssertTrue(staticTexts["Two Titles,\none card 🃏"].exists)
            XCTAssertTrue(staticTexts["This is an example of a really big card title, which should never really be implemented by a sane person."].exists)
            
            self.attachment.fullScreenshot("Card-2: Get second custom cardView cell")
        }
        
    }
    
}
