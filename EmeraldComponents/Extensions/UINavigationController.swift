//
//  UINavigationController.swift
//  SlingBasicComponent
//
//  Created by Luan Kalume | Stone on 14/08/2018.
//  Copyright © 2018 StoneCo. All rights reserved.
//

import UIKit

extension UINavigationController {
    
    public func popViewControllers(_ amount: Int, animated: Bool = true) {
        if viewControllers.count > amount {
            let viewController = viewControllers[viewControllers.count - (amount + 1)]
            popToViewController(viewController, animated: animated)
        }
    }
    
}
