//
//  InputUITests+CPF.swift
//  EmeraldComponentsAppUITests
//
//  Created by João Mendes | Stone on 11/09/18.
//  Copyright © 2018 StoneCo. All rights reserved.
//

import XCTest

extension InputUITests {
    
    func test_3_CPF() {
        
        self.launch()
        
        XCTContext.runActivity(named: "Incompleted textfield") { _ in
            
            XCTContext.runActivity(named: "Get CPF field and change value") { _ in
                // Get CNPJ field
                let beforeInput = tablesQuery.textFields["CPF Input"]
                beforeInput.tap()
                
                // Check text field
                XCTAssertEqual(String(describing: beforeInput.value!), "CPF Input")
                
                // Fill CNPJ field
                let fillKey = app.keys["0"]
                
                for _ in 0...9 {
                    fillKey.tap()
                }
            }
            
            XCTContext.runActivity(named: "Check if CPF textfield is correct") { _ in
                let afterInput = tablesQuery.textFields["000.000.000-0"]
                XCTAssertEqual(String(describing: afterInput.value!), "000.000.000-0")
            }
            
            XCTContext.runActivity(named: "Check if CPF icon is correct") { _ in
                // Feedback icon
                let feedbackIcon = tablesQuery.buttons["input error icon"]
                XCTAssertTrue(feedbackIcon.exists)
            }
            
        }
        
        XCTContext.runActivity(named: "Fill textfield") { _ in
            
            XCTContext.runActivity(named: "Completes textfield") { _ in
                let fillKey = app.keys["0"]
                fillKey.tap()
            }
            
            XCTContext.runActivity(named: "Check if CPF icon is success") { _ in
                // Feedback icon
                let feedbackIcon = tablesQuery.buttons["input success icon"]
                XCTAssertTrue(feedbackIcon.exists)
            }
            
        }
        
        XCTContext.runActivity(named: "Clean textfield") { _ in
            
            XCTContext.runActivity(named: "Get filled field and erase inputed data") { _ in
                // Get CNPJ field
                let afterInputedData = tablesQuery.textFields["000.000.000-00"]
                afterInputedData.tap()
                
                // Clean field
                let deleteKey = app.keys["Delete"]
                
                for _ in 0...13 {
                    deleteKey.tap()
                }
            }
            
            XCTContext.runActivity(named: "Check if CPF textfield is correct") { _ in
                let afterInput = tablesQuery.textFields["CPF Input"]
                XCTAssertEqual(String(describing: afterInput.value!), "CPF Input")
            }
            
            XCTContext.runActivity(named: "Check if CPF icon doen't exist") { _ in
                // Feedback icon
                XCTAssertFalse(tablesQuery.buttons["input success icon"].exists)
                XCTAssertFalse(tablesQuery.buttons["input warning icon"].exists)
                XCTAssertFalse(tablesQuery.buttons["input error icon"].exists)
            }
            
        }
        
    }
    
}
