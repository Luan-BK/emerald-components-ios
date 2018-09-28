//
//  SalesSimulationDelegate.swift
//  EmeraldComponents
//
//  Created by João Mendes | Stone on 24/09/18.
//  Copyright © 2018 StoneCo. All rights reserved.
//

import UIKit    

public protocol SaleSimulationDelegate: class {
    func didSelectSaleSimulation() -> SalesSimulationViewModel
    func didPushViewController()
}
