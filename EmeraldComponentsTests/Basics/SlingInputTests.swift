//
//  EmeraldInputTests.swift
//  EmeraldComponentsTests
//
//  Created by Luan Kalume | Stone on 14/06/2018.
//  Copyright © 2018 StoneCo. All rights reserved.
//

import XCTest
@testable import EmeraldComponents
@testable import InputMask

class EmeraldInputTests: XCTestCase {
    
    internal var input: EmeraldInput!
    
    override func setUp() {
        super.setUp()
        self.input = EmeraldInput(frame: CGRect(x: 0.0, y: 0.0, width: 100.0, height: 60.0))
    }
    
    override func tearDown() {
        self.input = nil
        super.tearDown()
    }
    
    // Lazys
    
    func testInputButton() {
        let button = self.input.inputButton
        
        XCTAssertEqual(button.image(for: .normal), UIImage.inputImage(for: .regular))
        XCTAssertEqual(self.input.inputField.rightView, button)
    }
    
    func testResignResponderRecognizer() {
        let recognizer = self.input.resignResponderRecognizer
        
        XCTAssertFalse(recognizer.cancelsTouchesInView)
        XCTAssertNotNil(recognizer.delegate)
    }
    
    // Properties
    
    func testIntrinsicContentSize() {
        XCTAssertEqual(self.input.intrinsicContentSize, CGSize(width: 72.0, height: 51.0))
    }
    
    func testIsInputValid_True() {
        self.input.setMask(.email)
        
        self.input.inputText = "john_doe@mail.com"
        let validation = self.input.isInputValid
        
        XCTAssertTrue(validation)
    }
    
    func testIsInputValid_False() {
        self.input.setMask(.email)
        
        self.input.inputText = "john_doe@@@@mail.com"
        let validation = self.input.isInputValid
        
        XCTAssertFalse(validation)
    }
    
    // Inspectables
    
    func testTitle() {
        let newTitle = "Username"
        
        self.input.title = newTitle
        
        XCTAssertEqual(self.input.topTextLabel.text, newTitle)
        XCTAssertEqual(self.input.inputField.placeholder, newTitle)
    }
    
    func testInputText() {
        let newText = "John Doe"
        
        self.input.inputText = newText
        
        XCTAssertEqual(self.input.inputField.text, newText)
    }
    
    func testLineHeight() {
        let newHeight: CGFloat = 3.0
        
        self.input.lineHeight = newHeight
        
        XCTAssertEqual(self.input.lineViewHeight.constant, newHeight)
    }
    
    func testBottomText() {
        let newText = "The name you'd like to be called by."
        
        self.input.bottomText = newText
        
        XCTAssertEqual(self.input.bottomTextLabel.text, newText)
    }
    
    func testStateAdapter() {
        let newState: Int = 6
        let invalidState: Int = 324
        
        XCTAssertEqual(self.input.stateAdapter, 0)
        
        self.input.stateAdapter = newState
        
        XCTAssertEqual(self.input.state, .disabled)
        
        self.input.stateAdapter = invalidState
        
        XCTAssertEqual(self.input.state, .regular)
    }
    
    // Init
    
    func testCommonInitOverride() {
        XCTAssertNotNil(self.input.inputField)
        XCTAssertEqual(self.input.title, "")
        XCTAssertEqual(self.input.inputText, "")
        XCTAssertEqual(self.input.bottomText, "")
        XCTAssertEqual(self.input.state, .regular)
    }
    
    // Configuration
    
    func testSetKeyboardType() {
        let newKeyboard: UIKeyboardType = .namePhonePad
        
        self.input.setKeyboardType(newKeyboard)
        
        XCTAssertEqual(self.input.inputField.keyboardType, newKeyboard)
    }
    
    func testSetState() {
        let newState: EmeraldElementState = .error
        
        self.input.setState(newState)
        
        XCTAssertEqual(self.input.state, newState)
    }
    
    func testSetMask() {
        let newMask: EmeraldInputMask = .cpf
        
        self.input.setMask(newMask)
        
        XCTAssertEqual(self.input.inputMask, newMask)
    }
    
    func testSetInput() {
        let mask = EmeraldInputMask.phone
        let text = "21123456789"
        
        self.input.setMask(mask)
        self.input.setInput(text)
        
        XCTAssertEqual(self.input.inputText, "(21) 1234-56789")
    }
    
    // MARK: - User interaction
    
    func testDidTouchRightButton() {
        self.input.inputText = "Some text"
        
        self.input.didTouchRightButton()
        
        XCTAssertEqual(self.input.inputText, "")
    }
    
    func testDidTouchRightButton_WithPasswordMask() {
        self.input.setMask(.password)
        
        let previousSecureEntry = self.input.inputField.isSecureTextEntry
        self.input.didTouchRightButton()
        
        XCTAssertNotEqual(self.input.inputField.isSecureTextEntry, previousSecureEntry)
    }
    
    func testTextChanged_fromEmpty() {
        self.input.inputText = "Some text"
        
        self.input.textChanged(self.input.inputField)
        
        XCTAssertFalse(self.input.topTextLabel.isHidden)
    }
    
    func testTextChanged_toEmpty() {
        self.input.inputText = ""
        
        self.input.textChanged(self.input.inputField)
        
        XCTAssertTrue(self.input.topTextLabel.isHidden)
    }
    
    func testMaskDidChange() {
        let newMask: EmeraldInputMask = .cpf
        
        self.input.maskDidChange(to: newMask)
        
        XCTAssertNotNil(self.input.maskHandler.listener)
        XCTAssertTrue(self.input.maskHandler.autocomplete)
        XCTAssertNotNil(self.input.inputField.delegate)
    }
    
