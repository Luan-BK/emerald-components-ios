//
//  ButtonsViewController.swift
//  EmeraldComponentsApp
//
//  Created by João Mendes | Stone on 05/12/18.
//  Copyright © 2018 StoneCo. All rights reserved.
//

import UIKit
import EmeraldComponents

class ButtonsViewController: UIViewController {

    @IBOutlet weak var customFillButton: EmeraldButton!
    @IBOutlet weak var customOutlineButton: EmeraldButton!
    
    let backgroundColor: UIColor = UIColor(
        red: 128/255, green: 58/255, blue: 220/255, alpha: 1.0
    )
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setupCustomFillButton()
        self.setupCustomOutlineButton()
    }
    
    internal func setupCustomFillButton() {
        let titleColor = UIColor.Palette.Light.white1
        let image = UIImage(
            named: "button-check-icon", in: Bundle.emerald, compatibleWith: nil
        )?.withRenderingMode(.alwaysTemplate)
        
        self.customFillButton.backgroundColor = self.backgroundColor
        self.customFillButton.setTitleColor(titleColor, for: .normal)
        self.customFillButton.layer.borderColor = titleColor.cgColor
        self.customFillButton.setTitle("Custom fill", for: .normal)
        self.customFillButton.layer.cornerRadius = 20
        self.customFillButton.setImage(image, for: .normal)
        self.customFillButton.tintColor = UIColor.white
        self.customFillButton.image
        self.customFillButton.titleEdgeInsets = UIEdgeInsets(
            top: 0.0, left: 8.0, bottom: 0.0, right: 0.0
        )
        self.customFillButton.imageEdgeInsets = UIEdgeInsets(
            top: 0.0, left: 0.0, bottom: 0.0, right: 8.0
        )
        self.customFillButton.addTarget(self, action: #selector(restoreBackground), for: [
            .touchUpInside, .touchCancel, .touchDragOutside
        ])
        self.customFillButton.addTarget(self, action: #selector(darkenBackground), for: .touchDown)
    }

    @objc internal func restoreBackground() {
        self.customFillButton.backgroundColor = self.backgroundColor
    }
    
    @objc internal func darkenBackground() {
        self.customFillButton.backgroundColor = self.backgroundColor.darker()
    }
    
    internal func setupCustomOutlineButton() {
        let titleColor = UIColor.Palette.Dark.black1
        
        self.customOutlineButton.configure(style: .outline, type: .confirm)
        self.customOutlineButton.setTitle("Custom Outline", for: .normal)
        self.customOutlineButton.layer.cornerRadius = 20
        self.customOutlineButton.setTitleColor(titleColor, for: .normal)
    }
    
}
