//
//  InputUITests+CEP.swift
//  EmeraldComponentsAppUITests
//
//  Created by João Mendes | Stone on 11/09/18.
//  Copyright © 2018 StoneCo. All rights reserved.
//

import XCTest

extension InputUITests {
    
    func test_7_CEP() {

        self.attachment.screenshot("Get CEP empty state screenshot", to: 6)
        
        XCTContext.runActivity(named: "Incompleted textfield") { _ in
            
            XCTContext.runActivity(named: "Get CEP field and set value") { _ in
                // Get textfield
                let input = tablesQuery.textFields["CEP Input"]
                input.tap()
                
                // Check textfield
                XCTAssertEqual(String(describing: input.value!), "CEP Input")
                
                // Fill textfield
                let fillKey = app.keys["0"]
                
                for _ in 0...6 {
                    fillKey.tap()
                }
            }
            
            XCTContext.runActivity(named: "Check if CEP textfield is correct") { _ in
                let input = tablesQuery.textFields["00000-00"]
                XCTAssertEqual(String(describing: input.value!), "00000-00")
            }
            
            XCTContext.runActivity(named: "Check if CEP icon is correct") { _ in
                // Feedback icon
                let feedbackIcon = tablesQuery.buttons["input warning icon"]
                XCTAssertTrue(feedbackIcon.exists)
            }
            
        }
        
        self.attachment.screenshot("Get CEP warning state screenshot", to: 6)
        
        XCTContext.runActivity(named: "Fill textfield") { _ in
            
            XCTContext.runActivity(named: "Completes textfield") { _ in
                let fillKey = app.keys["0"]
                fillKey.tap()
            }
            
            XCTContext.runActivity(named: "Check if CEP icon is success") { _ in
                // Feedback icon
                let feedbackIcon = tablesQuery.buttons["input success icon"]
                XCTAssertTrue(feedbackIcon.exists)
            }
            
        }
        
        self.attachment.screenshot("Get CEP success state screenshot", to: 6)
        
        XCTContext.runActivity(named: "Clean textfield") { _ in
            
            XCTContext.runActivity(named: "Get filled field and erase inputed data") { _ in
                // Get textfield
                let input = tablesQuery.textFields["00000-000"]
                input.tap()
                
                // Clean textfield
                let deleteKey = app.keys["Delete"]
                
                for _ in 0...8 {
                    deleteKey.tap()
                }
            }
            
            XCTContext.runActivity(named: "Check if CEP textfield is correct") { _ in
                let input = tablesQuery.textFields["CEP Input"]
                XCTAssertEqual(String(describing: input.value!), "CEP Input")
            }
            
            XCTContext.runActivity(named: "Check if CEP icon doesn't exist") { _ in
                // Feedback icon
                XCTAssertFalse(tablesQuery.buttons["input success icon"].exists)
                XCTAssertFalse(tablesQuery.buttons["input warning icon"].exists)
                XCTAssertFalse(tablesQuery.buttons["input error icon"].exists)
            }
            
        }
        
    }
    
}
