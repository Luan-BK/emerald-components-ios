//
//  CustomCollectionViewCell.swift
//  EmeraldComponentsApp
//
//  Created by João Mendes | Stone on 07/12/18.
//  Copyright © 2018 StoneCo. All rights reserved.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {

    // MARK: - Init
//    @IBOutlet var content: UICollectionViewCell!
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        self.xibSetup()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.xibSetup()
    }
    
    private func xibSetup() {
//        let name = String(describing: type(of: self))
//        Bundle.main.loadNibNamed(name,
//                                owner: self,
//                                options: nil)
//        
//        addSubview(self.content)
//        
//        self.content.frame = self.bounds
//        self.content.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }

}
