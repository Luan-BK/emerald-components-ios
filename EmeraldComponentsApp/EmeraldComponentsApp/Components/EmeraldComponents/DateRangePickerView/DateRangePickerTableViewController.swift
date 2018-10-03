//
//  DateRangePickerTableViewController.swift
//  EmeraldComponentsApp
//
//  Created by João Mendes | Stone on 12/09/18.
//  Copyright © 2018 StoneCo. All rights reserved.
//

import UIKit
import EmeraldComponents

class DateRangePickerTableViewController: UITableViewController {

    @IBOutlet weak var periodLabel: UILabel!
    
    private var selectedPeriod: EmeraldDateRangePicker.EmeraldDatePeriod?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        periodLabel.accessibilityIdentifier = "dateRangeValue"
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.destination {
        case let dateRangePicker as EmeraldDateRangePicker:
            dateRangePicker.delegate = self
            if let range = self.selectedPeriod {
                dateRangePicker.selectedPeriod = range
            }
        default:
            break
        }
    }
    
    func dateStringWithSlashes(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        
        return formatter.string(from: date)
    }
    
    @IBAction func filterDate(_ sender: Any) {
        let identifier = String(describing: EmeraldDateRangePicker.self)
        let storyboard = UIStoryboard(name: "DateRangePicker", bundle: Bundle.basic)
        if let vc = storyboard.instantiateViewController(withIdentifier: identifier) as? EmeraldDateRangePicker {
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
}

extension DateRangePickerTableViewController: EmeraldDateRangePickerDelegate {
    
    func didChooseDateRange(start: Date?, end: Date?, range: EmeraldDateRangePicker.EmeraldDatePeriod) {
        self.periodLabel.text = "\(self.dateStringWithSlashes(start!)) - \(self.dateStringWithSlashes(end!))"
        self.selectedPeriod = range
        
        if range == .custom {
            self.navigationController?.popViewControllers(2)
        } else {
            self.navigationController?.popViewControllers(1)
        }
    }
    
}
