//
//  SlingButton.swift
//  EmeraldComponents
//
//  Created by Luan Kalume | Stone on 07/05/2018.
//  Copyright © 2018 StoneCo. All rights reserved.
//

import UIKit

public enum SlingButtonStyle: Int {
    /// SlingButton's default style with a filled background color.
    case fill = 1
    /// A style with no background color, instead a border outlines the button.
    case outline
    /// A style with no background color or border, just plain text.
    case plain
}

public enum SlingButtonType: Int {
    /// The default type for SlingButton.
    case regular = 1
    /// A type used for confirmation actions.
    case confirm
    /// A type used for destructive actions.
    case delete
    /// A neutral type of button.
    case neutral
    /// A type used for disabled buttons.
    case disabled
}

@IBDesignable public class SlingButton: UIButton {
    
    // MARK: - Properties
    
    private let widthPadding: CGFloat = 48.0
    private let heightPadding: CGFloat = 12.0
    
    internal private(set) var style: SlingButtonStyle = .fill {
        didSet {
            self.typeOrStyleDidChange(self.type, self.style)
        }
    }
    
    internal private(set) var type: SlingButtonType = .regular {
        didSet {
            self.typeOrStyleDidChange(self.type, self.style)
            self.isUserInteractionEnabled = self.type == .disabled ? false : true
        }
    }
    
    // MARK: - Overrides
    
    override public var intrinsicContentSize: CGSize {
        let intrinsicContentSize = super.intrinsicContentSize

        let adjustedWidth = intrinsicContentSize.width + widthPadding
        let adjustedHeight = intrinsicContentSize.height + heightPadding

        return CGSize(width: adjustedWidth, height: adjustedHeight)
    }
    
    // MARK: - Inspectables
    
