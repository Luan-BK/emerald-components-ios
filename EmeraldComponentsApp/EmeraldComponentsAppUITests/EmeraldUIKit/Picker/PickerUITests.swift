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
    
    func test_2_pickerSearch_selectBank() {
        
        XCTContext.runActivity(named: "Select bank inside list") { _ in
            // Select bank
            tablesQuery.textFields["List of banks"].tap()
            let bank = tablesQuery.staticTexts["HSBC"]
            bank.tap()
            
            // Check if exists
            XCTAssertNotNil(String(describing: bank))
        }
        
        XCTContext.runActivity(named: "Choose another bank inside list") { _ in
            // Select bank
            tablesQuery.textFields["HSBC"].tap()
            let bank = tablesQuery.staticTexts["Bank of America"]
            bank.tap()
            
            // Check if exists
            XCTAssertNotNil(String(describing: bank))
            
            // Check cancel button
            tablesQuery.textFields["Bank of America"].tap()
            XCUIApplication().buttons["Cancel"].tap()
        }
        
    }

    func test_3_pickerSearch_searchBank() {

        XCTContext.runActivity(named: "Search bank inside list") { _ in
            // Selects search list
            tablesQuery.textFields["Bank of America"].tap()
            app.searchFields["Search"].tap()
            
            // Types bank letters
            app.keys["B"].tap()
            app.keys["a"].tap()
            app.keys["n"].tap()
            app.keys["k"].tap()
            
            // Check if exists
            let bank = tablesQuery.staticTexts["Bank of Brasil"]
            bank.tap()
            XCTAssertNotNil(String(describing: bank))
            
        }
        
    }
    
}
