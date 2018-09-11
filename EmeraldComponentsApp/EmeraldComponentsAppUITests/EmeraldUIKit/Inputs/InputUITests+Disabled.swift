//
//  InputUITests+Disabled.swift
//  EmeraldComponentsAppUITests
//
//  Created by João Mendes | Stone on 11/09/18.
//  Copyright © 2018 StoneCo. All rights reserved.
//

import XCTest

extension InputUITests {
    
    func test_1_disabled() {
        
        self.launch()
        
        XCTContext.runActivity(named: "Get disabled field and try to set value") { _ in
            // Get textfield
            let input = tablesQuery.textFields["Disabled Input"]
            input.tap()
            
            // Check textfield
            XCTAssertEqual(String(describing: input.value!), "Disabled Input")
        }
        
    }
    
}
