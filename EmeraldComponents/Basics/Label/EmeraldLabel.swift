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
    case ontyText
    case textWithImage
}

public enum EmeraldLabelState: Int {
    case error = 1
    case warning
    case neutral
    case success
    case info
}

@IBDesignable
public class EmeraldLabel: UILabel {
    
    // MARK: - Properties
    
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
    
    @IBInspectable var borderRadius: CGFloat = 10.0 {
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
            self.style = EmeraldLabelStyle(rawValue: newValue) ?? .fill
        }
    }
    
    @IBInspectable var stateAdapter: Int {
        get {
            return self.type.rawValue
        }
        set {
            self.type = EmeraldLabelState(rawValue: newValue) ?? .error
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
        self.layer.cornerRadius = 15.0
        self.layer.masksToBounds = true
        self.textAlignment = .center
        
        self.font = UIFont.systemFont(ofSize: 18.0, weight: .medium)
    }
    
    // MARK: - Public configuration
    
    public func setImage(_ name: String? = "button-add-icon") {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 60, height: 60))
//        imageView.frame = CGRect(x: 0, y: 0, width: 60, height: 60)
        
        let image = UIImage(named: name!)
        imageView.image = image
        

//        var imageView = UIImageView(frame: CGRect(100, 150, 150, 150)); // set as you want
//        var image = UIImage(named: name!);
//        imageView.image = image;
//        self.view.addSubview(imageView);
    }
    
    // MARK: - State changes
    
    internal func typeOrStyleDidChange(_ newType: EmeraldLabelState, _ newStyle: EmeraldLabelStyle) {
        self.backgroundColor = self.backgroundColor(forType: newType, andStyle: newStyle)
        self.textColor = textColor(forType: newType, andStyle: newStyle)
        self.tintColor = self.textColor(forType: newType, andStyle: newStyle)
    }
    
    // MARK: - Aux
    
    internal func backgroundColor(forType type: EmeraldLabelState, andStyle style: EmeraldLabelStyle) -> UIColor {
        switch style {
        case .fill:
            switch type {
            case .error: return UIColor.Palette.Basic.error
            case .warning: return UIColor.Palette.Basic.warning
            case .neutral: return UIColor.Palette.Light.white4
            case .success: return UIColor.Palette.Basic.success
            case .info: return UIColor.Palette.purple
            }
        default: return UIColor.clear
        }
    }
    
    internal func textColor(forType type: EmeraldLabelState, andStyle style: EmeraldLabelStyle) -> UIColor {
        switch style {
        case .fill:
            return UIColor.Palette.Light.white1
        case .outline, .ontyText, .textWithImage:
            switch type {
            case .error: return UIColor.Palette.Basic.error
            case .warning: return UIColor.Palette.Basic.warning
            case .neutral: return UIColor.Palette.Light.white4
            case .success: return UIColor.Palette.Basic.success
            case .info: return UIColor.Palette.purple
            }
        }
    }
    
}
