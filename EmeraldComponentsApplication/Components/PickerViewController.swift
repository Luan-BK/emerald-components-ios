//
//  PickerViewController.swift
//  BasicTestApplication
//
//  Created by Luan Kalume | Stone on 21/06/2018.
//  Copyright © 2018 StoneCo. All rights reserved.
//

import UIKit
import EmeraldComponents

class PickerViewController: UIViewController {

    @IBOutlet weak var firstPicker: EmeraldPicker!
    @IBOutlet weak var secondPicker: EmeraldPicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        firstPicker.delegate = self
        firstPicker.dataSource = self
        
        secondPicker.delegate = self
        secondPicker.dataSource = self
    }

}

extension PickerViewController: EmeraldInputDelegate {
    
    func inputDidChange(_ input: EmeraldInput, text: String, valid: Bool) {
        print("\(input.title) has text: \(text) \nValid: \(valid)")
    }
    
}

extension String: PickerData {
    public var identifier: String {
        return self
    }
}

extension PickerViewController: EmeraldPickerDelegate, EmeraldPickerDataSource {
    
    func didDeselectOption(_ picker: EmeraldPicker, option: PickerData) {
        print("User deselected \(option.identifier) in \(picker.title)")
    }
    
    func didSelectOption(_ picker: EmeraldPicker, option: PickerData) {
        print("User selected \(option.identifier) in \(picker.title)")
    }
    
    func pickerOptions(for picker: EmeraldPicker) -> [PickerData] {
        switch picker {
        case self.firstPicker:
            return ["Banco do Brasil", "Itáu", "Unibanco", "Bradesco"]
        case self.secondPicker:
            return ["Banco do Brasil", "Itáu", "Unibanco", "Bradesco", "Santander", "HSBC", "Bank of America", "Bando do Nordeste", "Banesp", "UNIBAN", "BankBank"]
        default:
            return []
        }
    }
    
}
