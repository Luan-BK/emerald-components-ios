//
//  InputUITests+Email.swift
//  EmeraldComponentsAppUITests
//
//  Created by João Mendes | Stone on 11/09/18.
//  Copyright © 2018 StoneCo. All rights reserved.
//

import XCTest

extension InputUITests {
    
    func test_5_email() {
        
        self.attachment.screenshot("Get email empty state screenshot", to: 4)
        
        XCTContext.runActivity(named: "fill textfield") { _ in
            
            XCTContext.runActivity(named: "Get email field and set value") { _ in
                // Get textfield
                let input = tablesQuery.textFields["Email Input"]
                input.tap()
                
                // Check textfield
                XCTAssertEqual(String(describing: input.value!), "Email Input")
                
                // Fill textfield
                input.typeText("componentesdocliente@stone.com.br")
            }
            
            XCTContext.runActivity(named: "Check if email textfield is correct") { _ in
                let input = tablesQuery.textFields["componentesdocliente@stone.com.br"]
                
                // Click out of textfield to check if the field validate was corretly
                tablesQuery.children(matching: .other)["EMAIL INPUT"].children(matching: .other)["EMAIL INPUT"].tap()
                
                XCTAssertEqual(String(describing: input.value!), "componentesdocliente@stone.com.br")
            }
            
            self.attachment.screenshot("Get email success state screenshot", to: 4)
            
        }
        
        XCTContext.runActivity(named: "Clean textfield") { _ in
            
            XCTContext.runActivity(named: "Get filled field and erase inputed data") { _ in
                // Get textfield
                let input = tablesQuery.textFields["componentesdocliente@stone.com.br"]
                input.tap()
                
                // Clean textfield
                let deleteKey = app.keys["delete"]
                
                for _ in 0...32 {
                    deleteKey.tap()
                }
            }
            
            XCTContext.runActivity(named: "Check if email textfield is correct") { _ in
                let input = tablesQuery.textFields["Email Input"]
                XCTAssertEqual(String(describing: input.value!), "Email Input")
            }
            
            XCTContext.runActivity(named: "Check if email icon doesn't exist") { _ in
                // Feedback icon
                XCTAssertFalse(tablesQuery.buttons["input success icon"].exists)
                XCTAssertFalse(tablesQuery.buttons["input warning icon"].exists)
                XCTAssertFalse(tablesQuery.buttons["input error icon"].exists)
            }
            
        }
        
    }
    
    func test_5_email_incorrect() {

        XCTContext.runActivity(named: "fill textfield") { _ in
            
            XCTContext.runActivity(named: "Get email field and change value") { _ in
                // Get textfield
                let input = tablesQuery.textFields["Email Input"]
                input.tap()
                
                // Check textfield
                XCTAssertEqual(String(describing: input.value!), "Email Input")
                
                // Fill textfield
                input.typeText("componentesdocliente")
            }
            
            XCTContext.runActivity(named: "Check if email textfield is incorrect") { _ in
                let input = tablesQuery.textFields["componentesdocliente"]
                
                // Click out of textfield to check if the field validate was corretly
                tablesQuery.children(matching: .other)["EMAIL INPUT"].children(matching: .other)["EMAIL INPUT"].tap()
                
                XCTAssertNotEqual(String(describing: input.value!), "componentesdocliente@stone.com.br")
            }
            
            self.attachment.screenshot("Get email error state screenshot", to: 4)
            
            XCTContext.runActivity(named: "Check if email icon is success") { _ in
                // Feedback icon
                let feedbackIcon = tablesQuery.buttons["input error icon"]
                XCTAssertTrue(feedbackIcon.exists)
            }
            
        }
        
        XCTContext.runActivity(named: "Clean textfield") { _ in
            
            XCTContext.runActivity(named: "Get filled field and erase inputed data") { _ in
                // Get textfield
                let input = tablesQuery.textFields["componentesdocliente"]
                input.tap()
                
                // Clean textfield
                let deleteKey = app.keys["delete"]
                
                for _ in 0...19 {
                    deleteKey.tap()
                }
            }
            
            XCTContext.runActivity(named: "Check if email textfield is correct") { _ in
                let input = tablesQuery.textFields["Email Input"]
                XCTAssertEqual(String(describing: input.value!), "Email Input")
            }
            
        }
        
    }
    
}
