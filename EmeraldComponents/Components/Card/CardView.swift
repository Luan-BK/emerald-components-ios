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
    
    @IBOutlet weak var rightMarginConstraint: NSLayoutConstraint!
    @IBOutlet weak var leftMarginConstraint: NSLayoutConstraint!
    @IBOutlet weak var bottomMarginConstraint: NSLayoutConstraint!
    
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
    
    /// A boolean value that indicates if the bottom margin is enabled.
    ///
    /// Default value is `false`.
    @IBInspectable var bottomMarginsEnabled: Bool = false {
        didSet {
            bottomMarginConstraint.constant = bottomMarginsEnabled ? margin : 0.0
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
    }
    
    // MARK: - Public methods
    
    /// Adds a view to the card's container.
    ///
    /// The view will fill all of the card's container area.
    public func embeddView(_ view: UIView) {
        self.addSubview(view)
        
        NSLayoutConstraint.activate([
            view.leadingAnchor.constraint(equalTo: self.containerView.leadingAnchor, constant: 0.0),
            view.trailingAnchor.constraint(equalTo: self.containerView.trailingAnchor, constant: 0.0),
            view.topAnchor.constraint(equalTo: self.containerView.topAnchor, constant: 0.0),
            view.bottomAnchor.constraint(equalTo: self.containerView.bottomAnchor, constant: 0.0)
            ])
    }
    
    // MARK: - Layout override methods
    
    override public func addSubview(_ view: UIView) {
        guard view != contentView else {
            super.addSubview(view)
            return
        }
        
        if contentView == nil {
            self.contentSetup()
        }
        
        view.frame.origin = view.convert(self.frame.origin, to: self.containerView)
        
        self.containerView.addSubview(view)
    }
    
    override public func addConstraint(_ constraint: NSLayoutConstraint) {
        guard let first = (constraint.firstItem as? UIView),
            let second = (constraint.secondItem as? UIView),
            self.containerView.subviews.contains(first) || self.containerView.subviews.contains(second) else {
                super.addConstraint(constraint)
                return
        }
        
        super.addConstraint(self.getNewConstraint(constraint))
    }
    
    // MARK: - Aux methods
    
    /// Returns a new constraint where the first and/or second itens are replaced by
    /// the container view.
    private func getNewConstraint(_ constraint: NSLayoutConstraint) -> NSLayoutConstraint {
        return NSLayoutConstraint(item: constraint.firstItem as? UIView == self ? self.containerView : constraint.firstItem as Any,
                                  attribute: constraint.firstAttribute,
                                  relatedBy: constraint.relation,
                                  toItem: constraint.secondItem as? UIView == self ? self.containerView : constraint.secondItem,
                                  attribute: constraint.secondAttribute,
                                  multiplier: constraint.multiplier,
                                  constant: constraint.constant)
    }
    
}
