//
//  LoadingTableViewCell.swift
//  EmeraldComponents
//
//  Created by Luan Kalume | Stone on 25/05/2018.
//  Copyright © 2018 StoneCo. All rights reserved.
//

import UIKit

public class LoadingTableViewCell: EmeraldTableViewCell {

    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    override public func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
        self.contentView.autoresizingMask = .flexibleHeight
    }
    
    public func animate() {
        self.activityIndicator.startAnimating()
    }
    
}
