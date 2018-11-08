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
    
    private let errorLabel = "Error"
    private let warningLabel = "Warning"
    private let neutralLabel = "Neutral"
    private let successLabel = "Success"
    private let infoLabel = "Info"
    
    private let errorColor = UIColor.Palette.State.error
    private let warningColor = UIColor.Palette.State.warning
    private let neutralColor = UIColor.Palette.Light.white4
    private let successColor = UIColor.Palette.State.success
    private let infoColor = UIColor(red: 128/255, green: 58/255, blue: 220/255, alpha: 1.0)
    
    private var icon = UIImage(named: "button-edit-icon", in: Bundle.emerald, compatibleWith: nil)!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setupFillLabels()
        self.setupOutlineLabels()
        self.setupTextLabels()
        self.setupImageLabels()
    }
    
    internal func setupFillLabels() {
        self.fillErrorLabel.configureFor(text: self.errorLabel, color: self.errorColor, type: .fill, and: nil)
        self.fillWarningLabel.configureFor(text: self.warningLabel, color: self.warningColor, type: .fill, and: nil)
        self.fillNeutralLabel.configureFor(text: self.neutralLabel, color: self.neutralColor, type: .fill, and: nil)
        self.fillSuccessLabel.configureFor(text: self.successLabel, color: self.successColor, type: .fill, and: nil)
        self.fillInfoLabel.configureFor(text: self.infoLabel, color: self.infoColor, type: .fill, and: nil)
    }
    
    internal func setupOutlineLabels() {
        self.outlineErrorLabel.configureFor(text: self.errorLabel, color: self.errorColor, type: .outline, and: nil)
        self.outlineWarningLabel.configureFor(text: self.warningLabel, color: self.warningColor, type: .outline, and: nil)
        self.outlineNeutralLabel.configureFor(text: self.neutralLabel, color: self.neutralColor, type: .outline, and: nil)
        self.outlineSuccessLabel.configureFor(text: self.successLabel, color: self.successColor, type: .outline, and: nil)
        self.outlineInfoLabel.configureFor(text: self.infoLabel, color: self.infoColor, type: .outline, and: nil)
    }
    
    internal func setupTextLabels() {
        self.textErrorLabel.configureFor(text: self.errorLabel, color: self.errorColor, type: .image, and: nil)
        self.textWarningLabel.configureFor(text: self.warningLabel, color: self.warningColor, type: .image, and: nil)
        self.textNeutralLabel.configureFor(text: self.neutralLabel, color: self.neutralColor, type: .image, and: nil)
        self.textSuccessLabel.configureFor(text: self.successLabel, color: self.successColor, type: .image, and: nil)
        self.textInfoLabel.configureFor(text: self.infoLabel, color: self.infoColor, type: .image, and: nil)
    }
    
    internal func setupImageLabels() {
        self.imageErrorLabel.configureFor(text: self.errorLabel, color: self.errorColor, type: .image, and: self.icon)
        self.imageWarningLabel.configureFor(text: self.warningLabel, color: self.warningColor, type: .image, and: self.icon)
        self.imageNeutralLabel.configureFor(text: self.neutralLabel, color: self.neutralColor, type: .image, and: self.icon)
        self.imageSuccessLabel.configureFor(text: self.successLabel, color: self.successColor, type: .image, and: self.icon)
        self.imageInfoLabel.configureFor(text: self.infoLabel, color: self.infoColor, type: .image, and: self.icon)
    }
    
}
