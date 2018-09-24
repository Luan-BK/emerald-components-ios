//
//  SalesSimulatorRequestTableViewController.swift
//  EmeraldComponents
//
//  Created by João Mendes | Stone on 20/09/18.
//  Copyright © 2018 StoneCo. All rights reserved.
//

import UIKit

public class SalesSimulationTableViewController: UITableViewController {

    @IBOutlet weak var amountEmeraldInput: EmeraldInput!
    @IBOutlet weak var brandsEmeraldInput: EmeraldPicker!
    @IBOutlet weak var feesEmeraldInput: EmeraldPicker!
    @IBOutlet weak var feesSimulateEmeraldButton: EmeraldButton!
    
    var viewModel: SalesSimulationViewModel!
    
    let simulated: SaleSimulatedModel = SaleSimulatedModel()
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        
        let model = SalesSimulationModel(brands: ["Visa", "Master"], fees: ["A vista", "Parcelado"])
        viewModel = SalesSimulationViewModel(model: model)
        
        feesSimulateEmeraldButton.setTitle("Simular venda", for: .normal)
        
        amountEmeraldInput.inputDelegate = self
        amountEmeraldInput.setKeyboardType(.numberPad)
        amountEmeraldInput.setMask(.currency)
        
        brandsEmeraldInput.delegate = self
        brandsEmeraldInput.dataSource = self
        brandsEmeraldInput.inputDelegate = self
        
        feesEmeraldInput.delegate = self
        feesEmeraldInput.dataSource = self
        feesEmeraldInput.inputDelegate = self
    }
    
    func resign() {
        amountEmeraldInput.resignFirstResponder()
        brandsEmeraldInput.resignFirstResponder()
        feesEmeraldInput.resignFirstResponder()
    }   
    
    @IBAction func saleSimulateEmeraldButtonAction(_ sender: EmeraldButton) {
        if validate() {
            let identifier = String(describing: SalesSimulatedTableViewController.self)
            let storyboard = UIStoryboard(name: "SaleSimulated", bundle: Bundle.basic)
            if let vc = storyboard.instantiateViewController(withIdentifier: identifier) as? SalesSimulatedTableViewController {
                vc.delegate = self
                self.navigationController?.pushViewController(vc, animated: true)
            }
        }
    }
    
}

// MARK: - Table view delegate and data source

extension SalesSimulationTableViewController {
    
    public override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 20
    }
    
    public override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 20))
        headerView.backgroundColor = UIColor.Palette.Light.white1
        return headerView
    }
    
}

// MARK: - Validation

extension SalesSimulationTableViewController {
    
    func validate() -> Bool {
        if amountEmeraldInput.inputText == "" {
            amountEmeraldInput.setState(.error)
            return false
        }
        
        if brandsEmeraldInput.inputText == "" {
            brandsEmeraldInput.setState(.error)
            return false
        }
        
        if feesEmeraldInput.inputText == "" {
            feesEmeraldInput.setState(.error)
            return false
        }
        
        return true
    }
    
}

// MARK: - Input delegate

extension SalesSimulationTableViewController: EmeraldInputDelegate {
    
    public func inputDidChange(_ input: EmeraldInput, text: String, valid: Bool) {
        switch input {
        case amountEmeraldInput:
            amountEmeraldInput.inputText = text
            
        default:
            break
            
        }
        feesSimulateEmeraldButton.configure(style: .fill, type: .regular)
    }
    
}

// MARK: - Sling picker delegate and data source

extension SalesSimulationTableViewController: EmeraldPickerDelegate, EmeraldPickerDataSource {
    
    public func pickerOptions(for picker: EmeraldPicker) -> [PickerData] {
        switch picker {
        case brandsEmeraldInput:
            return self.viewModel.brands
            
        case feesEmeraldInput:
            return self.viewModel.fees
            
        default:
            fatalError("This case does not exist")
            
        }
    }
    
}

extension SalesSimulationTableViewController: SalesSimulatedDelegate {
    
    public func retrieveViewModel() -> SalesSimulatedViewModel {
        
        let rate = 0.0
        simulated.grossAmount = Double(amountEmeraldInput.inputText.filter { "01234567890".contains($0) })! / 100
        simulated.prepayAmount = (simulated.grossAmount * rate) / 100
        simulated.totalNetAmount = simulated.grossAmount - simulated.prepayAmount

        resign()
        
        return SalesSimulatedViewModel(model: simulated)

    }
    
}
