//
//  Input+DelegateTests.swift
//  EmeraldComponentsTests
//
//  Created by Luan Kalume | Stone on 22/06/2018.
//  Copyright © 2018 StoneCo. All rights reserved.
//

import XCTest
@testable import EmeraldComponents
@testable import InputMask

extension InputTests {
    
    // MARK: - MaskedTextFieldDelegateListener
    
    func testDidFillMandatoryCharacters_Completed() {
        let completion = true
        
        self.input.textField(self.input.inputField, didFillMandatoryCharacters: completion, didExtractValue: "")
        
        XCTAssertTrue(self.input.maskWasCompleted)
    }
    
    func testDidFillMandatoryCharacters_Uncompleted() {
        let completion = false
        
        self.input.textField(self.input.inputField, didFillMandatoryCharacters: completion, didExtractValue: "")
        
        XCTAssertFalse(self.input.maskWasCompleted)
    }
    
    func testShouldChangeCharactersInRange() {
        let previousState: EmeraldElementState = .success
        
        self.input.setState(previousState)
        let shouldChange = self.input.textField(self.input.inputField, shouldChangeCharactersIn: NSRange(), replacementString: "")
        
        XCTAssertTrue(shouldChange)
        XCTAssertNotEqual(self.input.state, previousState)
        XCTAssertEqual(self.input.state, .focus)
    }
    
    func testShouldBeginEditing() {
        XCTAssertTrue(self.input.textFieldShouldBeginEditing(self.input.inputField))
        
        self.input.setState(.disabled)
        
        XCTAssertFalse(self.input.textFieldShouldBeginEditing(self.input.inputField))
    }
    
    func testDidBeginEditing_NoInputSet() {
        let previousState: EmeraldElementState = .success
        
        self.input.inputText = ""
        self.input.setState(previousState)
        self.input.textFieldDidBeginEditing(self.input.inputField)
        
        XCTAssertNotEqual(self.input.state, previousState)
        XCTAssertEqual(self.input.state, .focus)
    }
    
    func testDidBeginEditing_WithInputSet() {
        let previousState: EmeraldElementState = .success
        
        self.input.inputText = "Some input"
        self.input.setState(previousState)
        self.input.textFieldDidBeginEditing(self.input.inputField)
        
        XCTAssertEqual(self.input.state, previousState)
    }
    
    func testDidEndEditing_Empty() {
        self.input.textFieldDidEndEditing(self.input.inputField)
        XCTAssertEqual(self.input.state, .regular)
        
        self.input.inputText = ""
        
        self.input.textFieldDidEndEditing(self.input.inputField)
        XCTAssertEqual(self.input.state, .regular)
    }
    
    func testDidEndEditing_WithMask_Invalid() {
        self.input.textFieldDidEndEditing(self.input.inputField)
        XCTAssertEqual(self.input.state, .regular)
        
        self.input.setMask(.custom(mask: "[00000]"))
        self.input.inputText = "123"
        
        self.input.textFieldDidEndEditing(self.input.inputField)
        XCTAssertEqual(self.input.state, .error)
    }
    
    func testDidEndEditing_WithMask_Valid() {
        self.input.textFieldDidEndEditing(self.input.inputField)
        XCTAssertEqual(self.input.state, .regular)
        
        self.input.setMask(.cpf)
        self.input.inputText = "123.456.789-00"
        self.input.maskWasCompleted = true
        
        self.input.textFieldDidEndEditing(self.input.inputField)
        XCTAssertEqual(self.input.state, .regular)
    }
    
    // MARK: - UIGestureRecognizerDelegate
    
    func testShouldRecognizeSimultaneouslyWith() {
        XCTAssertFalse(self.input.gestureRecognizer(UIGestureRecognizer(), shouldRecognizeSimultaneouslyWith: UIGestureRecognizer()))
    }
    
}
