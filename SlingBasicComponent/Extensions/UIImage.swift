//
//  UIImage.swift
//  SlingBasicComponent
//
//  Created by Luan Kalume | Stone on 13/06/2018.
//  Copyright © 2018 StoneCo. All rights reserved.
//

import UIKit

extension UIImage {
    
    public func rotate(radians: CGFloat) -> UIImage {
        let rotatedSize = CGRect(origin: .zero, size: size).applying(CGAffineTransform(rotationAngle: CGFloat(radians))).integral.size
        UIGraphicsBeginImageContext(rotatedSize)
        if let context = UIGraphicsGetCurrentContext() {
            let origin = CGPoint(x: rotatedSize.width / 2.0, y: rotatedSize.height / 2.0)
            context.translateBy(x: origin.x, y: origin.y)
            context.rotate(by: radians)
            draw(in: CGRect(x: -origin.x, y: -origin.y, width: size.width, height: size.height))
            let rotatedImage = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            
            return rotatedImage ?? self
        }
        
        return self
    }
    
    public static func inputImage(for state: SlingElementState) -> UIImage? {
        let bundle = Bundle.basic
        
        switch state {
        case .error:
            return UIImage(named: "input-error-icon", in: bundle, compatibleWith: nil)
        case .warning:
            return UIImage(named: "input-warning-icon", in: bundle, compatibleWith: nil)
        case .success:
            return UIImage(named: "input-success-icon", in: bundle, compatibleWith: nil)
        default:
            return UIImage(named: "input-clear-icon", in: bundle, compatibleWith: nil)
        }
    }
    
    public static func securePassword(_ show: Bool) -> UIImage? {
        let bundle = Bundle.basic
        
        if show {
            return UIImage(named: "icon-password-show", in: bundle, compatibleWith: nil)?.withRenderingMode(.alwaysTemplate)
        } else {
            return UIImage(named: "icon-password-hide", in: bundle, compatibleWith: nil)?.withRenderingMode(.alwaysTemplate)
        }
    }
    
}
