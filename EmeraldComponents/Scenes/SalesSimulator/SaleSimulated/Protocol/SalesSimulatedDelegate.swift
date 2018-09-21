//
//  SalesSimulatedDelegate.swift
//  EmeraldComponents
//
//  Created by João Mendes | Stone on 21/09/18.
//  Copyright © 2018 StoneCo. All rights reserved.
//

import Foundation

public protocol SalesSimulatedDelegate: class {
    func retrieveViewModel() -> SalesSimulatedViewModel
}
