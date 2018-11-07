//
//  EmeraldCustomDateRangePicker.swift
//  EmeraldComponents
//
//  Created by Luan Kalume | Stone on 13/08/2018.
//  Copyright © 2018 StoneCo. All rights reserved.
//

import UIKit

public class EmeraldCustomDateRangePicker: UIViewController {

    @IBOutlet weak var iconImageView: UIImageView!
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
            self.setUpPickers(startDate: self.customRange.start, finalDate: self.customRange.end)
        }
    }
    public weak var delegate: EmeraldDateRangePickerDelegate?
    
    override public func viewDidLoad() {
        super.viewDidLoad()

        self.setUpPickers(startDate: self.customRange.start, finalDate: self.customRange.end)
        self.setUpLabelColorPickers()
        self.setUpIcon()
    }
    
    internal func setUpPickers(startDate: Date, finalDate: Date) {
        self.startDatePicker.date = self.customRange.start
        self.finalDatePicker.date = self.customRange.end
        self.startDateLabel.text = self.startDatePicker.date.dateStringWithSlashes()
        self.finalDateLabel.text = self.finalDatePicker.date.dateStringWithSlashes()
    }
    
    internal func setUpLabelColorPickers() {
        self.startDateLabel.textColor = UIColor.Palette.CommonState.focus
        self.finalDateLabel.textColor = UIColor.Palette.CommonState.focus
    }
    
    internal func setUpIcon() {
        let image = UIImage(named: "calendar-icon",
                            in: Bundle.emerald,
                            compatibleWith: nil)!
            .withRenderingMode(.alwaysTemplate)
        
        self.iconImageView.image = image
        self.iconImageView.tintColor = UIColor.Palette.CommonState.focus
    }
    
    // MARK: - Button touches
    
    @IBAction func okButtonTouched() {
        self.delegate?.didChooseDateRange(start: self.startDatePicker.date,
                                          end: self.finalDatePicker.date,
                                          range: .custom)
    }
    
    @IBAction func startDateValueChanged() {
        self.startDateLabel.text = self.startDatePicker.date.dateStringWithSlashes()
        if self.startDatePicker.date > self.finalDatePicker.date {
            self.finalDatePicker.setDate(self.startDatePicker.date, animated: true)
            self.finalDateLabel.text = self.finalDatePicker.date.dateStringWithSlashes()
        }
    }
    
    @IBAction func finalDateValueChanged() {
        if self.finalDatePicker.date < self.startDatePicker.date {
            self.finalDatePicker.setDate(self.startDatePicker.date, animated: true)
            self.finalDateLabel.text = self.finalDatePicker.date.dateStringWithSlashes()
        } else {
            self.finalDateLabel.text = self.finalDatePicker.date.dateStringWithSlashes()
        }
    }
    
    @IBAction func startDateButtonTouched() {
        if self.startDatePickerContainerView.isHidden {
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
        if self.finalDatePickerContainerView.isHidden {
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
