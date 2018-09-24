//
//  SalesSimulatedTableViewController.swift
//  EmeraldComponents
//
//  Created by João Mendes | Stone on 20/09/18.
//  Copyright © 2018 StoneCo. All rights reserved.
//

import UIKit

public class SalesSimulatedTableViewController: UITableViewController {
    
    // MARK: - Properties
    @IBOutlet weak var grossAmountLabel: UILabel!
    @IBOutlet weak var prepayAmountLabel: UILabel!
    @IBOutlet weak var totalNetAmountLabel: UILabel!
    @IBOutlet weak var iconImage: UIImageView!
    @IBOutlet weak var simulateAgainEmeraldButton: EmeraldButton!
    
    public weak var delegate: SalesSimulatedDelegate?
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        self.onSetProperties()
        self.onSetMethods()
    }
    
    private func onSetProperties() {
        grossAmountLabel.text = delegate?.retrieveViewModel().grossAmount
        prepayAmountLabel.text = delegate?.retrieveViewModel().prepayAmount
        totalNetAmountLabel.text = delegate?.retrieveViewModel().totalNetAmount
    }
    
    private func onSetMethods() {
        iconImage.image = delegate?.retrieveViewModel().iconImage
        
        simulateAgainEmeraldButton.configure(style: delegate?.retrieveViewModel().setStyle,
                                             type: delegate?.retrieveViewModel().setType)
        
        simulateAgainEmeraldButton.setTitle(delegate?.retrieveViewModel().setTitle,
                                            for: (delegate?.retrieveViewModel().setState)!)
    }
    
    @IBAction func simulateAgainEmeraldButtonAction(_ sender: EmeraldButton) {
        self.navigationController?.popViewController(animated: true)
    }

}

// MARK: - Table view delegate and data source

extension SalesSimulatedTableViewController {
    
    public override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 53
    }
    
    public override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return SalesSimulatedCell.setupCell(header: "Resultado da simulação", to: tableView)
    }
    
}
