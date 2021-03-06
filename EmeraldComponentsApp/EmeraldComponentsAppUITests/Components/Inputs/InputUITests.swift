//
//  InputUITests.swift
//  InputUITests
//
//  Created by João Mendes | Stone on 10/09/18.
//  Copyright © 2018 StoneCo. All rights reserved.
//

import XCTest

class InputUITests: XCTestCase {
    
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
        tablesQuery.staticTexts["Input"].tap()
    }
        
}
