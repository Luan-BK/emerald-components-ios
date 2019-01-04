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
    @IBOutlet weak var singleLineTitleCard: CardView!
    @IBOutlet weak var doubleLineTitleCard: CardView!
    @IBOutlet weak var manyLinesTitleCard: CardView!
    @IBOutlet weak var noMarginsCard: CardView!
    @IBOutlet weak var noSideMarginsCard: CardView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var views: [UIView] = []
        for _ in 0..<6 {
            views.append(UIView())
        }
        
        views.forEach({
            NSLayoutConstraint.activate([
                $0.heightAnchor.constraint(equalToConstant: 200.0)
                ])
            
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.backgroundColor = randomColor()
        })
        
        self.regularEmptyCard.sideMarginsEnabled = true
        self.regularEmptyCard.bottomMarginEnabled = true
        self.regularEmptyCard.topMarginEnabled = true
        self.regularEmptyCard.embedView(views[0])
        
        self.singleLineTitleCard.topMarginEnabled = true
        self.singleLineTitleCard.headerTitle = "One Title"
        self.singleLineTitleCard.embedView(views[1])
        
        self.doubleLineTitleCard.topMarginEnabled = true
        self.doubleLineTitleCard.headerTitle = "Two Titles,\none card 🃏"
        self.doubleLineTitleCard.embedView(views[2])
        
        self.manyLinesTitleCard.topMarginEnabled = true
        self.manyLinesTitleCard.headerTitle = "This is an example of a really big card title, which should never really be implemented by a sane person."
        self.manyLinesTitleCard.embedView(views[3])
        
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
