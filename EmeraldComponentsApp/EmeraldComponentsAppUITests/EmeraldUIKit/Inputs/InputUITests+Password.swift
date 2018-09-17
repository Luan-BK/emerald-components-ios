//
//  InputUITests+Password.swift
//  EmeraldComponentsAppUITests
//
//  Created by João Mendes | Stone on 11/09/18.
//  Copyright © 2018 StoneCo. All rights reserved.
//

import XCTest

extension InputUITests {
    
    func test_2_password() {
        self.attachment.screenshot("Get password empty state screenshot", to: 1)
        
        XCTContext.runActivity(named: "Get password field and set value") { _ in
            // Get textfield
            let input = tablesQuery.secureTextFields["Password Input"]
            input.tap()
            
            // Check textfield
            XCTAssertEqual(String(describing: input.value!), "Password Input")
            
            // Fill textfield
            let fillKey = app.keys["a"]
            
            for _ in 0...5 {
                fillKey.tap()
            }
            
            // Check if textfield is not nil
            XCTAssertNotNil(input)
            
            // Clean textfield
            let deleteKey = app.keys["delete"]
            for _ in 0...5 {
                deleteKey.tap()
            }
            
            // Check if password textfield was cleaned
            XCTAssertEqual(String(describing: input.value!), "Password Input")
        }
        
    }
    
    func test_2_password_showAndHide() {

        XCTContext.runActivity(named: "Get password field and set value") { _ in
            // Get textfield
            let input = tablesQuery.secureTextFields["Password Input"]
            input.tap()
            
            // Fill textfield
            let fillKey = app.keys["a"]
            
            for _ in 0...5 {
                fillKey.tap()
            }
            
            // Tap show button
            tablesQuery.buttons["icon password show"].tap()
            XCTAssertNotNil(input)
            
            self.attachment.screenshot("Get show password state screenshot", to: 1)
            
            // Tap hide button
            tablesQuery.buttons["icon password hide"].tap()
            XCTAssertNotNil(input)
            
            self.attachment.screenshot("Get hide password state screenshot", to: 1)
            
            // Clean textfield
            app.keys["delete"].tap()
            
            // Check if password textfield was cleaned
            XCTAssertEqual(String(describing: input.value!), "Password Input")
        }
        
    }
    
}
