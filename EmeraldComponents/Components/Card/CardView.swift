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
    @IBOutlet weak var customView: UIView!
    
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
    }
    
    public func addCustomSubview(view: UIView, width: CGFloat, height: CGFloat) {
        self.customView.addSubview(view)
        self.constraint(view: view, width: width, height: height)
    }
    
    internal func constraint(view: UIView, width: CGFloat, height: CGFloat) {
        view.translatesAutoresizingMaskIntoConstraints = false
        
        let trailingAndLeadingConstraint: CGFloat = 16.0
        let topAndBottomConstraint: CGFloat = 32.0
        
        let horizontal = NSLayoutConstraint(item: view,
                                            attribute: .centerX,
                                            relatedBy: .equal,
                                            toItem: self.customView,
                                            attribute: .centerX,
                                            multiplier: 1,
                                            constant: 0)
        
        let vertical = NSLayoutConstraint(item: view,
                                          attribute: .centerY,
                                          relatedBy: .equal,
                                          toItem: self.customView,
                                          attribute: .centerY,
                                          multiplier: 1,
                                          constant: 0)
        
        let width = NSLayoutConstraint(item: view,
                                       attribute: .width,
                                       relatedBy: .equal,
                                       toItem: nil,
                                       attribute: .notAnAttribute,
                                       multiplier: 1,
                                       constant: width - trailingAndLeadingConstraint)
        
        let height = NSLayoutConstraint(item: view,
                                        attribute: .height,
                                        relatedBy: .equal,
                                        toItem: nil,
                                        attribute: .notAnAttribute,
                                        multiplier: 1,
                                        constant: height - topAndBottomConstraint)
        
        self.customView.addConstraints([horizontal, vertical, width, height])
    }
    
}
