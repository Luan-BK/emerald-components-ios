//
//  LabelTableViewController.swift
//  EmeraldComponentsApp
//
//  Created by João Mendes | Stone on 23/10/18.
//  Copyright © 2018 StoneCo. All rights reserved.
//

import UIKit
import EmeraldComponents

class LabelTableViewController: UITableViewController {

    // Fill properties
    @IBOutlet weak var fillErrorLabel: EmeraldLabel!
    @IBOutlet weak var fillWarningLabel: EmeraldLabel!
    @IBOutlet weak var fillNeutralLabel: EmeraldLabel!
    @IBOutlet weak var fillSuccessLabel: EmeraldLabel!
    @IBOutlet weak var fillInfoLabel: EmeraldLabel!
    
    // Outline properties
    @IBOutlet weak var outlineErrorLabel: EmeraldLabel!
    @IBOutlet weak var outlineWarningLabel: EmeraldLabel!
    @IBOutlet weak var outlineNeutralLabel: EmeraldLabel!
    @IBOutlet weak var outlineSuccessLabel: EmeraldLabel!
    @IBOutlet weak var outlineInfoLabel: EmeraldLabel!
    
    // Text properties
    @IBOutlet weak var textErrorLabel: EmeraldLabel!
    @IBOutlet weak var textWarningLabel: EmeraldLabel!
    @IBOutlet weak var textNeutralLabel: EmeraldLabel!
    @IBOutlet weak var textSuccessLabel: EmeraldLabel!
    @IBOutlet weak var textInfoLabel: EmeraldLabel!
    
    // Image properties
    @IBOutlet weak var imageErrorLabel: EmeraldLabel!
    @IBOutlet weak var imageWarningLabel: EmeraldLabel!
    @IBOutlet weak var imageNeutralLabel: EmeraldLabel!
    @IBOutlet weak var imageSuccessLabel: EmeraldLabel!
    @IBOutlet weak var imageInfoLabel: EmeraldLabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setupFillLabels()
        self.setupOutlineLabels()
        self.setupTextLabels()
        self.setupImageLabels()
    }
    
    internal func setupFillLabels() {
        fillErrorLabel.setLabel(text: "Error")
        fillErrorLabel.configure(state: .error, type: .fill)
        
        fillWarningLabel.setLabel(text: "Warning")
        fillWarningLabel.configure(state: .warning, type: .fill)
        
        fillNeutralLabel.setLabel(text: "Neutral")
        fillNeutralLabel.configure(state: .neutral, type: .fill)
        
        fillSuccessLabel.setLabel(text: "Success")
        fillSuccessLabel.configure(state: .success, type: .fill)
        
        fillInfoLabel.setLabel(text: "Info")
        fillInfoLabel.configure(state: .info, type: .fill)
        
    }
    
    internal func setupOutlineLabels() {
        outlineErrorLabel.setLabel(text: "Error")
        outlineErrorLabel.configure(state: .error, type: .outline)
        
        outlineWarningLabel.setLabel(text: "Warning")
        outlineWarningLabel.configure(state: .warning, type: .outline)
        
        outlineNeutralLabel.setLabel(text: "Neutral")
        outlineNeutralLabel.configure(state: .neutral, type: .outline)
        
        outlineSuccessLabel.setLabel(text: "Success")
        outlineSuccessLabel.configure(state: .success, type: .outline)
        
        outlineInfoLabel.setLabel(text: "Info")
        outlineInfoLabel.configure(state: .info, type: .outline)
    }
    
    internal func setupTextLabels() {
        textErrorLabel.setLabel(text: "Error")
        textErrorLabel.configure(state: .error, type: .text)
        
        textWarningLabel.setLabel(text: "Warning")
        textWarningLabel.configure(state: .warning, type: .text)
        
        textNeutralLabel.setLabel(text: "Neutral")
        textNeutralLabel.configure(state: .neutral, type: .text)
        
        textSuccessLabel.setLabel(text: "Success")
        textSuccessLabel.configure(state: .success, type: .text)
        
        textInfoLabel.setLabel(text: "Info")
        textInfoLabel.configure(state: .info, type: .text)
    }
    
    internal func setupImageLabels() {
        imageErrorLabel.setLabel(text: "Error")
        imageErrorLabel.setIcon(name: "button-edit-icon")
        imageErrorLabel.configure(state: .error, type: .image)
        
        imageWarningLabel.setLabel(text: "Warning")
        imageWarningLabel.setIcon(name: "button-edit-icon")
        imageWarningLabel.configure(state: .warning, type: .image)
        
        imageNeutralLabel.setLabel(text: "Neutral")
        imageNeutralLabel.setIcon(name: "button-edit-icon")
        imageNeutralLabel.configure(state: .neutral, type: .image)
        
        imageSuccessLabel.setLabel(text: "Success")
        imageSuccessLabel.setIcon(name: "button-edit-icon")
        imageSuccessLabel.configure(state: .success, type: .image)
        
        imageInfoLabel.setLabel(text: "Info")
        imageInfoLabel.setIcon(name: "button-edit-icon")
        imageInfoLabel.configure(state: .info, type: .image)
    }
    
}
