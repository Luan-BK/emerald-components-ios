//
//  EmeraldLabel.swift
//  EmeraldComponents
//
//  Created by João Mendes | Stone on 22/10/18.
//  Copyright © 2018 StoneCo. All rights reserved.
//

import UIKit

/// An enum representing the possible types of an EmeraldLabel.
public enum EmeraldLabelType: Int {
    /// The default type of label. It displays the background color filled according to the selected state.
    case fill = 1
    /// It displays transparent background color and a border coloured according to the selected state.
    case outline
    /// It displays a text with a bullet image. It's used to demonstrate minor priority.
    case text
    /// It displays a text with an emerald assets. It's used to report data
    case image
}

/// An enum representing the possible states of an EmeraldLabel
public enum EmeraldLabelState: Int {
    /// Used to show any information to the user.
    case neutral = 1
    /// Used to indicate a problem to the user.
    case error
    /// Used to indicate a warning to the user.
    case warning
    /// Used to indicate a success to the user.
    case success
    /// Used to show an info to the user.
    case info
}

@IBDesignable
public class EmeraldLabel: UIView {
    
    // MARK: - Properties
    
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var iconImage: UIImageView!
    @IBOutlet weak var textLabel: UILabel!
    
    @IBOutlet weak var iconImageHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var textLabelLeadingConstraint: NSLayoutConstraint!
    
    internal private(set) var type: EmeraldLabelType = .fill {
        didSet {
            self.typeOrStyleDidChange(self.state, self.type)
        }
    }

    internal private(set) var state: EmeraldLabelState = .neutral {
        didSet {
            self.typeOrStyleDidChange(self.state, self.type)
        }
    }
    
    // MARK: - Aux properties
    
    /// Used to set a default value for icon image
    internal var auxIconLabel: String = "icon-dot"
    
    /// Used to set a default value for text label
    internal var auxTextLabel: String = "Label"
    
