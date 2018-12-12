//
//  CardCollectionViewCell.swift
//  EmeraldComponentsApp
//
//  Created by João Mendes | Stone on 12/12/18.
//  Copyright © 2018 StoneCo. All rights reserved.
//

import UIKit
import EmeraldComponents

class CardCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Properties
    
    var cardView: CardView! = CardView()
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.setup()
    }
    
    internal func setup() {
        self.cardView.frame = self.bounds
        self.cardView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        self.clipsToBounds = false
        
        self.addSubview(self.cardView)
    }
    
    // MARK: - Internal methods
    
    internal func addSuperviewTo(customView: UIView,
                                 width: CGFloat,
                                 height: CGFloat) {
        cardView.addSuperviewTo(customView: customView,
                                width: width,
                                height: height)
    }
    
    internal func setPropertyTo(view: UIView, cornerRadius: CGFloat) {
        cardView.setPropertyTo(view: view, cornerRadius: cornerRadius)
    }

    internal func setPropertyTo(view: UIView, shadowRadius: CGFloat) {
        cardView.setPropertyTo(view: view, shadowRadius: shadowRadius)
    }
    
}
