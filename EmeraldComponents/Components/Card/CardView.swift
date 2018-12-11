//
//  CardView.swift
//  EmeraldComponents
//
//  Created by João Mendes | Stone on 06/12/18.
//  Copyright © 2018 StoneCo. All rights reserved.
//

import UIKit

public class CardView: UICollectionViewCell {

    // MARK: - Properties
    
    private var shadowView: UIView! = UIView()
    
    private let trailingAndLeadingConstraint: CGFloat = 16.0
    private let topAndBottomConstraint: CGFloat = 16.0
    
    private var cornerRadius: CGFloat = 10.0
    private var shadowRadius: CGFloat = 5.0
    
    // MARK: - Init
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.loadNib()
        self.contentSetup()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.loadNib()
        self.contentSetup()
    }

    private func loadNib() {
        let name = String(describing: type(of: self))
        Bundle.emerald.loadNibNamed(name,
                                    owner: self,
                                    options: nil)
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
        self.shadowView.layer.shadowOpacity = 0.15
        self.shadowView.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        self.shadowView.layer.shadowRadius = self.shadowRadius
        self.shadowView.layer.cornerRadius = self.cornerRadius
    }
    
    // MARK: - Public class methods
    
    public func setPropertyTo(view: UIView, cornerRadius: CGFloat) {
        self.cornerRadius = cornerRadius
        view.layer.cornerRadius = self.cornerRadius
    }
    
    public func setPropertyTo(view: UIView, shadowRadius: CGFloat) {
        self.shadowRadius = shadowRadius
        self.shadowView.layer.shadowRadius = self.shadowRadius
    }
    
    public func addCustomSubview(view: UIView, width: CGFloat, height: CGFloat) {
        view.layer.cornerRadius = self.cornerRadius
        
        self.shadowView.addSubview(view)
        self.setConstraintTo(view: view, with: width, and: height)
    }
    
    // MARK: - Internal class methods
    
    internal func setConstraintTo(view: UIView, with width: CGFloat, and height: CGFloat) {
        view.translatesAutoresizingMaskIntoConstraints = false
        
        let horizontal = NSLayoutConstraint(item: view,
                                            attribute: .centerX,
                                            relatedBy: .equal,
                                            toItem: self.shadowView,
                                            attribute: .centerX,
                                            multiplier: 1,
                                            constant: 0)
        
        let vertical = NSLayoutConstraint(item: view,
                                          attribute: .centerY,
                                          relatedBy: .equal,
                                          toItem: self.shadowView,
                                          attribute: .centerY,
                                          multiplier: 1,
                                          constant: 0)
        
        let width = NSLayoutConstraint(item: view,
                                       attribute: .width,
                                       relatedBy: .equal,
                                       toItem: nil,
                                       attribute: .notAnAttribute,
                                       multiplier: 1,
                                       constant: width - self.trailingAndLeadingConstraint)
        
        let height = NSLayoutConstraint(item: view,
                                        attribute: .height,
                                        relatedBy: .equal,
                                        toItem: nil,
                                        attribute: .notAnAttribute,
                                        multiplier: 1,
                                        constant: height - self.topAndBottomConstraint)
        
        self.shadowView.addConstraints([horizontal, vertical, width, height])
    }
    
}
