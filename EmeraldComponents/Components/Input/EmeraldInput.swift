//
//  EmeraldInput.swift
//  EmeraldComponents
//
//  Created by Luan Kalume | Stone on 11/06/2018.
//  Copyright © 2018 StoneCo. All rights reserved.
//

import UIKit
import InputMask

public protocol EmeraldInputDelegate: class {
    /// Tells the delegate changes were made to the input.
    ///
    /// This method is called every time the input field content is changed.
    ///
    /// - parameters:
    ///   - input: The EmeraldInput where the change happend.
    ///   - text: The inputText after the change.
    ///   - valid: A boolean indicating whether the changes made the mask became valid.
    ///            If the EmeraldInput mask was set to `.none` this parameter is always `true`.
    func inputDidChange(_ input: EmeraldInput, text: String, valid: Bool)
}

@IBDesignable public class EmeraldInput: EmeraldView {
    
    // Elements
    @IBOutlet weak var inputField: UITextField!
    @IBOutlet weak var topTextLabel: UILabel!
    @IBOutlet weak var bottomTextLabel: UILabel!
    @IBOutlet weak var lineView: UIView!
    
    // Constraints
    @IBOutlet weak var lineViewHeight: NSLayoutConstraint!
    @IBOutlet weak var lineViewBottomSpacing: NSLayoutConstraint!
    
    // Mask
    internal var maskHandler: MaskedTextFieldDelegate!
    internal var maskWasCompleted: Bool = false
    
    public weak var inputDelegate: EmeraldInputDelegate?
    
