//
//  DateRangePickerViewUITests+RangeViewToday.swift
//  EmeraldComponentsAppUITests
//
//  Created by João Mendes | Stone on 12/09/18.
//  Copyright © 2018 StoneCo. All rights reserved.
//

import XCTest

extension DateRangePickerViewUITests {

    func test_1_rangePicker_today() {
        
        self.launch()
        
        XCTContext.runActivity(named: "Select today range picker") { _ in
            tablesQuery.buttons["Filter"].tap()
            tablesQuery.staticTexts["Today"].tap()

            // Check if range value exists
            let rangeValue = tablesQuery.staticTexts["dateRangeValue"]
            XCTAssertTrue(rangeValue.exists)
        }

        self.attachment.fullScreenshot("Get typed search picker view screenshot", to: 1)
        
        XCTContext.runActivity(named: "Select yesterday range picker") { _ in
            tablesQuery.buttons["Filter"].tap()
            tablesQuery.staticTexts["Yesterday"].tap()

            // Check if range value exists
            let rangeValue = tablesQuery.staticTexts["dateRangeValue"]
            XCTAssertTrue(rangeValue.exists)
        }

        XCTContext.runActivity(named: "Select last 7 days range picker") { _ in
            tablesQuery.buttons["Filter"].tap()
            tablesQuery.staticTexts["Last 7 days"].tap()

            // Check if range value exists
            let rangeValue = tablesQuery.staticTexts["dateRangeValue"]
            XCTAssertTrue(rangeValue.exists)
        }

        XCTContext.runActivity(named: "Select last 30 days range picker") { _ in
            tablesQuery.buttons["Filter"].tap()
            tablesQuery.staticTexts["Last 30 days"].tap()

            // Check if range value exists
            let rangeValue = tablesQuery.staticTexts["dateRangeValue"]
            XCTAssertTrue(rangeValue.exists)
        }

        XCTContext.runActivity(named: "Select this month range picker") { _ in
            tablesQuery.buttons["Filter"].tap()
            tablesQuery.staticTexts["This month"].tap()

            // Check if range value exists
            let rangeValue = tablesQuery.staticTexts["dateRangeValue"]
            XCTAssertTrue(rangeValue.exists)
        }

        XCTContext.runActivity(named: "Select last month range picker") { _ in
            tablesQuery.buttons["Filter"].tap()
            tablesQuery.staticTexts["Last month"].tap()

            // Check if range value exists
            let rangeValue = tablesQuery.staticTexts["dateRangeValue"]
            XCTAssertTrue(rangeValue.exists)
        }
        
    }

}