    func testMaskDidChange_ToPassword() {
        let newMask: EmeraldInputMask = .password
        
        self.input.maskDidChange(to: newMask)
        
        XCTAssertTrue(self.input.inputField.isSecureTextEntry)
        XCTAssertNotNil(self.input.inputField.delegate)
    }
    
    func testStateDidChange() {
        let newState: EmeraldElementState = .success
        let disabledState: EmeraldElementState = .disabled
        
        self.input.stateDidChange(newState)
        XCTAssertTrue(self.input.inputField.isUserInteractionEnabled)
        
        self.input.stateDidChange(disabledState)
        XCTAssertFalse(self.input.inputField.isUserInteractionEnabled)
    }
    
    // MARK: - Mask
    
    func testValidateInput_MaskNone() {
        let maskNone = EmeraldInputMask.none
        
        let validation = self.input.validateInput(for: maskNone)
        
        XCTAssertTrue(validation)
    }
    
    func testValidateInput_MaskEmail() {
        let maskEmail = EmeraldInputMask.email
        let validEmail = "john_doe@mail.com"
        let invalidEmail = "john_doe@mail@.com"
        var validation: Bool = false
        
        self.input.inputText = validEmail
        validation = self.input.validateInput(for: maskEmail)
        
        XCTAssertTrue(validation)
        
        self.input.inputText = invalidEmail
        validation = self.input.validateInput(for: maskEmail)
        
        XCTAssertFalse(validation)
    }
    
    func testValidateInput_Completed() {
        let completed = true
        
        self.input.maskWasCompleted = completed
        let validation = self.input.validateInput(for: .cpf)
        
        XCTAssertTrue(validation)
    }
    
    func testValidateInput_NotCompleted() {
        let completed = false
        
        self.input.maskWasCompleted = completed
        let validation = self.input.validateInput(for: .cpf)
        
        XCTAssertFalse(validation)
    }
    
    func testValidateInput_PasswordMask() {
        let password = "123456"
        
        self.input.inputText = password
        let validation = self.input.validateInput(for: .password)
        
        XCTAssertTrue(validation)
    }
    
    // MARK: - Aux
    
    func testHandleBottomText_NoErrorMessage() {
        let bottomText = "Some text here"
        self.input.bottomText = bottomText
        
        self.input.handleBottomText(for: .regular)
        
        XCTAssertEqual(self.input.bottomTextLabel.text, bottomText)
        XCTAssertFalse(self.input.bottomTextLabel.isHidden)
    }
    
    func testHandleBottomText_WithErrorMessage() {
        let bottomText = "Some text here"
        let errorMessage = "This is an error!"
        self.input.bottomText = bottomText
        self.input.errorMessage = errorMessage
        
        self.input.handleBottomText(for: .error)
        
        XCTAssertEqual(self.input.bottomTextLabel.text, errorMessage)
        XCTAssertFalse(self.input.bottomTextLabel.isHidden)
    }

    func testToggleTopLabel() {
        self.input.toggleTopLabel(true)
        XCTAssertTrue(self.input.topTextLabel.isHidden)
        
        self.input.toggleTopLabel(false)
        XCTAssertFalse(self.input.topTextLabel.isHidden)
    }
    
    func testResignFirstResponder() {
        let resign = self.input.resignFirstResponder()
        
        XCTAssertFalse(resign)
    }
    
    func testToggleBottomLabel() {
        self.input.toggleBottomLabel(true)
        XCTAssertTrue(self.input.bottomTextLabel.isHidden)
        XCTAssertEqual(self.input.lineViewBottomSpacing.constant, 0)
        
        self.input.toggleBottomLabel(false)
        XCTAssertFalse(self.input.bottomTextLabel.isHidden)
        XCTAssertEqual(self.input.lineViewBottomSpacing.constant, 8)
    }
    
    func testSetInputIcon() {
        let disabledRightButtonStates: [EmeraldElementState] = [.error, .success, .warning]
        let enabledRightButtonStates: [EmeraldElementState] = [.regular, .focus, .inactive, .disabled]
        
        for state in disabledRightButtonStates {
            self.input.setInputIcon(for: state)
            XCTAssertFalse(self.input.inputButton.isUserInteractionEnabled)
            XCTAssertEqual(self.input.inputField.rightViewMode, .always)
        }
        
        self.input.showClear = true
        for state in enabledRightButtonStates {
            self.input.setInputIcon(for: state)
            XCTAssertTrue(self.input.inputButton.isUserInteractionEnabled)
            XCTAssertEqual(self.input.inputField.rightViewMode, .whileEditing)
        }
        
        self.input.showClear = false
        for state in enabledRightButtonStates {
            self.input.setInputIcon(for: state)
            XCTAssertTrue(self.input.inputButton.isUserInteractionEnabled)
            XCTAssertEqual(self.input.inputField.rightViewMode, .never)
        }
    }
    
    func testSetKeyboardTypeForMask() {
        let numbersMasks: [EmeraldInputMask] = [.phone, .cpf, .cnpj, .cep]
        let defaultMaks: [EmeraldInputMask] = [.none, .custom(mask: "")]
        let emailMask: EmeraldInputMask = .email
        
        for mask in numbersMasks {
            self.input.setKeyboardType(for: mask)
            XCTAssertEqual(self.input.inputField.keyboardType, .numberPad)
        }
        
        for mask in defaultMaks {
            self.input.setKeyboardType(for: mask)
            XCTAssertEqual(self.input.inputField.keyboardType, .default)
        }
        
        self.input.setKeyboardType(for: emailMask)
        XCTAssertEqual(self.input.inputField.keyboardType, .emailAddress)
    }
    
}
