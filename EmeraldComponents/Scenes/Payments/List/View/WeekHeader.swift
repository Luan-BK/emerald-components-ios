//
//  WeekHeader.swift
//  SlingBasicComponent
//
//  Created by João Mendes | Stone on 25/04/18.
//  Copyright © 2018 StoneCo. All rights reserved.
//

import UIKit

public class WeekHeader: UIView {

    // MARK: Storyboard properties connections
    @IBOutlet var backgroundView: UIView!
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        setUpNib()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUpNib()
    }
    
    internal func setUpNib() {
        backgroundView = loadNib()
        backgroundView.frame = bounds
        backgroundView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        addSubview(backgroundView)
    }
    
    internal func loadNib() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: String(describing: WeekHeader.self), bundle: bundle)
        guard let summaryHeaderView = nib.instantiate(withOwner: self, options: nil).first as? UIView else { return UIView() }
        
        return summaryHeaderView
    }

}
