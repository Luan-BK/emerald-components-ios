//
//  CardView.swift
//  EmeraldComponents
//
//  Created by João Mendes | Stone on 06/12/18.
//  Copyright © 2018 StoneCo. All rights reserved.
//

import UIKit

@IBDesignable
public class CardView: UIView {

    // MARK: - Properties
    
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var headerTitleLabel: UILabel!
    
    internal var containerView: UIView! = UIView()
    
    private let trailingAndLeadingConstraint: CGFloat = 16.0
    private let topAndBottomConstraint: CGFloat = 16.0
    
    public enum TitleSize: Int {
        case small = 0
        case medium
        case big
        
        var font: UIFont {
            switch self {
            case .small:
                return UIFont.systemFont(ofSize: 16.0, weight: .bold)
            case .medium:
                return UIFont.systemFont(ofSize: 20.0, weight: .bold)
            case .big:
                return UIFont.systemFont(ofSize: 24.0, weight: .bold)
            }
        }
    }
    
    @IBInspectable public var headerTitle: String {
        get {
            return self.headerTitleLabel.text ?? ""
        }
        set {
            self.headerTitleLabel.text = newValue
            self.headerView.isHidden = newValue.isEmpty
        }
    }
    
    @IBInspectable public var titleSize: Int = 1 {
        didSet {
            self.headerTitleLabel.font = (TitleSize(rawValue: titleSize) ?? .medium).font
        }
    }
    
    /// The radius to use for the card's rounded corners.
    @IBInspectable public var cornerRadius: CGFloat = 10.0 {
        didSet {
            self.layer.cornerRadius = cornerRadius
            self.containerView.layer.cornerRadius = cornerRadius
        }
    }
    
    /// The blur radius used on the card's shadow.
    @IBInspectable public var shadowRadius: CGFloat = 18.0 {
        didSet {
            self.layer.shadowRadius = shadowRadius
        }
    }
    
    // MARK: - Init
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        self.contentSetup()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.contentSetup()
    }

    private func contentSetup() {
        Bundle.emerald.loadNibNamed(String(describing: CardView.self), owner: self, options: nil)
        
        addSubview(self.contentView)
        
        self.contentView.frame = self.bounds
        self.contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        
        self.setUpLayout()
    }
    
    internal func setUpLayout() {
        self.backgroundColor = .clear
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.1
        self.layer.shadowOffset = CGSize(width: 0.0, height: 5.0)
        self.layer.shadowRadius = self.shadowRadius
        self.layer.cornerRadius = self.cornerRadius
        
        self.contentView.clipsToBounds = true
        self.contentView.layer.cornerRadius = self.cornerRadius
        self.contentView.frame = self.bounds
        self.contentView.backgroundColor = UIColor.Palette.Light.white1

//        self.contentView.addSubview(self.containerView)

//        NSLayoutConstraint.activate([
//            containerView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
//            containerView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0),
//            containerView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
//            containerView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0)
//            ])
    }
    
    // MARK: - Public methods
    
    /// Sets custom subview inside CardView
    ///
    /// - Parameters:
    ///   - customView: Custom view to be setted inside superview
    ///   - width: Custom view width constat
    ///   - height: Custom view height constat
    public func addSuperviewTo(customView: UIView,
                               width: CGFloat,
                               height: CGFloat) {
        self.containerView.addSubview(customView)
        self.setPropertiesTo(customView: customView)
        self.setConstraintTo(customView: customView,
                             with: width,
                             and: height)
    }
    
    // MARK: - Internal methods
    
    /// Sets default properties to custom view
    ///
    /// - Parameter customView: Custom view
    internal func setPropertiesTo(customView: UIView) {
        customView.layer.cornerRadius = self.cornerRadius
        customView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    /// Sets subview constraints to superview
    ///
    /// - Parameters:
    ///   - customView: Custom view to be setted inside superview
    ///   - width: Custom view width constat
    ///   - height: Custom view height constat
    internal func setConstraintTo(customView: UIView,
                                  with width: CGFloat,
                                  and height: CGFloat) {
        
        let horizontal = NSLayoutConstraint(item: customView,
                                            attribute: .centerX,
                                            relatedBy: .equal,
                                            toItem: self.containerView,
                                            attribute: .centerX,
                                            multiplier: 1,
                                            constant: 0)
        
        let vertical = NSLayoutConstraint(item: customView,
                                          attribute: .centerY,
                                          relatedBy: .equal,
                                          toItem: self.containerView,
                                          attribute: .centerY,
                                          multiplier: 1,
                                          constant: 0)
        
        let width = NSLayoutConstraint(item: customView,
                                       attribute: .width,
                                       relatedBy: .equal,
                                       toItem: nil,
                                       attribute: .notAnAttribute,
                                       multiplier: 1,
                                       constant: width - self.trailingAndLeadingConstraint)
        
        let height = NSLayoutConstraint(item: customView,
                                        attribute: .height,
                                        relatedBy: .equal,
                                        toItem: nil,
                                        attribute: .notAnAttribute,
                                        multiplier: 1,
                                        constant: height - self.topAndBottomConstraint)
        
        self.containerView.addConstraints([horizontal, vertical, width, height])
    }
    
}
