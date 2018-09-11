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

    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        XCUIApplication().launch()

        tablesQuery = app.tables
        tablesQuery.staticTexts["Input"].tap()
    }

    override func tearDown() {

        super.tearDown()
    }

    func testCNPJ() {
        
        XCTContext.runActivity(named: "Get CNPJ field and change value") { _ in
            // Get CNPJ field
            let beforeInput = tablesQuery.textFields["CNPJ Input"]
            beforeInput.tap()
            
            // Fill CNPJ field
            XCTAssertEqual(String(describing: beforeInput.value!), "CNPJ Input")
            beforeInput.typeText("00000000000000")
        }
        
        XCTContext.runActivity(named: "Check if CNPJ fill is correct") { _ in
            let afterInput = tablesQuery.textFields["00.000.000/0000-00"]
            XCTAssertEqual(String(describing: afterInput.value!), "00.000.000/0000-00")
        }
        
        XCTContext.runActivity(named: "Check if CNPJ is success") { _ in
            // Feedback icon
            let feedbackIcon = tablesQuery.buttons["input success icon"]
            XCTAssertTrue(feedbackIcon.exists)
        }

    }
    
}
