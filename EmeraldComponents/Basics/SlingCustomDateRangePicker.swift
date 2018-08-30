//
//  SlingCustomDateRangePicker.swift
//  SlingBasicComponent
//
//  Created by Luan Kalume | Stone on 13/08/2018.
//  Copyright © 2018 StoneCo. All rights reserved.
//

import UIKit

public class SlingCustomDateRangePicker: UIViewController {

    @IBOutlet weak var startDateLabel: UILabel!
    @IBOutlet weak var finalDateLabel: UILabel!
    @IBOutlet weak var startDatePicker: UIDatePicker!
    @IBOutlet weak var finalDatePicker: UIDatePicker!
    @IBOutlet weak var startDatePickerContainerView: UIView!
    @IBOutlet weak var finalDatePickerContainerView: UIView!
    @IBOutlet weak var startDateBottomLineView: UIView!
    @IBOutlet weak var finalDateBottomLineView: UIView!
    
    public var customRange = (start: Date(), end: Date()) {
        didSet {
            self.setUpPickers(startDate: customRange.start, finalDate: customRange.end)
        }
    }
    public weak var delegate: SlingDateRangePickerDelegate?
    
    override public func viewDidLoad() {
        super.viewDidLoad()

        self.setUpPickers(startDate: customRange.start, finalDate: customRange.end)
    }
    
    func setUpPickers(startDate: Date, finalDate: Date) {
        startDatePicker.date = customRange.start
        finalDatePicker.date = customRange.end
        startDateLabel.text = startDatePicker.date.dateStringWithSlashes()
        finalDateLabel.text = finalDatePicker.date.dateStringWithSlashes()
    }
    
    // MARK: - Button touches
    
    @IBAction func okButtonTouched() {
        self.delegate?.didChooseDateRange(start: startDatePicker.date, end: finalDatePicker.date, range: .custom)
    }
    
    @IBAction func startDateValueChanged() {
        startDateLabel.text = startDatePicker.date.dateStringWithSlashes()
        if startDatePicker.date > finalDatePicker.date {
            finalDatePicker.setDate(startDatePicker.date, animated: true)
            finalDateLabel.text = finalDatePicker.date.dateStringWithSlashes()
        }
    }
    
    @IBAction func finalDateValueChanged() {
        if finalDatePicker.date < startDatePicker.date {
            finalDatePicker.setDate(startDatePicker.date, animated: true)
            finalDateLabel.text = finalDatePicker.date.dateStringWithSlashes()
        } else {
            finalDateLabel.text = finalDatePicker.date.dateStringWithSlashes()
        }
    }
    
    @IBAction func startDateButtonTouched() {
        if startDatePickerContainerView.isHidden {
            UIView.animate(withDuration: 0.3, animations: {
                self.startDateBottomLineView.alpha = 1.0
                self.finalDateBottomLineView.alpha = 0.0
            })
            self.hideContainerView(self.finalDatePickerContainerView)
            self.showContainerView(self.startDatePickerContainerView)
        } else {
            self.hideContainerView(self.startDatePickerContainerView)
            UIView.animate(withDuration: 0.3, animations: {
                self.startDateBottomLineView.alpha = 0.0
            })
        }
    }
    
    @IBAction func finalDateButtonTouched() {
        if finalDatePickerContainerView.isHidden {
            UIView.animate(withDuration: 0.3, animations: {
                self.finalDateBottomLineView.alpha = 1.0
                self.startDateBottomLineView.alpha = 0.0
            })
            self.hideContainerView(self.startDatePickerContainerView)
            self.showContainerView(self.finalDatePickerContainerView)
        } else {
            self.hideContainerView(self.finalDatePickerContainerView)
            UIView.animate(withDuration: 0.3, animations: {
                self.finalDateBottomLineView.alpha = 0.0
            })
        }
    }
    
    // MARK: - Animation
    
    private func hideContainerView(_ view: UIView) {
        UIView.animate(withDuration: 0.2, delay: 0.0, options: .curveLinear, animations: {
            view.alpha = 0.0
        })
        UIView.animate(withDuration: 0.4, delay: 0.1, options: .curveEaseIn, animations: {
            if !view.isHidden { view.isHidden = true }
        })
    }
    
    private func showContainerView(_ view: UIView) {
        view.alpha = 0.0
        UIView.animate(withDuration: 0.4, delay: 0.0, options: .curveEaseOut, animations: {
            if view.isHidden { view.isHidden = false }
        })
        UIView.animate(withDuration: 0.2, delay: 0.3, options: .curveLinear, animations: {
            view.alpha = 1.0
        })
    }

}
