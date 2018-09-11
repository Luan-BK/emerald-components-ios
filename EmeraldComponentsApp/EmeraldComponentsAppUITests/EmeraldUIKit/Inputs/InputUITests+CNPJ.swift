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
        
        XCTContext.runActivity(named: "Incompleted textfield") { _ in
            
            XCTContext.runActivity(named: "Get CNPJ field and change value") { _ in
                // Get CNPJ field
                let beforeInput = tablesQuery.textFields["CNPJ Input"]
                beforeInput.tap()
                
                // Check text field
                XCTAssertEqual(String(describing: beforeInput.value!), "CNPJ Input")
                
                // Fill CNPJ field
                let fillKey = app.keys["0"]
                
                for _ in 0...12 {
                    fillKey.tap()
                }
            }
            
            XCTContext.runActivity(named: "Check if CNPJ textfield is correct") { _ in
                let afterInput = tablesQuery.textFields["00.000.000/0000-0"]
                XCTAssertEqual(String(describing: afterInput.value!), "00.000.000/0000-0")
            }
            
            XCTContext.runActivity(named: "Check if CNPJ icon is correct") { _ in
                // Feedback icon
                let feedbackIcon = tablesQuery.buttons["input warning icon"]
                XCTAssertTrue(feedbackIcon.exists)
            }
            
        }
        
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
        
        XCTContext.runActivity(named: "Clean textfield") { _ in
            
            XCTContext.runActivity(named: "Get filled field and erase inputed data") { _ in
                // Get CNPJ field
                let afterInputedData = tablesQuery.textFields["00.000.000/0000-00"]
                afterInputedData.tap()
                
                // Clean field
                let deleteKey = app.keys["Delete"]
                
                for _ in 0...17 {
                    deleteKey.tap()
                }
            }
            
            XCTContext.runActivity(named: "Check if CNPJ textfield is correct") { _ in
                let afterInput = tablesQuery.textFields["CNPJ Input"]
                XCTAssertEqual(String(describing: afterInput.value!), "CNPJ Input")
            }
            
            XCTContext.runActivity(named: "Check if CNPJ icon doen't exist") { _ in
                // Feedback icon
                XCTAssertFalse(tablesQuery.buttons["input success icon"].exists)
                XCTAssertFalse(tablesQuery.buttons["input warning icon"].exists)
                XCTAssertFalse(tablesQuery.buttons["input error icon"].exists)
            }
            
        }
        
    }
    
}
