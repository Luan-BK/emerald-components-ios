//
//  EmptyTableView.swift
//  SlingBusinessComponent
//
//  Created by Luan Kalume | Stone on 11/04/2018.
//  Copyright © 2018 StoneCo. All rights reserved.
//

import UIKit

class EmptyTableView: UIView {

    @IBOutlet var contentView: UIView!
    
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var refreshButton: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.xibSetup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.xibSetup()
    }
    
    private func xibSetup() {
        let bundle = Bundle(for: type(of: self))
        
        bundle.loadNibNamed(String(describing: EmptyTableView.self), owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }
    
    public func configureView(message: String? = nil, target: Any?, buttonAction: Selector) {
        if let message = message {
            self.messageLabel.text = message
        }
        self.refreshButton.addTarget(target, action: buttonAction, for: .touchUpInside)
    }
    
}
