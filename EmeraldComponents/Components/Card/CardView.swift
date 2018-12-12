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
    
    private var shadowView: UIView! = UIView()
    
    private let trailingAndLeadingConstraint: CGFloat = 16.0
    private let topAndBottomConstraint: CGFloat = 16.0
    
    private var cornerRadius: CGFloat = 10.0
    private var shadowRadius: CGFloat = 18.0
    
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
        self.shadowView.frame = self.bounds
        self.shadowView.autoresizingMask = [.flexibleHeight, .flexibleWidth]

        self.addSubview(self.shadowView)
    }
    
    public override func layoutSubviews() {
        self.shadowView.backgroundColor = UIColor.clear
        self.shadowView.clipsToBounds = false
        self.shadowView.layer.shadowColor = UIColor.black.cgColor
        self.shadowView.layer.shadowOpacity = 0.1
        self.shadowView.layer.shadowOffset = CGSize(width: 0.0, height: 4.0)
        self.shadowView.layer.shadowRadius = self.shadowRadius
        self.shadowView.layer.cornerRadius = self.cornerRadius
    }
    
    // MARK: - Public methods
    
    public func setPropertyTo(view: UIView, cornerRadius: CGFloat) {
        self.cornerRadius = cornerRadius
        view.layer.cornerRadius = self.cornerRadius
    }
    
    public func setPropertyTo(view: UIView, shadowRadius: CGFloat) {
        self.shadowRadius = shadowRadius
        view.layer.shadowRadius = self.shadowRadius
    }
    
    public func addSuperViewTo(customView: UIView, width: CGFloat, height: CGFloat) {
        self.shadowView.addSubview(customView)
        self.setConstraintTo(customView: customView, with: width, and: height)
        self.setPropertiesTo(customView: customView)
    }
    
    // MARK: - Internal methods
    
    internal func setPropertiesTo(customView: UIView) {
        customView.layer.cornerRadius = self.cornerRadius
        customView.translatesAutoresizingMaskIntoConstraints = false
    }
    
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
