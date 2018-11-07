//
//  EmeraldDateRangeFilterView.swift
//  EmeraldBusinessComponent
//
//  Created by Luan Kalume | Stone on 15/08/2018.
//  Copyright © 2018 StoneCo. All rights reserved.
//

import UIKit

public protocol EmeraldDateRangeFilterViewDelegate: class {
    func didTouchFilterButton()
}

@IBDesignable
public class EmeraldDateRangeFilterView: UIView {
    
    @IBOutlet var contentView: UIView!
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    
    public weak var filterDelegate: EmeraldDateRangePickerDelegate?
    public weak var delegate: EmeraldDateRangeFilterViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.xibSetup()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.xibSetup()
    }
    
    private func xibSetup() {
        let bundle = Bundle(for: type(of: self))

        bundle.loadNibNamed(String(describing: EmeraldDateRangeFilterView.self), owner: self, options: nil)
        addSubview(self.contentView)
        self.contentView.frame = self.bounds
        self.contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        self.contentView.layer.borderWidth = 1
        self.contentView.layer.borderColor = UIColor.Palette.Light.white4.cgColor
        
        self.setUpIcon()
    }
    
    internal func setUpIcon() {
        let calendarIcon = UIImage(named: "payments-detail-calendar-icon",
                                   in: Bundle.emerald,
                                   compatibleWith: nil)!
            .withRenderingMode(.alwaysTemplate)
        
        self.imageView.image = calendarIcon
        self.imageView.tintColor = UIColor.Palette.CommonState.focus
    }
    
    @IBAction func filterButtonTouched() {
        self.delegate?.didTouchFilterButton()
    }
    
    // MARK: - Aux methods
    
    internal func setLabels(for period: EmeraldDateRangePicker.EmeraldDatePeriod, range: (start: Date?, end: Date?)) {
        switch period {
        case .today, .yesterday, .last30Days, .last7Days, .custom:
            self.titleLabel.text = period.description
        case .lastMonth, .thisMonth:
            self.titleLabel.text = range.start?.monthString()
        }
        
        if let startString = range.start?.simpleDateString(), let endString = range.end?.simpleDateString() {
            self.subtitleLabel.text = "\(startString) a \(endString)"
        } else {
            self.subtitleLabel.text = "---"
        }
    }
}

extension EmeraldDateRangeFilterView: EmeraldDateRangePickerDelegate {
    
    public func didChooseDateRange(start: Date?, end: Date?, range: EmeraldDateRangePicker.EmeraldDatePeriod) {
        self.setLabels(for: range, range: (start, end))
        self.filterDelegate?.didChooseDateRange(start: start, end: end, range: range)
    }
    
}
