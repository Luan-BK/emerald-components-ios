//
//  CardView.swift
//  EmeraldComponents
//
//  Created by João Mendes | Stone on 06/12/18.
//  Copyright © 2018 StoneCo. All rights reserved.
//

import UIKit

public class CardView: UICollectionViewCell {

    // MARK: - Properties
    
    @IBOutlet var content: UICollectionViewCell!
    @IBOutlet weak var customView: UIView!
    
    // MARK: - Init
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        self.xibSetup()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.xibSetup()
    }
    
    private func xibSetup() {
        let name = String(describing: type(of: self))
        Bundle.emerald.loadNibNamed(name,
                                    owner: self,
                                    options: nil)
        
        addSubview(self.content)
        
        self.content.frame = self.bounds
        self.content.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        
        self.setDefaultValues()
    }
    
    internal func setDefaultValues() {
        self.customView.layer.cornerRadius = 20
        self.customView.layer.shadowColor = UIColor.gray.cgColor
        self.customView.layer.shadowOpacity = 0.18
        self.customView.layer.shadowOffset = CGSize.zero
        self.customView.layer.shadowRadius = 12.0
        self.customView.backgroundColor = UIColor.Palette.Light.white1
    }
    
    public func addCustomSubview(view: UIView) {
        self.customView.addSubview(view)
    }

}
