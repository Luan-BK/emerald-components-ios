//
//  DateRangePickerViewController.swift
//  BasicTestApplication
//
//  Created by Luan Kalume | Stone on 14/08/2018.
//  Copyright © 2018 StoneCo. All rights reserved.
//

import UIKit
import EmeraldComponents

class DateRangePickerViewController: UIViewController {

    @IBOutlet weak var periodLabel: UILabel!
    
    private var selectedPeriod: EmeraldDateRangePicker.EmeraldDatePeriod?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Date Range Picker"
        self.navigationItem.largeTitleDisplayMode = .never
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
    
}

extension DateRangePickerViewController: EmeraldDateRangePickerDelegate {
    
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
