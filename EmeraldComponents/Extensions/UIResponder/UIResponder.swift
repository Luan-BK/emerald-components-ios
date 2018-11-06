//
//  UIResponder.swift
//  EmeraldComponents
//
//  Created by Luan Kalume | Stone on 21/06/2018.
//  Copyright © 2018 StoneCo. All rights reserved.
//

import UIKit

extension UIResponder {
    
    var parentViewController: UIViewController? {
        return (self.next as? UIViewController) ?? self.next?.parentViewController
    }
    
}
