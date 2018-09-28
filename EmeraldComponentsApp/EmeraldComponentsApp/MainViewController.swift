//
//  ViewController.swift
//  BasicTestApplication
//
//  Created by Luan Kalume | Stone on 20/06/2018.
//  Copyright © 2018 StoneCo. All rights reserved.
//

import UIKit
import EmeraldComponents

class MainViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - Table view delegate and data source
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.section {
        case 1:
            switch indexPath.row {
            case 1:
                self.pushViewController()
            case 2:
                self.pushViewController2()
            default:
                break
            }
        default:
            break
        }
    }
    
    func pushViewController() {
        let identifier = String(describing: SalesSimulationTableViewController.self)
        let storyboard = UIStoryboard(name: "SalesSimulation", bundle: Bundle.basic)
        if let vc = storyboard.instantiateViewController(withIdentifier: identifier) as? SalesSimulationTableViewController {
            vc.delegate = self
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    func pushViewController2() {
        let identifier = String(describing: SalesSimulatedTableViewController.self)
        let storyboard = UIStoryboard(name: "SaleSimulated", bundle: Bundle.basic)
        if let vc = storyboard.instantiateViewController(withIdentifier: identifier) as? SalesSimulatedTableViewController {
            vc.delegate = self
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }

}

extension MainViewController: SaleSimulationDelegate {
    
    func didSelectSaleSimulation() -> SalesSimulationViewModel {
        let model = SalesSimulationModel(brands: ["Visa", "Master", "Stone"], fees: ["A vista", "Parcelado"])
        return SalesSimulationViewModel(model: model)
    }
    
    func didPushViewController() {
        let identifier = String(describing: SalesSimulatedTableViewController.self)
        let storyboard = UIStoryboard(name: "SaleSimulated", bundle: Bundle.basic)
        if let vc = storyboard.instantiateViewController(withIdentifier: identifier) as? SalesSimulatedTableViewController {
            vc.delegate = self
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }

}

extension MainViewController: SalesSimulatedDelegate {
    
    func retrieveViewModel() -> SalesSimulatedViewModel {
        let simulated = SaleSimulatedModel()
        simulated.grossAmount = 100.0
        simulated.prepayAmount = 10
        simulated.totalNetAmount = simulated.grossAmount - simulated.prepayAmount
        
        return SalesSimulatedViewModel(model: simulated)
    }
    
}
