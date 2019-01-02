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
    
    private let margin: CGFloat = 24.0

    // MARK: - Properties
    
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var headerTitleLabel: UILabel!
    @IBOutlet weak var containerView: UIView!
    
    // MARK: - Constraints
    
    @IBOutlet weak var topMarginConstraint: NSLayoutConstraint!
    @IBOutlet weak var bottomMarginConstraint: NSLayoutConstraint!
    @IBOutlet weak var rightMarginConstraint: NSLayoutConstraint!
    @IBOutlet weak var leftMarginConstraint: NSLayoutConstraint!
    
    public enum TitleSize: Int {
        case small = 1
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
    
    /// A title for the card's header.
    ///
    /// Setting an empty string for this property will
    /// automatically hide the header title section.
    @IBInspectable public var headerTitle: String {
        get {
            return self.headerTitleLabel.text ?? ""
        }
        set {
            self.headerTitleLabel.text = newValue
            self.headerView.isHidden = newValue.isEmpty
        }
    }
    
    /// The font size for the header title, if enabled.
    @IBInspectable public var titleSize: Int = 1 {
        didSet {
            self.headerTitleLabel.font = (TitleSize(rawValue: titleSize) ?? .medium).font
        }
    }
    
    /// The radius to use for the card's rounded corners.
    @IBInspectable public var cornerRadius: CGFloat = 10.0 {
        didSet {
            self.layer.cornerRadius = cornerRadius
            self.contentView.layer.cornerRadius = cornerRadius
        }
    }
    
    /// The blur radius used on the card's shadow.
    @IBInspectable public var shadowRadius: CGFloat = 18.0 {
        didSet {
            self.layer.shadowRadius = shadowRadius
        }
    }
    
    /// A boolean value that indicates if the side margins are enabled.
    ///
    /// Default value is `false`.
    @IBInspectable var sideMarginsEnabled: Bool = false {
        didSet {
            rightMarginConstraint.constant = sideMarginsEnabled ? margin : 0.0
            leftMarginConstraint.constant = sideMarginsEnabled ? margin : 0.0
        }
    }
    
    /// A boolean value that indicates if the top margin is enabled.
    ///
    /// Default value is `false`.
    @IBInspectable var topMarginEnabled: Bool = false {
        didSet {
            topMarginConstraint.constant = topMarginEnabled ? margin : 0.0
        }
    }
    
    /// A boolean value that indicates if the bottom margin is enabled.
    ///
    /// Default value is `false`.
    @IBInspectable var bottomMarginEnabled: Bool = false {
        didSet {
            bottomMarginConstraint.constant = bottomMarginEnabled ? margin : 0.0
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
        guard self.contentView == nil else { return }
        
        Bundle.emerald.loadNibNamed(String(describing: CardView.self), owner: self, options: nil)
        addSubview(self.contentView)
                
        NSLayoutConstraint.activate([
            self.contentView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0.0),
            self.contentView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0.0),
            self.contentView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0.0),
            self.contentView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0.0)
            ])
        
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
        self.contentView.translatesAutoresizingMaskIntoConstraints = false
        
        self.containerView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    // MARK: - Public methods
    
    /// Adds a view to the card's container.
    ///
    /// The view will fill all of the card's container area.
    public func embedView(_ view: UIView) {
        self.containerView.addSubview(view)
        
        NSLayoutConstraint.activate([
            view.leadingAnchor.constraint(equalTo: self.containerView.leadingAnchor, constant: 0.0),
            view.trailingAnchor.constraint(equalTo: self.containerView.trailingAnchor, constant: 0.0),
            view.topAnchor.constraint(equalTo: self.containerView.topAnchor, constant: 0.0),
            view.bottomAnchor.constraint(equalTo: self.containerView.bottomAnchor, constant: 0.0)
            ])
    }
    
    public func clearEmbeddedViews() {
        self.containerView.subviews.forEach({ $0.removeFromSuperview() })
    }
    
}
