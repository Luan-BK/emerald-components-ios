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
    
    internal private(set) var icon: UIImage = UIImage(named: "icon-dot", in: Bundle.basic, compatibleWith: nil)! {
        didSet {
            self.labelConfigDidChange(text: self.text, color: self.color, type: self.type, and: self.icon)
        }
    }
    
    internal private(set) var text: String! {
        didSet {
            self.labelConfigDidChange(text: self.text, color: self.color, type: self.type, and: self.icon)
        }
    }
    
    internal private(set) var type: EmeraldLabelType = .fill {
        didSet {
            self.labelConfigDidChange(text: self.text, color: self.color, type: self.type, and: self.icon)
        }
    }

    internal private(set) var color: UIColor = UIColor.Palette.Light.white4 {
        didSet {
            self.labelConfigDidChange(text: self.text, color: self.color, type: self.type, and: self.icon)
        }
    }
    
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
    
    /// Sets the status and type
    ///
    /// - Parameters:
    ///   - text: Label text to be displayed
    ///   - color: Label color to be displayed
    ///   - type: Label type to be displayed
    public func configureFor(text: String? = nil,
                             color: UIColor? = nil,
                             type: EmeraldLabelType? = nil,
                             and icon: UIImage? = nil) {
        self.text = text ?? self.text
        self.color = color ?? self.color
        self.type = type ?? self.type
        self.icon = icon ?? self.icon
    }
    
    // MARK: - State changes

    /// The main method responsible to get the current state and type and set it to 'EmeraldLabel.xib' properties
    ///
    /// - Parameters:
    ///   - color: Label configuration color
    ///   - type: Label type enum
    internal func labelConfigDidChange(text: String, color: UIColor, type: EmeraldLabelType, and icon: UIImage) {
        self.textLabel.backgroundColor = self.setBackgroundFor(color: color, and: type)
        self.textLabel.textColor = self.setTextFor(color: color, and: type)
        self.textLabel.tintColor = self.setTextFor(color: color, and: type)
        self.textLabel.layer.borderColor = self.setBorderFor(color: color, type: type)
        self.textLabel.layer.borderWidth = self.setBorderWidthFor(type: type)
        self.textLabel.textAlignment = self.setTextAlignmentFor(type: type)
        
        self.iconImage.image = self.setTextIconFor(type: type, and: icon)
        self.iconImage.tintColor = self.setTextFor(color: color, and: type)
        
        self.setAttributedText()
        
        self.setTextFor(label: text)
        
        self.setVisibilityConstraintsFor(type: type)
    }

    // MARK: - Aux methods

    /// Returns the backgroundColor for a given type and color.
    ///
    /// - Parameters:
    ///   - color: Label background color
    ///   - type: Label type enum
    /// - Returns: Return label background color
    internal func setBackgroundFor(color: UIColor, and type: EmeraldLabelType) -> UIColor {
        switch type {
        case .fill:
            return color
        case .outline:
            return UIColor.Palette.CommonState.clear
        case .image:
            return UIColor.Palette.CommonState.clear
        }
    }
    
    /// Returns the border width for a given color and type.
    ///
    /// - Parameters:
    ///   - type: Label type enum
    /// - Returns: A CGFloat representing the border width.
    internal func setBorderWidthFor(type: EmeraldLabelType) -> CGFloat {
        return type == .outline ? 1.0 : 0.0
    }
    
    /// Returns the borderColor for a given color and type.
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
        case .image:
            return UIColor.Palette.CommonState.clear.cgColor
        }
    }
    
    /// Returns an image for a given type.
    ///
    /// This method returns `nil` if the icon can't be found inside the Bundle.
    ///
    /// - Parameters:
    ///   - type: Label type enum
    ///   - icon: Icon to be displayed with the label
    /// - Returns: An UIImage representing the Label's icon or `nil` if no image could be created.
    internal func setTextIconFor(type: EmeraldLabelType, and icon: UIImage) -> UIImage? {
        switch type {
        case .image:
            return icon.withRenderingMode(.alwaysTemplate)
        default:
            return nil
        }
    }
    
    /// Updates the Label's constraints for a given type.
    ///
    /// - Parameters:
    ///   - type: Label type enum
    internal func setVisibilityConstraintsFor(type: EmeraldLabelType) {
        switch type {
        case .fill, .outline:
            self.iconImageHeightConstraint.constant = 0.0
            self.textLabelLeadingConstraint.constant = 0.0
        case .image:
            self.iconImageHeightConstraint.constant = 30.0
            self.textLabelLeadingConstraint.constant = 8.0
        }
    }
    
    /// Returns a textColor for a given color and type.
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
        case .image:
            return .left
        }
    }
    
    /// Sets the label text to be diplayed
    internal func setTextFor(label: String) {
        self.textLabel.text = label.uppercased()
    }
    
    /// Sets kern to label text to be displayed
    internal func setAttributedText() {
        let attribute = NSAttributedString(string: self.textLabel.text!, attributes: [NSAttributedStringKey.kern : 1.0])
        self.textLabel.attributedText = attribute
    }
    
}
