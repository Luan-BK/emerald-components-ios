//
//  HUD.swift
//  EmeraldComponents
//
//  Created by João Mendes | Stone on 13/04/18.
//  Copyright © 2018 StoneCo. All rights reserved.
//

import UIKit

public class HUD {
    
    public static let shared = HUD()
    
    internal var hudHelper = HUDHelper()
    internal var hudConstraints = HUDConstraints()
    final public var isAnimating = false
        
    @discardableResult
    public func show(_ view: UIView? = UIApplication.shared.keyWindow) -> UIView? {
        guard let view = view else { return nil }
        
        let container = hudHelper.containerBackgroundView(view)
        let blurView = hudHelper.blurEffectView(container)
        let activityIndicator = hudHelper.activityAnimating(blurView)
        
        let constraint = hudConstraints.blurViewConstraint(container: container, blurView: blurView)
        
        blurView.contentView.addSubview(activityIndicator)
        container.addSubview(blurView)
        container.addConstraints(constraint)
        
        view.addSubview(container)
        
        activityIndicator.startAnimating()
        self.isAnimating = true
        
        return container
    }
    
    public func hide() {
        hudHelper.activityIndicatorView.stopAnimating()
        hudHelper.containerView.removeFromSuperview()
        self.isAnimating = false
    }
    
}
