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
                let input = tablesQuery.textFields["R$ 10.000,00"]
                XCTAssertEqual(String(describing: input.value!), "R$ 10.000,00")
            }
            
        }
        
        XCTContext.runActivity(named: "Clean textfield") { _ in
            
            XCTContext.runActivity(named: "Get filled field and erase inputed data") { _ in
                // Get textfield
                let input = tablesQuery.textFields["R$ 10.000,00"]
                input.tap()
                
                // Clean textfield
                let deleteKey = app.keys["delete"]
                
                for _ in 0...6 {
                    deleteKey.tap()
                }
            }
            
            XCTContext.runActivity(named: "Check if currency textfield is correct") { _ in
                let input = tablesQuery.textFields["R$ 0,00"]
                XCTAssertEqual(String(describing: input.value!), "R$ 0,00")
            }
            
        }
        
    }
    
}
