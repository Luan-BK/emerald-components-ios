//
//  SalesSimulationProtocol.swift
//  EmeraldComponents
//
//  Created by João Mendes | Stone on 21/09/18.
//  Copyright © 2018 StoneCo. All rights reserved.
//

import UIKit

//public protocol SaleSimulationPresentable {
//    var brands: [String] { get }
//    var fees: [Float] { get }
//}

public protocol SaleSimulationDelegate: class {
    func didPushViewController(viewModel: SalesSimulationViewModel,
                               to viewController: UIViewController)
}