    @IBInspectable var borderRadius: CGFloat = 2.0 {
        didSet {
            self.layer.cornerRadius = borderRadius
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 1.0 {
        didSet {
            self.layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable var styleAdapter: Int {
        get {
            return self.style.rawValue
        }
        set {
            self.style = SlingButtonStyle(rawValue: newValue) ?? .fill
        }
    }
    
    @IBInspectable var typeAdapter: Int {
        get {
            return self.type.rawValue
        }
        set {
            self.type = SlingButtonType(rawValue: newValue) ?? .regular
        }
    }
    
    // MARK: - Init
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }

    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.commonInit()
    }
    
    private func commonInit() {
        self.layer.cornerRadius = 2.0
        self.layer.borderWidth = 1.0
        
        self.titleEdgeInsets = UIEdgeInsets(top: 0.0, left: 4.0, bottom: 0.0, right: 0.0)
        self.imageEdgeInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: 0.0, right: 4.0)
        
        self.titleLabel?.font = UIFont.systemFont(ofSize: 18.0, weight: .medium)
        
        self.addTarget(self, action: #selector(darkenBackground), for: .touchDown)
        self.addTarget(self, action: #selector(restoreBackground), for: [.touchUpInside, .touchCancel, .touchDragOutside])
    }
    
    // MARK: - Public configuration
    
    /// Configures the SlingButton using a style and type.
    ///
    /// Both parameters are optionals, when no value is passed the method
    /// uses the button's current style or type.
    ///
    /// - parameters:
    ///   - style: A `SlingButtonStyle`. Default value is `SlingButtonStyle.fill`.
    ///   - type: A `SlingButtonType`. Default value is `SlingButtonType.regular`.
    public func configure(style: SlingButtonStyle? = nil, type: SlingButtonType? = nil ) {
        self.style = style ?? self.style
        self.type = type ?? self.type
    }
    
    /// Configures the button's image.
    ///
    /// The image will be set for both `.normal` and `.highlighted` button states.
    ///
    /// - parameters:
    ///   - image: The image to use in the button.
    ///   - template: A booletan indication wheter the image should be rendered as template. Default value is `true`.
    ///   - usesRightSide: A booletan indication wheter the image should be place on the right side of text. Default value is `false`.
    public func setButtonImage(_ image: UIImage?, template: Bool = true, usesRightSide: Bool = false) {
        let buttonImage = template ? image?.withRenderingMode(.alwaysTemplate) : image
        
        self.setImage(buttonImage, for: .normal)
        self.setImage(buttonImage, for: .highlighted)
        
        self.semanticContentAttribute = usesRightSide ? .forceRightToLeft : .unspecified
    }
    
    // MARK: - State changes
    
    internal func typeOrStyleDidChange(_ newType: SlingButtonType, _ newStyle: SlingButtonStyle) {
        self.backgroundColor = self.backgroundColor(forType: newType, andStyle: newStyle)
        
        self.setTitleColor(self.textColor(forType: newType, andStyle: newStyle), for: .normal)
        self.setTitleColor(self.textColor(forType: newType, andStyle: newStyle), for: .highlighted)
        
        self.tintColor = self.textColor(forType: newType, andStyle: newStyle)
        
        self.layer.borderColor = self.borderColor(forType: newType, andStyle: newStyle)
    }
    
    // MARK: - Background animation
    
    @objc internal func darkenBackground() {
        
        switch self.style {
        case .outline, .plain:
            switch type {
            case .neutral: self.backgroundColor = UIColor.Palette.Light.white2
            default: self.backgroundColor = self.titleColor(for: .normal)?.withAlphaComponent(0.1)
            }
        case .fill:
            switch type {
            case .regular, .confirm, .delete: self.backgroundColor = self.backgroundColor(forType: self.type, andStyle: self.style).darker(by: 20.0)
            default: self.backgroundColor = UIColor.Palette.Light.white2
            }
        }
    }
    
    @objc internal func restoreBackground() {
        self.backgroundColor = self.backgroundColor(forType: self.type, andStyle: self.style)
    }
    
    // MARK: - Aux
    
    internal func backgroundColor(forType type: SlingButtonType, andStyle style: SlingButtonStyle) -> UIColor {
        
        switch style {
        case .outline, .plain:
            switch type {
            case .neutral: return UIColor.Palette.Light.white1
            case .disabled: return UIColor.Palette.Light.white2
            default: return UIColor.clear
            }
        case .fill:
            switch type {
            case .regular: return UIColor.primaryColor(for: ThemeManager.currentTheme())
            case .confirm: return UIColor.Palette.Basic.success
            case .delete: return UIColor.Palette.Basic.error
            case .neutral: return UIColor.Palette.Light.white1
            case .disabled: return UIColor.Palette.Light.white2
            }
        }
    }
    
    internal func borderColor(forType type: SlingButtonType, andStyle style: SlingButtonStyle) -> CGColor {
        
        switch style {
        case .fill, .outline:
            switch type {
            case .regular: return UIColor.primaryColor(for: ThemeManager.currentTheme()).cgColor
            case .confirm: return UIColor.Palette.Basic.success.cgColor
            case .delete: return UIColor.Palette.Basic.error.cgColor
            case .neutral: return UIColor.Palette.Light.white4.cgColor
            case .disabled: return UIColor.clear.cgColor
            }
        case .plain:
            if type == .neutral {
                return UIColor.Palette.Light.white4.cgColor
            } else {
                return UIColor.clear.cgColor
            }
        }
    }
    
    internal func textColor(forType type: SlingButtonType, andStyle style: SlingButtonStyle) -> UIColor {
        
        switch style {
        case .fill:
            switch type {
            case .neutral: return UIColor.Palette.Dark.black4
            case .disabled: return UIColor.Palette.Light.white4
            default: return UIColor.Palette.Light.white1
            }
        case .outline, .plain:
            switch type {
            case .regular: return UIColor.primaryColor(for: ThemeManager.currentTheme())
            case .confirm: return UIColor.Palette.Basic.success
            case .delete: return UIColor.Palette.Basic.error
            case .neutral: return UIColor.Palette.Dark.black4
            case .disabled: return UIColor.Palette.Light.white4
            }
        }
    }
    
}
