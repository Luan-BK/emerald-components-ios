//
//  SlingView.swift
//  SlingBasicComponent
//
//  Created by Luan Kalume | Stone on 07/05/2018.
//  Copyright © 2018 StoneCo. All rights reserved.
//

import UIKit

public class SlingView: UIView {
    
    @IBOutlet var contentView: SlingView!
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        commonInit(type(of: self))
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit(type(of: self))
    }
    
    internal func commonInit(_ aClass: AnyClass) {
        self.backgroundColor = .clear
        
        let bundle = Bundle(for: aClass)
        bundle.loadNibNamed(String(describing: aClass), owner: self, options: nil)
        
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }
}
