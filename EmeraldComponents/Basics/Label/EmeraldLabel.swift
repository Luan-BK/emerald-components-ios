//
//  EmeraldLabel.swift
//  EmeraldComponents
//
//  Created by João Mendes | Stone on 22/10/18.
//  Copyright © 2018 StoneCo. All rights reserved.
//

import UIKit

public enum EmeraldLabelStyle: Int {
    case fill = 1
    case outline
    case text
    case image
}

public enum EmeraldLabelState: Int {
    case error = 1
    case warning
    case neutral
    case success
    case info
}

@IBDesignable
public class EmeraldLabel: UIView {
    
    // MARK: - Properties
    
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var iconImage: UIImageView!
    @IBOutlet weak var textLabel: UILabel!
    
    internal var iconLabel: String = "calendar-icon"
    
    internal private(set) var style: EmeraldLabelStyle = .fill {
        didSet {
            self.typeOrStyleDidChange(self.type, self.style)
        }
    }

    internal private(set) var type: EmeraldLabelState = .error {
        didSet {
            self.typeOrStyleDidChange(self.type, self.style)
        }
    }
    
    // MARK: - Inspectables
    
    @IBInspectable public var text: String = "" {
        didSet {
            self.textLabel.text = text.uppercased()
        }
    }
    
    // MARK: - Init

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.xibSetup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.xibSetup()
    }
    
    private func xibSetup() {
        Bundle.basic.loadNibNamed(String(describing: EmeraldLabel.self), owner: self, options: nil)
        
        addSubview(self.contentView)
        
        self.contentView.frame = self.bounds
        self.contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        
        setDefaultLabel()
    }
    
    internal func setDefaultLabel() {
        self.textLabel.layer.cornerRadius = 15.0
        self.textLabel.layer.masksToBounds = true
        self.textLabel.textAlignment = .center
        self.textLabel.font = UIFont.systemFont(ofSize: 18.0, weight: .medium)
    }
    
    // MARK: - Public configuration
    
    public func setIcon(name: String) {
        iconLabel = name
    }
    
    public func setLabel(text: String) {
        self.textLabel.text = text.uppercased()
    }
    
    public func configure(style: EmeraldLabelStyle? = nil, type: EmeraldLabelState? = nil) {
        self.style = style ?? self.style
        self.type = type ?? self.type
    }
    
    // MARK: - State changes

    internal func typeOrStyleDidChange(_ newType: EmeraldLabelState, _ newStyle: EmeraldLabelStyle) {
        self.textLabel.backgroundColor = self.backgroundColor(forType: newType, andStyle: newStyle)
        self.textLabel.textColor = textColor(forType: newType, andStyle: newStyle)
        self.textLabel.tintColor = self.textColor(forType: newType, andStyle: newStyle)
        self.textLabel.layer.borderColor = self.borderColor(forType: newType, andStyle: newStyle)
        self.textLabel.layer.borderWidth = self.borderWidth(forType: newType, andStyle: newStyle)
        
        self.iconImage.image = self.textBullet(forType: newType, andStyle: newStyle)
        self.iconImage.tintColor = self.textColor(forType: newType, andStyle: newStyle)
    }

    // MARK: - Aux

    internal func backgroundColor(forType type: EmeraldLabelState, andStyle style: EmeraldLabelStyle) -> UIColor {
        switch style {
        case .fill:
            switch type {
            case .error:
                return UIColor.Palette.Basic.error
            case .warning:
                return UIColor.Palette.Basic.warning
            case .neutral:
                return UIColor.Palette.Light.white4
            case .success:
                return UIColor.Palette.Basic.success
            case .info:
                return UIColor.Palette.purple
            }
        default:
            return UIColor.clear
        }
    }
    
    internal func borderWidth(forType type: EmeraldLabelState, andStyle style: EmeraldLabelStyle) -> CGFloat {
        switch style {
        case .outline:
            return 1.0
        default:
            return 0.0
        }
    }
    
    internal func borderColor(forType type: EmeraldLabelState, andStyle style: EmeraldLabelStyle) -> CGColor {
        switch style {
        case .fill, .outline:
            switch type {
            case .error:
                return UIColor.Palette.Basic.error.cgColor
            case .warning:
                return UIColor.Palette.Basic.warning.cgColor
            case .neutral:
                return UIColor.Palette.Light.white4.cgColor
            case .success:
                return UIColor.Palette.Basic.success.cgColor
            case .info:
                return UIColor.Palette.purple.cgColor
            }
        default:
            return UIColor.clear.cgColor
        }
    }
    
    internal func textBullet(forType type: EmeraldLabelState, andStyle style: EmeraldLabelStyle) -> UIImage? {
        switch style {
        case .text:
            return UIImage(named: "calendar-icon", in: Bundle.basic, compatibleWith: nil)!.withRenderingMode(.alwaysTemplate)
        case .image:
            return UIImage(named: iconLabel, in: Bundle.basic, compatibleWith: nil)!.withRenderingMode(.alwaysTemplate)
        default:
            return nil
        }
    }
    
    internal func textColor(forType type: EmeraldLabelState, andStyle style: EmeraldLabelStyle) -> UIColor {
        switch style {
        case .fill:
            return UIColor.Palette.Light.white1
        case .outline, .text, .image:
            switch type {
            case .error:
                return UIColor.Palette.Basic.error
            case .warning:
                return UIColor.Palette.Basic.warning
            case .neutral:
                return UIColor.Palette.Light.white4
            case .success:
                return UIColor.Palette.Basic.success
            case .info:
                return UIColor.Palette.purple
            }
        }
    }
    
}
