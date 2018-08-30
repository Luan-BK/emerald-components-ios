//
//  CalendarCollectionCustomViewCell.swift
//  SlingBasicComponent
//
//  Created by João Mendes | Stone on 26/04/18.
//  Copyright © 2018 StoneCo. All rights reserved.
//

import UIKit
import JTAppleCalendar

public class CalendarCollectionCustomViewCell: JTAppleCell {

    // MARK: Storyboard properties connections
    @IBOutlet public weak var selectedDayBackgroundView: UIView!
    @IBOutlet public weak var dayLabel: UILabel!
    @IBOutlet weak var statusView: UIView!
    
    override public func awakeFromNib() {
        super.awakeFromNib()
        selectedDayBackgroundView.layer.cornerRadius = 20
        statusView.layer.cornerRadius = statusView.bounds.width * 0.5
        statusView.isHidden = true
    }

    public func configure(_ viewModel: PaymentListViewModel?) {
        guard let statusColor = viewModel?.statusColor else {
            statusView.isHidden = true
            return
        }
        
        statusView.backgroundColor = statusColor
        statusView.isHidden = false
    }
}
