//
//  PickerTableViewController.swift
//  EmeraldComponentsApp
//
//  Created by João Mendes | Stone on 11/09/18.
//  Copyright © 2018 StoneCo. All rights reserved.
//

import UIKit
import EmeraldComponents

class PickerTableViewController: UITableViewController {

    @IBOutlet weak var pickerView: EmeraldPicker!
    @IBOutlet weak var searchView: EmeraldPicker!
    
    private var selectedPeriod: EmeraldDateRangePicker.EmeraldDatePeriod?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        pickerView.delegate = self
        pickerView.dataSource = self
        searchView.delegate = self
        searchView.dataSource = self
    }

}

extension PickerTableViewController: EmeraldInputDelegate {
    
    func inputDidChange(_ input: EmeraldInput, text: String, valid: Bool) {
        print("\(input.title) has text: \(text) \nValid: \(valid)")
    }
    
}

extension PickerTableViewController: EmeraldPickerDelegate, EmeraldPickerDataSource {
    
    func didDeselectOption(_ picker: EmeraldPicker, option: PickerData) {
        print("User deselected \(option.identifier) in \(picker.title)")
    }
    
    func didSelectOption(_ picker: EmeraldPicker, option: PickerData) {
        print("User selected \(option.identifier) in \(picker.title)")
    }
    
    func pickerOptions(for picker: EmeraldPicker) -> [PickerData] {
        switch picker {
        case self.pickerView:
            return ["Bank of Brasil", "Itáu", "Unibanco", "Bradesco"]
        case self.searchView:
            return [
                "Bank of Brasil",
                "Itáu",
                "Unibanco",
                "Bradesco",
                "Santander",
                "HSBC",
                "Bank of America",
                "Bank of Nordeste",
                "Banesp",
                "UNIBAN",
                "Bank of Canada"]
        default:
            return []
        }
    }
    
}
