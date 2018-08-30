//
//  SlingPicker.swift
//  SlingBasicComponent
//
//  Created by Luan Kalume | Stone on 21/06/2018.
//  Copyright © 2018 StoneCo. All rights reserved.
//

import Foundation
import UIKit

public class SlingPicker: SlingInput {
    
    /// The limit when the pickerView is replaced for the filter screen.
    fileprivate let optionsThreshold = 10
    
    /// The current selected option, or nil in case no selection was done.
    public var selectedOption: PickerData? {
        didSet {
            self.inputText = selectedOption?.identifier ?? ""
        }
    }
    
    /// A boolean indicating whether the user has selected one of the options.
    override public var isInputValid: Bool {
        return !self.inputText.isEmpty
    }
    
    public weak var delegate: SlingPickerDelegate?
    public weak var dataSource: SlingPickerDataSource?
    
    override internal func commonInit(_ aClass: AnyClass) {
        super.commonInit(SlingInput.self)
        
        let picker = UIPickerView(frame: CGRect.zero)
        picker.delegate = self
        picker.dataSource = self
        
        self.inputField.inputView = picker
        self.inputField.tintColor = .clear
        self.inputButton.tintColor = ThemeManager.currentTheme().tintColor
    }
    
    public func startSelection() {
        self.inputField.becomeFirstResponder()
    }
    
    override internal func setInputIcon(for state: SlingElementState) {
        switch state {
        case .success, .error, .warning:
            super.setInputIcon(for: state)
        default:
            self.inputField.rightViewMode = .always
            self.inputButton.isUserInteractionEnabled = false
            
            self.inputButton.setImage(self.pickerButtonImage(expanded: false), for: .normal)
        }
    }
    
    // MARK: - Aux
    
    internal func pickerButtonImage(expanded: Bool) -> UIImage? {
        let image = UIImage(named: "disclosure-indicator-icon", in: Bundle.basic, compatibleWith: nil)
        
        if expanded {
            return image?.rotate(radians: (3 * .pi)/2).withRenderingMode(.alwaysTemplate)
        } else {
            return image?.rotate(radians: (.pi)/2).withRenderingMode(.alwaysTemplate)
        }
    }
}

// MARK: - UITextFieldDelegate

extension SlingPicker {
    
    override public func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        guard let dataSource = self.dataSource else { return false }
        
        guard dataSource.pickerOptions(for: self).count < self.optionsThreshold else {
            if let searchController = UIStoryboard(name: "SearchList", bundle: Bundle.basic).instantiateInitialViewController() as? SlingSearchList {
                searchController.delegate = self
                searchController.selectedOption = self.selectedOption
                self.parentViewController?.present(searchController, animated: true, completion: nil)
            }
            return false
        }
        return true
    }
    
    override public func textFieldDidBeginEditing(_ textField: UITextField) {
        super.textFieldDidBeginEditing(textField)
        self.setState(.focus)
        self.inputButton.setImage(self.pickerButtonImage(expanded: true), for: .normal)
    }
    
    override public func textFieldDidEndEditing(_ textField: UITextField) {
        super.textFieldDidEndEditing(textField)
        self.inputButton.setImage(self.pickerButtonImage(expanded: false), for: .normal)
    }
}

// MARK: - SearchListDelegate

extension SlingPicker: SearchListDelegate {
    
    public var dataList: [PickerData] {
        return self.dataSource?.pickerOptions(for: self) ?? []
    }
    
    public func didSelectOption(_ option: PickerData) {
        self.selectedOption = option
        self.setState(.regular)
        self.delegate?.didSelectOption(self, option: option)
        self.inputDelegate?.inputDidChange(self, text: self.inputText, valid: self.isInputValid)
    }
    
    public func didDeselectOption(_ option: PickerData) {
        self.selectedOption = nil
        self.delegate?.didDeselectOption(self, option: option)
        self.inputDelegate?.inputDidChange(self, text: self.inputText, valid: self.isInputValid)
    }
    
}

// MARK: - UIPickerView

extension SlingPicker: UIPickerViewDelegate, UIPickerViewDataSource {
    
    public func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        guard let options = self.dataSource?.pickerOptions(for: self) else {
            return 0
        }
        
        // Adds 1 to options for the no value option
        return options.count + 1
    }
    
    public func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        guard let options = self.dataSource?.pickerOptions(for: self) else {
            return nil
        }
        
        guard row != 0 else {
            return "---"
        }
        
        return options[row - 1].identifier
    }
    
    public func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.inputDelegate?.inputDidChange(self, text: self.inputText, valid: false)
        
        guard row != 0 else {
            self.inputText = ""
            if let deselectedOption = self.selectedOption {
                self.delegate?.didDeselectOption(self, option: deselectedOption)
            }
            self.selectedOption = nil
            return
        }
        
        guard let selectedOption = self.dataSource?.pickerOptions(for: self)[row - 1] else {
            self.selectedOption = nil
            return
        }
        
        self.delegate?.didSelectOption(self, option: selectedOption)
        self.inputText = selectedOption.identifier
        self.selectedOption = selectedOption
    }
}
