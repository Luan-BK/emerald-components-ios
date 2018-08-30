//
//  WalletDetailTableCell.swift
//  SlingBasicComponent
//
//  Created by João Mendes | Stone on 30/04/18.
//  Copyright © 2018 StoneCo. All rights reserved.
//

import UIKit

public class WalletDetailTableCell: SlingTableViewCell {

    @IBOutlet public weak var colorView: UIView!
    @IBOutlet public weak var walletTypeLabel: UILabel!
    @IBOutlet public weak var signLabel: UILabel!
    @IBOutlet public weak var amountLabel: UILabel!
    @IBOutlet public weak var arrowImageView: UIImageView!
    @IBOutlet public weak var movementsStackView: UIStackView!
    
    private let bundle = Bundle(for: WalletDetailTableCell.self)
    
    public var movements: [String : (amount: String, color: UIColor)] = [:]
    
    override public func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        switch selected {
        case true:
            self.addMovementInfoToStack(self.movements)
        case false:
            self.removeMovementInfoFromStack()
        }
    }
    
    public func configure(_ viewModel: PaymentDetailViewModel, movements: [String : (amount: String, color: UIColor)] = [:]) {
        colorView.backgroundColor = viewModel.barColor
        walletTypeLabel.text = viewModel.walletTypeString
        walletTypeLabel.textColor = UIColor.veryDarkGrayScaleContentBackground
        signLabel.text = viewModel.signString
        signLabel.textColor = viewModel.signColor
        amountLabel.text = viewModel.amountString
        amountLabel.textColor = viewModel.signColor
        arrowImageView.isHidden = false
        
        if movements.isEmpty == false {
            self.movements = movements
            self.addMovementInfoToStack(self.movements)
        }
    }
    
    public func configureSum(_ amountColor: UIColor, _ amountText: String) {
        self.removeMovementInfoFromStack()
        
        colorView.backgroundColor = .clear
        walletTypeLabel.text = "Saldo do dia"
        walletTypeLabel.textColor = UIColor.veryDarkGrayScaleContentBackground
        signLabel.text = "="
        signLabel.textColor = UIColor.veryDarkGrayScaleContentBackground
        amountLabel.text = amountText
        amountLabel.textColor = amountColor
        arrowImageView.isHidden = true
    }
    
    internal func addMovementInfoToStack(_ info: [String : (amount: String, color: UIColor)]) {
        self.removeMovementInfoFromStack()
        self.arrowImageView.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
        for movementName in info.keys {
            
            let movementNameLabel = self.createLabel()
            let movementAmountLabel = self.createLabel()
            
            movementNameLabel.text = movementName
            movementNameLabel.numberOfLines = 0
            movementNameLabel.textAlignment = .left

            movementAmountLabel.text = info[movementName]?.amount
            movementAmountLabel.textAlignment = .right
            movementAmountLabel.textColor = info[movementName]?.color
            
            let movementStackView = UIStackView(arrangedSubviews: [movementNameLabel, movementAmountLabel])
            movementStackView.alignment = .fill
            movementStackView.distribution = .fillEqually
            
            self.movementsStackView.addArrangedSubview(movementStackView)
        }
    }
    
    internal func removeMovementInfoFromStack() {
        self.arrowImageView.transform = CGAffineTransform.identity
        self.movementsStackView.subviews.forEach({ $0.removeFromSuperview() })
        self.movementsStackView.arrangedSubviews.forEach({ self.movementsStackView.removeArrangedSubview($0) })
    }
    
    private func createLabel() -> UILabel {
        let label = UILabel()
        label.textColor = UIColor.veryDarkGrayScaleContentBackground
        label.font = UIFont.systemFont(ofSize: 13.0)
        return label
    }
    
}
