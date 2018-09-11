//
//  ButtonUITests.swift
//  EmeraldComponentsAppUITests
//
//  Created by João Mendes | Stone on 11/09/18.
//  Copyright © 2018 StoneCo. All rights reserved.
//

import XCTest

class ButtonUITests: XCTestCase {
        
    let app = XCUIApplication()
    var tablesQuery: XCUIElementQuery!
    
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        XCUIApplication().launch()
        
        tablesQuery = app.tables
        tablesQuery.staticTexts["Button"].tap()
    }
    
    override func tearDown() {
        
        super.tearDown()
    }
    
}
