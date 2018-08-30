//
//  SlingOperationTableViewCell.swift
//  SlingBasicComponent
//
//  Created by Luan Kalume | Stone on 27/04/2018.
//  Copyright © 2018 StoneCo. All rights reserved.
//

import UIKit

public class SlingOperationTableViewCell: SlingTableViewCell {
    
    @IBOutlet weak var cardBrandImageView: UIImageView!
    @IBOutlet weak var transactionTypeLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var amountLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    
    override public func awakeFromNib() {
        super.awakeFromNib()
        clearAllFields()
    }

    public func configure(_ model: SlingOperationCellViewModel) {
        clearAllFields()
        
        cardBrandImageView.image = model.cardBrandImage
        transactionTypeLabel.text = model.transactionType
        dateLabel.text = model.dateOperation
        amountLabel.text = model.amount
        categoryLabel.text = model.movementCategory
        categoryLabel.textColor = model.movementCategoryColor
        statusLabel.text = model.settlementStatus
        statusLabel.textColor = model.settlementStatusColor
        accessoryType = model.accessoryType
    }
    
    func clearAllFields() {
        cardBrandImageView.image = nil
        transactionTypeLabel.text = ""
        dateLabel.text = ""
        amountLabel.text = ""
        categoryLabel.text = ""
        statusLabel.text = ""
        accessoryType = .none
    }
}
