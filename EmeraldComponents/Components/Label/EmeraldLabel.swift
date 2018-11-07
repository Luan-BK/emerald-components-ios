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

    internal private(set) var state: UIColor = UIColor.Palette.Light.white4 {
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
    public func setIconFor(name: String) {
        self.auxIconLabel = name
    }
    
    /// Sets the text to be displayed by the EmeraldLabel.
    ///
    /// - Parameter Text: The text label name.
    public func setLabelFor(text: String) {
        self.auxTextLabel = text.uppercased()
    }
    
    /// Sets the status and type
    ///
    /// - Parameters:
    ///   - color: Label color to be displayed
    ///   - type: Label type to be displayed
    public func configureFor(color: UIColor? = nil, and type: EmeraldLabelType? = nil) {
        self.state = color ?? self.state
        self.type = type ?? self.type
    }
    
    // MARK: - State changes

    /// The main method responsible to get the current state and type and set it to 'EmeraldLabel.xib' properties
    ///
    /// - Parameters:
    ///   - state: Label state enum
    ///   - type: Label type enum
    internal func typeOrStyleDidChange(_ newState: UIColor, _ newType: EmeraldLabelType) {
        self.textLabel.text = self.setTextLabel()
        self.textLabel.backgroundColor = self.setBackgroundFor(color: newState, and: newType)
        self.textLabel.textColor = self.setTextFor(color: newState, and: newType)
        self.textLabel.tintColor = self.setTextFor(color: newState, and: newType)
        self.textLabel.layer.borderColor = self.setBorderFor(color: newState, type: newType)
        self.textLabel.layer.borderWidth = self.setBorderWidthFor(type: newType)
        self.textLabel.textAlignment = self.setTextAlignmentFor(type: newType)
        
        let text = NSAttributedString(string: self.textLabel.text!, attributes: [NSAttributedStringKey.kern : 1.0])
        self.textLabel.attributedText = text
        
        self.iconImage.image = self.setTextIconFor(type: newType)
        self.iconImage.tintColor = self.setTextFor(color: newState, and: newType)
        
        self.setVisibilityConstraintsFor(type: newType)
    }

    // MARK: - Aux methods

    /// Returns the backgroundColor for a given type and state.
    ///
    /// - Parameters:
    ///   - state: Label background color
    ///   - type: Label type enum
    /// - Returns: Return label background color
    internal func setBackgroundFor(color: UIColor, and type: EmeraldLabelType) -> UIColor {
        switch type {
        case .fill:
            return color
        case .outline:
            return UIColor.Palette.CommonState.clear
        case .text:
            return UIColor.Palette.CommonState.clear
        case .image:
            return UIColor.Palette.CommonState.clear
        }
    }
    
    /// Returns the border width for a given state and type.
    ///
    /// - Parameters:
    ///   - type: Label type enum
    /// - Returns: A CGFloat representing the border width.
    internal func setBorderWidthFor(type: EmeraldLabelType) -> CGFloat {
        return type == .outline ? 1.0 : 0.0
    }
    
    /// Returns the borderColor for a given state and type.
    ///
    /// - Parameters:
    ///   - color: Label border color
    ///   - type: Label type enum
    /// - Returns: A CGColor representing the borderColor.
    internal func setBorderFor(color: UIColor, type: EmeraldLabelType) -> CGColor {
        switch type {
        case .fill:
            return color.cgColor
        case .outline:
            return color.cgColor
        case .text:
            return UIColor.Palette.CommonState.clear.cgColor
        case .image:
            return UIColor.Palette.CommonState.clear.cgColor
        }
    }
    
    /// Returns an image for a given state and type.
    ///
    /// The image for the type `.text` will always be a dot bullet icon.
    /// This method returns `nil` if the image can't be found inside the Bundle.
    ///
    /// - Parameters:
    ///   - type: Label type enum
    /// - Returns: An UIImage representing the Label's icon or `nil` if no image could be created.
    internal func setTextIconFor(type: EmeraldLabelType) -> UIImage? {
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
    ///   - type: Label type enum
    internal func setVisibilityConstraintsFor(type: EmeraldLabelType) {
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
    ///   - color: Label text color
    ///   - type: Label type enum
    /// - Returns: An UIColor representing the Label's textColor.
    internal func setTextFor(color: UIColor, and type: EmeraldLabelType) -> UIColor {
        switch type {
        case .fill:
            return UIColor.Palette.Light.white1
        case .outline:
            return color
        case .text:
            return color
        case .image:
            return color
        }
    }
    
    /// Sets an aligment to text according to label type
    ///
    /// - Parameters:
    ///   - type: Label type enum
    /// - Returns: A `NSTextAlignment` for the Label. 
    internal func setTextAlignmentFor(type: EmeraldLabelType) -> NSTextAlignment {
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
    internal func setTextLabel() -> String {
        return self.auxTextLabel
    }
    
}
