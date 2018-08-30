//
//  UIView.swift
//  EmeraldComponents
//
//  Created by Luan Kalume | Stone on 19/03/2018.
//  Copyright © 2018 StoneCo. All rights reserved.
//

import UIKit

extension UIView {
    func loadFromNib<T: UIView>() -> T {
        let selfType = type(of: self)
        let bundle = Bundle(for: selfType)
        let nibName = String(describing: selfType)
        let nib = UINib(nibName: nibName, bundle: bundle)
        
        guard let view = nib.instantiate(withOwner: self, options: nil).first as? T else {
            fatalError("Error loading nib with name \(nibName)")
        }
        return view
    }
}
