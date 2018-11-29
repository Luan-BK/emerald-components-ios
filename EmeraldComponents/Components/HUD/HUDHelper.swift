//
//  HUDHelper.swift
//  EmeraldComponents
//
//  Created by João Mendes | Stone on 16/04/18.
//  Copyright © 2018 StoneCo. All rights reserved.
//

import UIKit

class HUDHelper {
    
    var activityIndicatorView = UIActivityIndicatorView()
    var containerView = UIView()
    
    func containerBackgroundView(_ view: UIView? = UIApplication.shared.keyWindow) -> UIView {
        guard let view = view else { return UIView() }
        
        containerView.frame = view.bounds
        containerView.center = view.center
        containerView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        containerView.backgroundColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 0.4)
        
        return containerView
    }
    
    func blurEffectView(_ view: UIView? = UIApplication.shared.keyWindow) -> UIVisualEffectView {
        guard view != nil  else { return UIVisualEffectView() }
        
        let blurEffect = UIBlurEffect(style: .extraLight)
        let blurView = UIVisualEffectView(effect: blurEffect)
        
        blurView.frame = CGRect(x: 0.0, y: 0.0, width: 156.0, height: 156.0)
        blurView.translatesAutoresizingMaskIntoConstraints = false
        blurView.clipsToBounds = true
        blurView.layer.cornerRadius = 10
        
        return blurView
    }
    
    func activityAnimating(_ view: UIView? = UIApplication.shared.keyWindow) -> UIActivityIndicatorView {
        guard let view = view else { return UIActivityIndicatorView() }
        
        activityIndicatorView.frame = CGRect(x: 0.0, y: 0.0, width: 40.0, height: 40.0)
        activityIndicatorView.style = .whiteLarge
        activityIndicatorView.color = UIColor.black
        activityIndicatorView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        activityIndicatorView.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
        activityIndicatorView.center = CGPoint(x: view.frame.size.width / 2, y: view.frame.size.height / 2)
        
        return activityIndicatorView
    }
    
}
