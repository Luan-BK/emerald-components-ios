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
    
    @IBOutlet var content: UICollectionViewCell!
    @IBOutlet weak var shadowView: UIView!
    
    private let trailingAndLeadingConstraint: CGFloat = 16.0
    private let topAndBottomConstraint: CGFloat = 32.0
    
    private var cornerRadius: CGFloat = 20.0
    private var shadowRadius: CGFloat = 8.0
    
    // MARK: - Init
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        self.xibSetup()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.xibSetup()
    }
    
    private func xibSetup() {
        let name = String(describing: type(of: self))
        Bundle.emerald.loadNibNamed(name,
                                    owner: self,
                                    options: nil)
        
        addSubview(self.content)
        
        self.content.frame = self.bounds
        self.content.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }
    
    public override func layoutSubviews() {
        self.shadowView.backgroundColor = UIColor.clear
        self.shadowView.clipsToBounds = false
        self.shadowView.layer.shadowColor = UIColor.gray.cgColor
        self.shadowView.layer.shadowOpacity = 1
        self.shadowView.layer.shadowOffset = CGSize.zero
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
