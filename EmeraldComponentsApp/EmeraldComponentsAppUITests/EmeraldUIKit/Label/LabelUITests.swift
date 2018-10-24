//
//  LabelUITests.swift
//  EmeraldComponentsAppUITests
//
//  Created by João Mendes | Stone on 24/10/18.
//  Copyright © 2018 StoneCo. All rights reserved.
//

import XCTest

class LabelUITests: XCTestCase {

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
        tablesQuery.staticTexts["Label"].tap()
    }
    
    func test_1_label() {
        
        self.launch()
        
        self.attachment.fullScreenshot("Label-1: Get fill, outline and text screenshots")
        
        let textElement = tablesQuery.children(matching: .other)["TEXT"]
        textElement.swipeUp()
        
        self.attachment.fullScreenshot("Label-2: Get image screenshots")
    }
    
}
