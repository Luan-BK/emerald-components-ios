//
//  SlingInput+Delegate.swift
//  SlingBasicComponent
//
//  Created by Luan Kalume | Stone on 20/06/2018.
//  Copyright © 2018 StoneCo. All rights reserved.
//

import UIKit
import InputMask

// MARK: - MaskedTextFieldDelegateListener

extension SlingInput: MaskedTextFieldDelegateListener {
    
    public func textField(_ textField: UITextField, didFillMandatoryCharacters complete: Bool, didExtractValue value: String) {
        self.maskWasCompleted = complete
        self.toggleTopLabel(textField.text?.isEmpty ?? true)
        self.inputDelegate?.inputDidChange(self, text: value, valid: complete)
    }
    
    public func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        self.setState(.focus)
        
        guard self.inputMask != .currency else {
            if let currentText = textField.text, let textRange = Range(range, in: currentText) {
                // Replaces the incomming text in the string.
                let input = currentText.replacingCharacters(in: textRange, with: string)
                inputField.text = inputField.text?.currencyFormatter(input)
                self.inputDelegate?.inputDidChange(self, text: inputField.text!, valid: true)
            }
            return false
        }
        
        // In case no mask was set, we fall back here
        guard self.inputMask != .none && self.inputMask != .email else {
            // Looks for valid text in input and the specified textRange
            if let currentText = textField.text, let textRange = Range(range, in: currentText) {
                // Replaces the incomming text in the string.
                let input = currentText.replacingCharacters(in: textRange, with: string)
                self.inputDelegate?.inputDidChange(self, text: input, valid: true)
            }
            
            return true
        }
        
        return true
    }
    
    public func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        return self.state != .disabled
    }
    
    public func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField.text?.isEmpty == true || self.state == .regular {
            self.setState(.focus)
        }
        textField.window?.addGestureRecognizer(self.resignResponderRecognizer)
    }
    
    public func textFieldDidEndEditing(_ textField: UITextField) {
        let nextState: SlingElementState
        
        if textField.text?.isEmpty == true {
            nextState = .regular
        } else {
            nextState = self.isInputValid ? .regular : .error
        }
        
        self.setState(nextState)
        
        textField.window?.removeGestureRecognizer(self.resignResponderRecognizer)
    }
    
}

// MARK: - UIGestureRecognizerDelegate

extension SlingInput: UIGestureRecognizerDelegate {
    
    @objc public func tapRecognized(_ gesture: UITapGestureRecognizer) {
        if gesture.state == .ended {
            self.inputField.resignFirstResponder()
        }
    }
    
    public func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return false
    }
    
    public func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        // Prevents receiveing touches from UIControls or UINavigationBars
        guard touch.view?.isKind(of: UIControl.self) == false, touch.view?.isKind(of: UINavigationBar.self) == false else {
            return false
        }
        
        return true
    }
    
}
