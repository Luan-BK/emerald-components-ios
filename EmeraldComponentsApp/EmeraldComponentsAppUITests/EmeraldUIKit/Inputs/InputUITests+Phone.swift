//
//  InputUITests+Phone.swift
//  EmeraldComponentsAppUITests
//
//  Created by João Mendes | Stone on 11/09/18.
//  Copyright © 2018 StoneCo. All rights reserved.
//

import XCTest

extension InputUITests {
    
    func test_6_phoneNumber() {
        
        XCTContext.runActivity(named: "Incompleted textfield") { _ in
            
            XCTContext.runActivity(named: "Get phone field and set value") { _ in
                // Get textfield
                let beforeInput = tablesQuery.textFields["Phone Input"]
                beforeInput.tap()
                
                // Check textfield
                let afterFirstClick = tablesQuery.textFields["("]
                XCTAssertEqual(String(describing: afterFirstClick.value!), "(")
                
                // Fill textfield
                let fillKey = app.keys["0"]
                
                for _ in 0...8 {
                    fillKey.tap()
                }
            }
            
            XCTContext.runActivity(named: "Check if phone textfield is correct") { _ in
                let input = tablesQuery.textFields["(00) 0000-000"]
                XCTAssertEqual(String(describing: input.value!), "(00) 0000-000")
            }
            
            XCTContext.runActivity(named: "Check if phone icon is correct") { _ in
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
            
            XCTContext.runActivity(named: "Check if phone icon is success") { _ in
                // Feedback icon
                let feedbackIcon = tablesQuery.buttons["input success icon"]
                XCTAssertTrue(feedbackIcon.exists)
            }
            
        }
        
        XCTContext.runActivity(named: "Clean textfield") { _ in
            
            XCTContext.runActivity(named: "Get filled field and erase inputed data") { _ in
                // Get textfield
                let input = tablesQuery.textFields["(00) 0000-0000"]
                input.tap()
                
                // Clean textfield
                let deleteKey = app.keys["Delete"]
                
                for _ in 0...13 {
                    deleteKey.tap()
                }
            }
            
            XCTContext.runActivity(named: "Check if phone textfield is correct") { _ in
                let input = tablesQuery.textFields["Phone Input"]
                XCTAssertEqual(String(describing: input.value!), "Phone Input")
            }
            
            XCTContext.runActivity(named: "Check if phone icon doesn't exist") { _ in
                // Feedback icon
                XCTAssertFalse(tablesQuery.buttons["input success icon"].exists)
                XCTAssertFalse(tablesQuery.buttons["input warning icon"].exists)
                XCTAssertFalse(tablesQuery.buttons["input error icon"].exists)
            }
            
        }
        
    }
    
}