    // MARK: - Init

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.xibSetup()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.xibSetup()
    }
    
    private func xibSetup() {
        Bundle.basic.loadNibNamed(String(describing: EmeraldLabel.self), owner: self, options: nil)
        
        addSubview(self.contentView)
        
        self.contentView.frame = self.bounds
        self.contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        
        self.setDefaultValuesToLabels()
    }
    
    internal func setDefaultValuesToLabels() {
        self.textLabel.layer.cornerRadius = 15.0
        self.textLabel.layer.masksToBounds = true
        self.textLabel.font = UIFont.systemFont(ofSize: 15.0, weight: .heavy)
    }
    
    // MARK: - Public configuration
    
    /// Sets the icon that will be displayed to the left of label.
    ///
    /// - Parameter name: The name of an image inside emerald project assets. You can't choose any image. Only emerald images
    public func setIcon(name: String) {
        self.auxIconLabel = name
    }
    
    /// Sets the text to be displayed by the EmeraldLabel.
    ///
    /// - Parameter Text: The text label name.
    public func setLabel(text: String) {
        self.auxTextLabel = text.uppercased()
    }
    
    /// Sets the status and type
    ///
    /// - Parameters:
    ///   - state: Label state to be displayed
    ///   - type: Label type to be displayed
    public func configure(state: EmeraldLabelState? = nil, type: EmeraldLabelType? = nil) {
        self.state = state ?? self.state
        self.type = type ?? self.type
    }
    
    // MARK: - State changes

    /// The main method responsible to get the current state and type and set it to 'EmeraldLabel.xib' properties
    ///
    /// - Parameters:
    ///   - state: Label state enum
    ///   - type: Label type enum
    internal func typeOrStyleDidChange(_ newState: EmeraldLabelState, _ newType: EmeraldLabelType) {
        self.textLabel.text = self.text()
        self.textLabel.backgroundColor = self.backgroundColor(forState: newState, andType: newType)
        self.textLabel.textColor = self.textColor(forState: newState, andType: newType)
        self.textLabel.tintColor = self.textColor(forState: newState, andType: newType)
        self.textLabel.layer.borderColor = self.borderColor(forState: newState, andType: newType)
        self.textLabel.layer.borderWidth = self.borderWidth(forState: newState, andType: newType)
        self.textLabel.textAlignment = self.textAlignment(forState: newState, andType: newType)
        
        let text = NSAttributedString(string: self.textLabel.text!, attributes: [NSAttributedStringKey.kern : 1.0])
        self.textLabel.attributedText = text
        
        self.iconImage.image = self.textIcon(forState: newState, andType: newType)
        self.iconImage.tintColor = self.textColor(forState: newState, andType: newType)
        
        self.setVisibilityConstraints(forState: newState, andType: newType)
    }

    // MARK: - Aux methods

    /// Returns the backgroundColor for a given type and state.
    ///
    /// - Parameters:
    ///   - state: Label state enum
    ///   - type: Label type enum
    /// - Returns: Return label background color
    internal func backgroundColor(forState state: EmeraldLabelState, andType type: EmeraldLabelType) -> UIColor {
        guard type == .fill else { return UIColor.clear }
        
        switch state {
        case .error:
            return UIColor.Palette.Basic.error
        case .warning:
            return UIColor.Palette.Basic.warning
        case .neutral:
            return UIColor.Palette.Light.white4
        case .success:
            return UIColor.Palette.Basic.success
        case .info:
            return UIColor.Palette.Basic.secondary
        }
    }
    
    /// Returns the border width for a given state and type.
    ///
    /// - Parameters:
    ///   - state: Label state enum
    ///   - type: Label type enum
    /// - Returns: A CGFloat representing the border width.
    internal func borderWidth(forState state: EmeraldLabelState, andType type: EmeraldLabelType) -> CGFloat {
        return type == .outline ? 1.0 : 0.0
    }
    
    /// Returns the borderColor for a given state and type.
    ///
    /// - Parameters:
    ///   - state: Label state enum
    ///   - type: Label type enum
    /// - Returns: A CGColor representing the borderColor.
    internal func borderColor(forState state: EmeraldLabelState, andType type: EmeraldLabelType) -> CGColor {
        guard type == .fill || type == .outline else {
            return UIColor.clear.cgColor
        }
        
        switch state {
        case .error:
            return UIColor.Palette.Basic.error.cgColor
        case .warning:
            return UIColor.Palette.Basic.warning.cgColor
        case .neutral:
            return UIColor.Palette.Light.white4.cgColor
        case .success:
            return UIColor.Palette.Basic.success.cgColor
        case .info:
            return UIColor.Palette.Basic.secondary.cgColor
        }
    }
    
    /// Returns an image for a given state and type.
    ///
    /// The image for the type `.text` will always be a dot bullet icon.
    /// This method returns `nil` if the image can't be found inside the Bundle.
    ///
    /// - Parameters:
    ///   - state: Label state enum
    ///   - type: Label type enum
    /// - Returns: An UIImage representing the Label's icon or `nil` if no image could be created.
    internal func textIcon(forState state: EmeraldLabelState, andType type: EmeraldLabelType) -> UIImage? {
        switch type {
        case .text:
            return UIImage(named: "icon-dot", in: Bundle.basic, compatibleWith: nil)!
                .withRenderingMode(.alwaysTemplate)
        case .image:
            return UIImage(named: auxIconLabel, in: Bundle.basic, compatibleWith: nil)!
                .withRenderingMode(.alwaysTemplate)
        default:
            return nil
        }
    }
    
    /// Updates the Label's constraints for a given state and type.
    ///
    /// - Parameters:
    ///   - state: Label state enum
    ///   - type: Label type enum
    internal func setVisibilityConstraints(forState state: EmeraldLabelState, andType type: EmeraldLabelType) {
        switch type {
        case .fill, .outline:
            self.iconImageHeightConstraint.constant = 0.0
            self.textLabelLeadingConstraint.constant = 0.0
        case .text, .image:
            self.iconImageHeightConstraint.constant = 30.0
            self.textLabelLeadingConstraint.constant = 8.0
        }
    }
    
    /// Returns a textColor for a given state and type.
    ///
    /// - Parameters:
    ///   - state: Label state enum
    ///   - type: Label type enum
    /// - Returns: An UIColor representing the Label's textColor.
    internal func textColor(forState state: EmeraldLabelState, andType type: EmeraldLabelType) -> UIColor {
        guard type != .fill else { return UIColor.Palette.Light.white1 }
        
        switch state {
        case .error:
            return UIColor.Palette.Basic.error
        case .warning:
            return UIColor.Palette.Basic.warning
        case .neutral:
            return UIColor.Palette.Light.white4
        case .success:
            return UIColor.Palette.Basic.success
        case .info:
            return UIColor.Palette.Basic.secondary
        }
    }
    
    /// Sets an aligment to text according to label type
    ///
    /// - Parameters:
    ///   - state: Label state enum
    ///   - type: Label type enum
    /// - Returns: A `NSTextAlignment` for the Label. 
    internal func textAlignment(forState state: EmeraldLabelState, andType type: EmeraldLabelType) -> NSTextAlignment {
        switch type {
        case .fill, .outline:
            return .center
        case .text, .image:
            return .left
        }
        
    }
    
    /// Sets the label text to be dipayed
    ///
    /// - Returns: Return an label text string setted by 'setLabel(text: String)' method
    internal func text() -> String {
        return self.auxTextLabel
    }
    
}
