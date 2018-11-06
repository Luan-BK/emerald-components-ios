//
//  InputUITests+Currency.swift
//  EmeraldComponentsAppUITests
//
//  Created by João Mendes | Stone on 11/09/18.
//  Copyright © 2018 StoneCo. All rights reserved.
//

import XCTest

extension InputUITests {
    
    func test_8_currency() {
        
        self.attachment.screenshot("Input-19: Get currency empty state screenshot", to: 7)
        
        XCTContext.runActivity(named: "fill textfield") { _ in
            
            XCTContext.runActivity(named: "Get currency field and set value") { _ in
                // Get textfield
                let input = tablesQuery.textFields["Currency Input"]
                input.tap()
                
                // Check textfield
                XCTAssertEqual(String(describing: input.value!), "Currency Input")
                
                // Fill textfield
                app.keys["1"].tap()
                let fillKey = app.keys["0"]
                
                for _ in 0...5 {
                    fillKey.tap()
                }
            }
            
            XCTContext.runActivity(named: "Check if currency textfield is correct") { _ in
                let input = XCUIApplication().tables.children(matching: .cell).element(boundBy: 7).children(matching: .textField).element
                
                let label = UITextField()
                label.text = label.text?.currencyFormatter("R$ 10.000,00")
                let labelAmount = tablesQuery.textFields[label.text!]
                
                XCTAssertEqual(String(describing: input.value!), String(describing: labelAmount.value!))
            }
            
        }
        
        self.attachment.screenshot("Input-20: Get currency success state screenshot", to: 7)

        XCTContext.runActivity(named: "Clean textfield") { _ in

            XCTContext.runActivity(named: "Get filled field and erase inputed data") { _ in
                // Get textfield
                let input = XCUIApplication().tables.children(matching: .cell).element(boundBy: 7).children(matching: .textField).element
                input.tap()

                // Clean textfield
                let deleteKey = app.keys["Delete"]

                for _ in 0...6 {
                    deleteKey.tap()
                }
            }

            XCTContext.runActivity(named: "Check if currency textfield is correct") { _ in
                let input = XCUIApplication().tables.children(matching: .cell).element(boundBy: 7).children(matching: .textField).element
                
                let label = UITextField()
                label.text = label.text?.currencyFormatter("R$ 0,00")
                let labelAmount = tablesQuery.textFields[label.text!]
                
                XCTAssertEqual(String(describing: input.value!), String(describing: labelAmount.value!))
            }

        }
        
    }
    
}
