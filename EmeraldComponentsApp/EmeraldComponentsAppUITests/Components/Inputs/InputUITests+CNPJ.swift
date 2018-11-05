//
//  InputUITests+CNPJ.swift
//  EmeraldComponentsAppUITests
//
//  Created by João Mendes | Stone on 11/09/18.
//  Copyright © 2018 StoneCo. All rights reserved.
//

import XCTest

extension InputUITests {
    
    func test_4_CNPJ() {
        
        self.attachment.screenshot("Input-7: Get CNPJ empty state screenshot", to: 3)
        
        XCTContext.runActivity(named: "Incompleted textfield") { _ in
            
            XCTContext.runActivity(named: "Get CNPJ field and set value") { _ in
                // Get textfield
                let input = tablesQuery.textFields["CNPJ Input"]
                input.tap()
                
                // Check textfield
                XCTAssertEqual(String(describing: input.value!), "CNPJ Input")
                
                // Fill textfield
                let fillKey = app.keys["0"]
                
                for _ in 0...12 {
                    fillKey.tap()
                }
            }
            
            XCTContext.runActivity(named: "Check if CNPJ textfield is correct") { _ in
                let input = tablesQuery.textFields["00.000.000/0000-0"]
                XCTAssertEqual(String(describing: input.value!), "00.000.000/0000-0")
            }
            
            XCTContext.runActivity(named: "Check if CNPJ icon is correct") { _ in
                // Feedback icon
                let feedbackIcon = tablesQuery.buttons["input warning icon"]
                XCTAssertTrue(feedbackIcon.exists)
            }
            
        }
        
        self.attachment.screenshot("Input-8: Get CNPJ warning state screenshot", to: 3)
        
        XCTContext.runActivity(named: "Fill textfield") { _ in
            
            XCTContext.runActivity(named: "Completes textfield") { _ in
                let fillKey = app.keys["0"]
                fillKey.tap()
            }
            
            XCTContext.runActivity(named: "Check if CNPJ icon is success") { _ in
                // Feedback icon
                let feedbackIcon = tablesQuery.buttons["input success icon"]
                XCTAssertTrue(feedbackIcon.exists)
            }
            
        }
        
        self.attachment.screenshot("Input-9: Get CNPJ success state screenshot", to: 3)
        
        XCTContext.runActivity(named: "Clean textfield") { _ in
            
            XCTContext.runActivity(named: "Get filled field and erase inputed data") { _ in
                // Get textfield
                let input = tablesQuery.textFields["00.000.000/0000-00"]
                input.tap()
                
                // Clean textfield
                let deleteKey = app.keys["Delete"]
                
                for _ in 0...17 {
                    deleteKey.tap()
                }
            }
            
            XCTContext.runActivity(named: "Check if CNPJ textfield is correct") { _ in
                let input = tablesQuery.textFields["CNPJ Input"]
                XCTAssertEqual(String(describing: input.value!), "CNPJ Input")
            }
            
            XCTContext.runActivity(named: "Check if CNPJ icon doesn't exist") { _ in
                // Feedback icon
                XCTAssertFalse(tablesQuery.buttons["input success icon"].exists)
                XCTAssertFalse(tablesQuery.buttons["input warning icon"].exists)
                XCTAssertFalse(tablesQuery.buttons["input error icon"].exists)
            }
            
        }
        
    }
    
}
