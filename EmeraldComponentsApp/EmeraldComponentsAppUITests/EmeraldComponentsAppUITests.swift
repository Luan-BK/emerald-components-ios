//
//  EmeraldComponentsAppUITests.swift
//  EmeraldComponentsAppUITests
//
//  Created by João Mendes | Stone on 10/09/18.
//  Copyright © 2018 StoneCo. All rights reserved.
//

import XCTest

class EmeraldComponentsAppUITests: XCTestCase {
    
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
        let beforeInput = tablesQuery.textFields["CNPJ Input"]
        beforeInput.tap()

        XCTAssertEqual(String(describing: beforeInput.value!), "CNPJ Input")
        beforeInput.typeText("00000000000000")

        let afterInput = tablesQuery.textFields["00.000.000/0000-00"]
        XCTAssertEqual(String(describing: afterInput.value!), "00.000.000/0000-00")

        // feedback icon
        let feedbackIcon = tablesQuery.buttons["input success icon"]
        XCTAssertTrue(feedbackIcon.exists)

        // feedback message
//        let feedbackMessage = tablesQuery.staticTexts["CNPJ Success feedback"]
    }
    
}