    // Lazy properties
    internal lazy var inputButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage.inputImage(for: .regular), for: .normal)
        button.addTarget(self, action: #selector(self.didTouchRightButton), for: .touchUpInside)
        button.sizeToFit()
        self.inputField.rightView = button
        
        return button
    }()
    
    internal lazy var resignResponderRecognizer: UITapGestureRecognizer = {
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(tapRecognized(_:)))
        recognizer.cancelsTouchesInView = false
        recognizer.delegate = self
        
        return recognizer
    }()
    
    @discardableResult
    override public func resignFirstResponder() -> Bool {
        return self.inputField.resignFirstResponder()
    }
    
    /// Defines the expected size for the view when no constraint is specified.
    override open var intrinsicContentSize: CGSize {
        return CGSize(width: 72.0, height: 51.0)
    }
    
    /// A Boolean indicating whether the current inputText is valid
    /// after applying the current inputMask.
    public var isInputValid: Bool {
        return self.validateInput(for: self.inputMask)
    }
    
    public var errorMessage: String?
    
    internal private(set) var inputMask: EmeraldInputMask = .none {
        didSet {
            self.maskDidChange(to: self.inputMask)
        }
    }
    
    internal private(set) var state: EmeraldElementState = .regular {
        didSet {
            self.stateDidChange(self.state)
        }
    }
    
    // MARK: - Inspectables
    
    /// The text display above the input or as placeholder when empty.
    @IBInspectable public var title: String = "" {
        didSet {
            self.topTextLabel.text = title
            self.inputField.placeholder = title
        }
    }
    
    /// The text inside the UITextField.
    @IBInspectable public var inputText: String {
        get {
            return self.inputField.text ?? ""
        }
        set {
            self.inputField.text = newValue
            self.toggleTopLabel(newValue.isEmpty)
        }
    }
    
    /// The height for the bottom line view.
    ///
    /// Default value is 1.0
    @IBInspectable public var lineHeight: CGFloat = 1.0 {
        didSet {
            self.lineViewHeight.constant = lineHeight
        }
    }
    
    /// The text displayed below the bottom line.
    /// Gets automatically hidden when no text is set.
    @IBInspectable public var bottomText: String = "" {
        didSet {
            self.bottomTextLabel.text = bottomText
            self.toggleBottomLabel(bottomText.isEmpty)
        }
    }
    
    /// A Boolean value indicating whether the clear button should be shown
    /// while the user is typing.
    @IBInspectable public var showClear: Bool = false
    
    // An adapter to alow setting the state property in the IB.
    @IBInspectable var stateAdapter: Int {
        get {
            return self.state.rawValue
        }
        set {
            self.state = EmeraldElementState(rawValue: newValue) ?? .regular
        }
    }
    
    // MARK: - Init
    
    override internal func commonInit(_ aClass: AnyClass) {
        super.commonInit(aClass)

        self.title = ""
        self.inputText = ""
        self.bottomText = ""
        self.setState(.regular)
        self.setMask(.none)
    }
    
    // MARK: - Public configuration
    
    public func setKeyboardType(_ type: UIKeyboardType) {
        self.inputField.keyboardType = type
    }
    
    public func setState(_ state: EmeraldElementState) {
        self.state = state
    }
    
    public func setMask(_ mask: EmeraldInputMask) {
        self.inputMask = mask
    }
    
    public func setInput(_ text: String) {
        self.maskHandler.put(text: text, into: self.inputField)
    }
    
    public func setInputLeftImage(_ image: UIImage? = nil) {
        let rect = CGRect(x: 0, y: 0, width: 40, height: 48)
        let imageView =  UIImageView(frame: rect)
        
        imageView.contentMode = .scaleAspectFit
        imageView.image = image
        
        self.inputField.leftView = imageView
        self.inputField.leftViewMode = image != nil ? .always : .never
    }
    
    // MARK: - User interaction
    
    @objc internal func didTouchRightButton() {
        guard self.inputMask != .password else {
            self.inputField.isSecureTextEntry = !self.inputField.isSecureTextEntry
            self.toggleSecureText(self.inputField.isSecureTextEntry)
            return
        }
        self.inputText = ""
    }
    
    @IBAction internal func textChanged(_ sender: UITextField) {
        guard let text = self.inputField.text else { return }
        self.toggleTopLabel(text.isEmpty)
    }
    
    @IBAction internal func userTouched(_ sender: UITapGestureRecognizer) {
        self.inputField.becomeFirstResponder()
    }
    
    internal func stateDidChange(_ newState: EmeraldElementState) {
        self.setInputIcon(for: newState)
        self.applyColors(for: newState)
        self.handleBottomText(for: newState)
        
        self.inputField.isUserInteractionEnabled = newState == .disabled ? false : true
    }
    
    internal func maskDidChange(to mask: EmeraldInputMask) {
        switch mask {
        case .password:
            self.inputField.delegate = self
            self.inputField.isSecureTextEntry = true
            self.setInputIcon(for: self.state)
            
        case .email:
            self.inputField.delegate = self
            self.setKeyboardType(for: .email)
        
        case .currency:
            self.inputField.delegate = self
            self.setKeyboardType(for: .currency)
            
        case .none:
            self.inputField.delegate = self
            
        default:
            let maskFormat = EmeraldInputMask.getMaskFormat(for: mask)
            
            self.maskHandler = MaskedTextFieldDelegate(primaryFormat: maskFormat)
            self.maskHandler.listener = self
            self.maskHandler.autocomplete = true
            
            self.inputField.delegate = maskHandler
            self.setKeyboardType(for: mask)
        }
    }
    
    // MARK: - Aux
    
    internal func handleBottomText(for state: EmeraldElementState) {
        if state == .error, let errorString = self.errorMessage {
            self.bottomTextLabel.text = errorString
            self.toggleBottomLabel(false)
        } else {
            self.bottomTextLabel.text = self.bottomText
        }
    }
    
    internal func toggleTopLabel(_ hidden: Bool) {
        switch hidden {
        case true:
            self.topTextLabel.isHidden = true
        case false:
            self.topTextLabel.isHidden = false
        }
    }
    
    internal func toggleBottomLabel(_ hidden: Bool) {
        switch hidden {
        case true:
            self.bottomTextLabel.isHidden = true
            self.lineViewBottomSpacing.constant = 0
        case false:
            self.bottomTextLabel.isHidden = false
            self.lineViewBottomSpacing.constant = 8
        }
    }
    
    internal func applyColors(for state: EmeraldElementState) {
        self.lineView.backgroundColor = self.color(for: state)
        self.bottomTextLabel.textColor = self.bottomTextColor(for: state)
        self.inputField.textColor = self.inputTextColor(for: state)
    }
    
    internal func setInputIcon(for state: EmeraldElementState) {
        guard self.inputMask != .password else {
            self.inputButton.tintColor = UIColor.lightGray
            self.inputButton.setImage(UIImage.securePassword(self.inputField.isSecureTextEntry), for: .normal)
            self.inputField.rightViewMode = .always
            self.inputButton.isUserInteractionEnabled = true
            return
        }
        
        self.inputButton.setImage(UIImage.inputImage(for: state), for: .normal) 
        
        switch state {
        case .error, .warning, .success:
            self.inputField.rightViewMode = .always
            self.inputButton.isUserInteractionEnabled = false
        default:
            self.inputField.rightViewMode = self.showClear ? .whileEditing : .never
            self.inputButton.isUserInteractionEnabled = true
        }
    }
    
    internal func setKeyboardType(for mask: EmeraldInputMask) {
        switch mask {
        case .phone, .cpf, .cnpj, .cep, .currency:
            self.setKeyboardType(.numberPad)
        case .email:
            self.setKeyboardType(.emailAddress)
        default:
            self.setKeyboardType(.default)
        }
    }
    
    internal func color(for state: EmeraldElementState) -> UIColor {
        switch state {
        case .error:
            return UIColor.Palette.State.error
        case .warning:
            return UIColor.Palette.State.warning
        case .success:
            return UIColor.Palette.State.success
        case .disabled:
            return UIColor.Palette.Light.white3
        case .focus:
            return UIColor.Palette.State.focus
        default:
            return UIColor.Palette.Light.white4
        }
    }
    
    internal func inputTextColor(for state: EmeraldElementState) -> UIColor {
        switch state {
        case .inactive:
            return UIColor.Palette.Light.white5
        case .disabled:
            return UIColor.Palette.Light.white4
        default:
            return UIColor.Palette.Dark.black4
        }
    }
    
    internal func bottomTextColor(for state: EmeraldElementState) -> UIColor {
        switch state {
        case .success, .warning, .error:
            return self.color(for: state)
        case .disabled:
            return UIColor.Palette.Light.white4
        default:
            return UIColor.Palette.Light.white5
        }
    }
    
    internal func toggleSecureText(_ show: Bool) {
        self.inputButton.setImage(UIImage.securePassword(show), for: .normal)
    }
    
}

// MARK: - Mask
extension EmeraldInput {
    
    internal func validateInput(for mask: EmeraldInputMask) -> Bool {
        switch mask {
        case .none:
            return true
        case .email:
            // Use an RegEx for email validation only
            return self.validateString(self.inputText, with: "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}")
        case .password, .currency:
            return !self.inputText.isEmpty
        default:
            return self.maskWasCompleted
        }
    }
    
    private func validateString(_ text: String, with regExString: String) -> Bool {
        let predicate = NSPredicate(format:"SELF MATCHES %@", regExString)
        return predicate.evaluate(with: text)
    }
    
}
