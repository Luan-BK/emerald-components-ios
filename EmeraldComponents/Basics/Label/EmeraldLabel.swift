//
//  EmeraldLabel.swift
//  EmeraldComponents
//
//  Created by João Mendes | Stone on 22/10/18.
//  Copyright © 2018 StoneCo. All rights reserved.
//

import UIKit

public enum EmeraldLabelType: Int {
    case fill = 1
    case outline
    case text
    case image
}

public enum EmeraldLabelState: Int {
    case neutral = 1
    case error
    case warning
    case success
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

    internal private(set) var state: EmeraldLabelState = .error {
        didSet {
            self.typeOrStyleDidChange(self.state, self.type)
        }
    }
    
    // MARK: - Aux properties
    
    internal var auxIconLabel: String = "icon-dot"
    
    internal var auxTextLabel: String = "Label"
    
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
        
        self.setDefaultValuesToLabels()
    }
    
    internal func setDefaultValuesToLabels() {
        self.textLabel.layer.cornerRadius = 15.0
        self.textLabel.layer.masksToBounds = true
        self.textLabel.font = UIFont.systemFont(ofSize: 15.0, weight: .heavy)
    }
    
    // MARK: - Public configuration
    
    public func setIcon(name: String) {
        self.auxIconLabel = name
    }
    
    public func setLabel(text: String) {
        self.auxTextLabel = text.uppercased()
    }
    
    public func configure(state: EmeraldLabelState, type: EmeraldLabelType) {
        self.state = state
        self.type = type
    }
    
    // MARK: - State changes

    internal func typeOrStyleDidChange(_ newState: EmeraldLabelState, _ newType: EmeraldLabelType) {
        self.textLabel.text = self.text(forState: newState, andType: newType)
        self.textLabel.backgroundColor = self.backgroundColor(forState: newState, andType: newType)
        self.textLabel.textColor = textColor(forState: newState, andType: newType)
        self.textLabel.tintColor = self.textColor(forState: newState, andType: newType)
        self.textLabel.layer.borderColor = self.borderColor(forState: newState, andType: newType)
        self.textLabel.layer.borderWidth = self.borderWidth(forState: newState, andType: newType)
        self.textLabel.textAlignment = self.textAlignment(forState: newState, andType: newType)
        
        let text = NSAttributedString(string: self.textLabel.text!, attributes: [NSAttributedStringKey.kern : 1.0])
        self.textLabel.attributedText = text
        
        self.iconImage.image = self.textIcon(forState: newState, andType: newType)
        self.iconImage.tintColor = self.textColor(forState: newState, andType: newType)
        
        self.constraintsVisibility(forState: newState, andType: newType)
    }
    
    internal func backgroundColor(forState state: EmeraldLabelState, andType type: EmeraldLabelType) -> UIColor {
        switch type {
        case .fill:
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
                return UIColor.Palette.purple
            }
        default:
            return UIColor.clear
        }
    }
    
    internal func borderWidth(forState state: EmeraldLabelState, andType type: EmeraldLabelType) -> CGFloat {
        switch type {
        case .outline:
            return 1.0
        default:
            return 0.0
        }
    }
    
    internal func borderColor(forState state: EmeraldLabelState, andType type: EmeraldLabelType) -> CGColor {
        switch type {
        case .fill, .outline:
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
                return UIColor.Palette.purple.cgColor
            }
        default:
            return UIColor.clear.cgColor
        }
    }
    
    internal func textIcon(forState state: EmeraldLabelState, andType type: EmeraldLabelType) -> UIImage? {
        switch type {
        case .text:
            return UIImage(named: "icon-dot", in: Bundle.basic, compatibleWith: nil)!.withRenderingMode(.alwaysTemplate)
        case .image:
            return UIImage(named: auxIconLabel, in: Bundle.basic, compatibleWith: nil)!.withRenderingMode(.alwaysTemplate)
        default:
            return nil
        }
    }
    
    internal func constraintsVisibility(forState state: EmeraldLabelState, andType type: EmeraldLabelType) {
        switch type {
        case .fill, .outline:
            self.iconImageHeightConstraint.constant = 0.0
            self.textLabelLeadingConstraint.constant = 0.0
        case .text, .image:
            self.iconImageHeightConstraint.constant = 30.0
            self.textLabelLeadingConstraint.constant = 8.0
        }
    }
    
    internal func textColor(forState state: EmeraldLabelState, andType type: EmeraldLabelType) -> UIColor {
        switch type {
        case .fill:
            return UIColor.Palette.Light.white1
        case .outline, .text, .image:
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
                return UIColor.Palette.purple
            }
        }
    }
    
    internal func textAlignment(forState state: EmeraldLabelState, andType type: EmeraldLabelType) -> NSTextAlignment {
        switch type {
        case .fill, .outline:
            return .center
        case .text, .image:
            return .left
        }
        
    }
    
    internal func text(forState state: EmeraldLabelState, andType type: EmeraldLabelType) -> String {
        return self.auxTextLabel
    }
    
}
