//
//  InputUITests+Custom.swift
//  EmeraldComponentsAppUITests
//
//  Created by João Mendes | Stone on 11/09/18.
//  Copyright © 2018 StoneCo. All rights reserved.
//

import XCTest

extension InputUITests {
    
    func test_9_custom() {

        XCTContext.runActivity(named: "Fill textfield") { _ in
            
            XCTContext.runActivity(named: "Get Custom field and change value") { _ in
                // Get CNPJ field
                let beforeInput = tablesQuery.textFields["Custom Input"]
                beforeInput.tap()
                
                // Check text field
                XCTAssertEqual(String(describing: beforeInput.value!), "Custom Input")
                
                // Fill CNPJ field
                app.keys["r"].tap()
                app.keys["j"].tap()
            }
            
            XCTContext.runActivity(named: "Check if Custom textfield is correct") { _ in
                let afterInput = tablesQuery.textFields["rj"]
                XCTAssertEqual(String(describing: afterInput.value!), "rj")
            }
            
        }
        
        XCTContext.runActivity(named: "Clean textfield") { _ in
            
            XCTContext.runActivity(named: "Get filled field and erase inputed data") { _ in
                // Get CNPJ field
                let afterInputedData = tablesQuery.textFields["rj"]
                afterInputedData.tap()
                
                // Clean field
                app.keys["delete"].tap()
                app.keys["delete"].tap()
            }
            
            XCTContext.runActivity(named: "Check if Custom textfield is correct") { _ in
                let afterInput = tablesQuery.textFields["Custom Input"]
                XCTAssertEqual(String(describing: afterInput.value!), "Custom Input")
            }
            
            XCTContext.runActivity(named: "Check if Custom icon doen't exist") { _ in
                // Feedback icon
                XCTAssertFalse(tablesQuery.buttons["input success icon"].exists)
                XCTAssertFalse(tablesQuery.buttons["input warning icon"].exists)
                XCTAssertFalse(tablesQuery.buttons["input error icon"].exists)
            }
            
        }
        
    }
    
}
