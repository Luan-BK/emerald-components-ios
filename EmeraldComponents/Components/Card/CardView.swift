//
//  CardView.swift
//  EmeraldComponents
//
//  Created by João Mendes | Stone on 06/12/18.
//  Copyright © 2018 StoneCo. All rights reserved.
//

import UIKit

public class CardView: UIView {

    // MARK: - Properties
    
    internal var shadowView: UIView! = UIView()
    
    private let trailingAndLeadingConstraint: CGFloat = 16.0
    private let topAndBottomConstraint: CGFloat = 16.0
    
    internal var cornerRadius: CGFloat = 10.0
    internal var shadowRadius: CGFloat = 18.0
    
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
        self.setLayoutSubviews()
        self.addSubview(self.shadowView)
    }
    
    internal func setLayoutSubviews() {
        self.shadowView.frame = self.bounds
        self.shadowView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        self.shadowView.backgroundColor = UIColor.clear
        self.shadowView.clipsToBounds = false
        self.shadowView.layer.shadowColor = UIColor.black.cgColor
        self.shadowView.layer.shadowOpacity = 0.1
        self.shadowView.layer.shadowOffset = CGSize(width: 0.0, height: 4.0)
        self.shadowView.layer.shadowRadius = self.shadowRadius
        self.shadowView.layer.cornerRadius = self.cornerRadius
    }
    
    // MARK: - Public methods
    
    /// Updates CardView cornerRadius
    ///
    /// - Parameters:
    ///   - view: Custom view to be updated
    ///   - cornerRadius: cornerRadius to be setted to custom view
    public func setPropertyTo(view: UIView, cornerRadius: CGFloat) {
        self.cornerRadius = cornerRadius
        view.layer.cornerRadius = self.cornerRadius
    }
    
    /// Updates CardView shadowRadius
    ///
    /// - Parameters:
    ///   - view: Custom view to be updated
    ///   - shadowRadius: shadowRadius to be setted to custom view
    public func setPropertyTo(view: UIView, shadowRadius: CGFloat) {
        self.shadowRadius = shadowRadius
        view.layer.shadowRadius = self.shadowRadius
    }
    
    /// Sets custom subview inside CardView
    ///
    /// - Parameters:
    ///   - customView: Custom view to be setted inside superview
    ///   - width: Custom view width constat
    ///   - height: Custom view height constat
    public func addSuperviewTo(customView: UIView,
                               width: CGFloat,
                               height: CGFloat) {
        self.shadowView.addSubview(customView)
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
                                            toItem: self.shadowView,
                                            attribute: .centerX,
                                            multiplier: 1,
                                            constant: 0)
        
        let vertical = NSLayoutConstraint(item: customView,
                                          attribute: .centerY,
                                          relatedBy: .equal,
                                          toItem: self.shadowView,
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
        
        self.shadowView.addConstraints([horizontal, vertical, width, height])
    }
    
}
