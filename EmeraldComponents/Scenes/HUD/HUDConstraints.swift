//
//  HUDConstraints.swift
//  EmeraldComponents
//
//  Created by João Mendes | Stone on 28/05/18.
//  Copyright © 2018 StoneCo. All rights reserved.
//

import UIKit

public class HUDConstraints {
    
    internal func blurViewConstraint(container: UIView, blurView: UIVisualEffectView) -> [NSLayoutConstraint] {
        
        let widthConst = NSLayoutConstraint(item: blurView,
                                            attribute: .width,
                                            relatedBy: .equal,
                                            toItem: nil,
                                            attribute: .notAnAttribute,
                                            multiplier: 1,
                                            constant: 156.0)
        widthConst.priority = .defaultHigh
        
        let heightConst = NSLayoutConstraint(item: blurView,
                                             attribute: .height,
                                             relatedBy: .equal,
                                             toItem: nil,
                                             attribute: .notAnAttribute,
                                             multiplier: 1,
                                             constant: 156.0)
        heightConst.priority = .defaultHigh
        
        let centerXConst = NSLayoutConstraint(item: blurView,
                                              attribute: .centerX,
                                              relatedBy: .equal,
                                              toItem: container,
                                              attribute: .centerX,
                                              multiplier: 1,
                                              constant: 0.0)
        centerXConst.priority = .defaultHigh
        
        let centerYConst = NSLayoutConstraint(item: blurView,
                                              attribute: .centerY,
                                              relatedBy: .equal,
                                              toItem: container,
                                              attribute: .centerY,
                                              multiplier: 1,
                                              constant: 0.0)
        centerYConst.priority = .defaultHigh
        
        return [widthConst, heightConst, centerXConst, centerYConst]
        
    }
    
}
