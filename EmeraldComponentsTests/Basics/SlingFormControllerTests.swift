//
//  EmeraldFormControllerTests.swift
//  EmeraldComponentsTests
//
//  Created by Luan Kalume | Stone on 15/06/2018.
//  Copyright © 2018 StoneCo. All rights reserved.
//

import XCTest
@testable import EmeraldComponents

class EmeraldFormControllerTests: XCTestCase {
    
    func testValidation_True() {
        let validList: [InputMock] = [InputMock(11),InputMock(42), InputMock(25)]
        
        let validation = EmeraldFormController.validateFields(validList)
        
        XCTAssertTrue(validation)
    }
    
    func testValidation_False() {
        let invalidList: [InputMock] = [InputMock(11),InputMock(42), InputMock(25), InputMock(5)]
        
        let validation = EmeraldFormController.validateFields(invalidList)
        
        XCTAssertFalse(validation)
    }
    
    func testValidation_Empty() {
        let emptyList: [InputMock] = []
        
        let validation = EmeraldFormController.validateFields(emptyList)
        
        XCTAssertTrue(validation)
    }
    
}

class InputMock {
    let count: Int
    
    init(_ count: Int) {
        self.count = count
    }
}

extension InputMock: InputField {
    
    var isValid: Bool {
        return self.count > 10
    }
    
}
