//
//  PickerUITests.swift
//  EmeraldComponentsAppUITests
//
//  Created by João Mendes | Stone on 11/09/18.
//  Copyright © 2018 StoneCo. All rights reserved.
//

import XCTest

class PickerUITests: XCTestCase {
    
    let app = XCUIApplication()
    var tablesQuery: XCUIElementQuery!
    
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        tablesQuery = app.tables
    }
    
    func launch() {
        XCUIApplication().launch()
        tablesQuery.staticTexts["Picker"].tap()
    }
    
    func test_1_pickerView() {
        
        self.launch()
        
        XCTContext.runActivity(named: "Selects bank") { _ in
            // Select picker view,swipe up to select bradesco bank option
            tablesQuery.textFields["Banks"].tap()
            app.pickerWheels["---"].swipeUp()
            app.pickerWheels["Bradesco"].tap()
            
            // Check if the bank was selected
            let beforeChoosePickerOption = app.pickerWheels["Bradesco"]
            XCTAssertEqual(String(describing: beforeChoosePickerOption.value!), "Bradesco")
            
            // Swipe down to clean value
            app.pickerWheels["Bradesco"].swipeDown()
            
            // check if the value was cleaned
            let chooseCleanPickerOption = app.pickerWheels["---"]
            chooseCleanPickerOption.tap()
            XCTAssertEqual(String(describing: chooseCleanPickerOption.value!), "---")
        }
        
    }
    
}
