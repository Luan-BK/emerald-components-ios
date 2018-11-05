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
        tablesQuery.staticTexts["Picker"].tap()
    }
    
    func test_1_pickerView() {
        
        self.launch()
        
        self.attachment.screenshot("DatePickerView-1: Get picker view empty screenshot", to: 0)
        
        XCTContext.runActivity(named: "Selects bank") { _ in
            
            // Select picker view,swipe up to select bradesco bank option
            tablesQuery.textFields["Banks"].tap()
            app.pickerWheels["---"].adjust(toPickerWheelValue: "Bradesco")
            
            // Check if the bank was selected
            let beforeChoosePickerOption = app.pickerWheels["Bradesco"]
            XCTAssertEqual(String(describing: beforeChoosePickerOption.value!), "Bradesco")
            
            self.attachment.screenshot("DatePickerView-2: Get selected picker view screenshot", to: 0)
            
            // Swipe down to clean value
            app.pickerWheels["Bradesco"].swipeDown()
            
            // check if the value was cleaned
            let chooseCleanPickerOption = app.pickerWheels["---"]
            chooseCleanPickerOption.tap()
            XCTAssertEqual(String(describing: chooseCleanPickerOption.value!), "---")
        }
        
    }
    
    func test_2_pickerSearch_selectBank() {
        
        self.attachment.screenshot("DatePickerView-3: Get search picker view screenshot", to: 1)
        
        XCTContext.runActivity(named: "Select bank inside list") { _ in
            // Select bank
            tablesQuery.textFields["List of banks"].tap()
            let bank = tablesQuery.staticTexts["HSBC"]
            bank.tap()
            
            // Check if exists
            XCTAssertNotNil(String(describing: bank))
        }
        
        self.attachment.screenshot("DatePickerView-4: Get sealeted search picker view screenshot", to: 1)
        
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
            
            self.attachment.screenshot("DatePickerView-5: Get typed search picker view screenshot", to: 1)
            
            // Check if exists
            let bank = tablesQuery.staticTexts["Bank of Brasil"]
            bank.tap()
            XCTAssertNotNil(String(describing: bank))
            
        }
        
    }
    
}
