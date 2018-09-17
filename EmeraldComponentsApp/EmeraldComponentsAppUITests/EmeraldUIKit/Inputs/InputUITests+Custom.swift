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

        self.attachment.screenshot("Get custom empty screenshot", to: 8)
        
        XCTContext.runActivity(named: "Fill textfield") { _ in
            
            XCTContext.runActivity(named: "Get custom field and set value") { _ in
                // Get textfield
                let input = tablesQuery.textFields["Custom Input"]
                input.tap()
                
                // Check Ttextfield
                XCTAssertEqual(String(describing: input.value!), "Custom Input")
                
                // Fill Custom field
                app.keys["r"].tap()
                app.keys["j"].tap()
            }
            
            XCTContext.runActivity(named: "Check if custom textfield is correct") { _ in
                let input = tablesQuery.textFields["rj"]
                XCTAssertEqual(String(describing: input.value!), "rj")
            }
            
        }
        
        self.attachment.screenshot("Get custom success screenshot", to: 8)
        
        XCTContext.runActivity(named: "Clean textfield") { _ in
            
            XCTContext.runActivity(named: "Get filled field and erase inputed data") { _ in
                // Get textfield
                let input = tablesQuery.textFields["rj"]
                input.tap()
                
                // Clean textfield
                app.keys["delete"].tap()
                app.keys["delete"].tap()
            }
            
            XCTContext.runActivity(named: "Check if custom textfield is correct") { _ in
                let input = tablesQuery.textFields["Custom Input"]
                XCTAssertEqual(String(describing: input.value!), "Custom Input")
            }
            
            XCTContext.runActivity(named: "Check if custom icon doesn't exist") { _ in
                // Feedback icon
                XCTAssertFalse(tablesQuery.buttons["input success icon"].exists)
                XCTAssertFalse(tablesQuery.buttons["input warning icon"].exists)
                XCTAssertFalse(tablesQuery.buttons["input error icon"].exists)
            }
            
        }
        
    }
    
}
