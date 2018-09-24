//
//  SalesSimulationViewModel.swift
//  EmeraldComponents
//
//  Created by João Mendes | Stone on 21/09/18.
//  Copyright © 2018 StoneCo. All rights reserved.
//

import Foundation

public struct SalesSimulationViewModel: SaleSimulationPresentable {
    
    private let model: SalesSimulationModel
    
    public var brands: [String] {
        return model.brands
    }
    
    public var fees: [String] {
        return model.fees
    }
    
    public init(model: SalesSimulationModel) {
        self.model = model
    }
    
}
