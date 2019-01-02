//
//  CardViewController.swift
//  EmeraldComponentsApp
//
//  Created by Luan Kalume | Stone on 02/01/19.
//  Copyright © 2019 StoneCo. All rights reserved.
//

import UIKit
import EmeraldComponents

class CardViewController: UIViewController {

    @IBOutlet weak var regularEmptyCard: CardView!
    @IBOutlet weak var smallTitleCard: CardView!
    @IBOutlet weak var mediumTitleCard: CardView!
    @IBOutlet weak var bigTitleCard: CardView!
    @IBOutlet weak var noMarginsCard: CardView!
    @IBOutlet weak var noSideMarginsCard: CardView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var views: [UIView] = []
        for _ in 0..<6 {
            views.append(UIView())
        }
        
        views.forEach({
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.backgroundColor = randomColor()
        })
        
        self.regularEmptyCard.sideMarginsEnabled = true
        self.regularEmptyCard.bottomMarginEnabled = true
        self.regularEmptyCard.topMarginEnabled = true
        self.regularEmptyCard.embedView(views[0])
        
        self.smallTitleCard.topMarginEnabled = true
        self.smallTitleCard.headerTitle = "Small Title"
        self.smallTitleCard.titleSize = .small
        self.smallTitleCard.embedView(views[1])
        
        self.mediumTitleCard.topMarginEnabled = true
        self.mediumTitleCard.headerTitle = "Medium Title"
        self.mediumTitleCard.titleSize = .medium
        self.mediumTitleCard.embedView(views[2])
        
        self.bigTitleCard.topMarginEnabled = true
        self.bigTitleCard.headerTitle = "Big Title"
        self.bigTitleCard.titleSize = .big
        self.bigTitleCard.embedView(views[3])
        
        self.noMarginsCard.embedView(views[4])
        
        self.noSideMarginsCard.sideMarginsEnabled = false
        self.noSideMarginsCard.topMarginEnabled = true
        self.noSideMarginsCard.bottomMarginEnabled = true
        self.noSideMarginsCard.embedView(views[5])
    }

    func randomColor() -> UIColor {
        return UIColor.init(red: CGFloat(Int.random(in: 0...255))/255,
                            green: CGFloat(Int.random(in: 0...255))/255,
                            blue: CGFloat(Int.random(in: 0...255))/255,
                            alpha: 1.0)
    }
}
