//
//  SalesSimulatedViewModel.swift
//  EmeraldComponents
//
//  Created by João Mendes | Stone on 21/09/18.
//  Copyright © 2018 StoneCo. All rights reserved.
//

import UIKit

// MARK: - Model instantiated
public struct SalesSimulatedViewModel {
    
    private let model: SaleSimulatedModel
    
    public var grossAmount: String {
        return model.grossAmount.onlyDigitsCurrency() ?? ""
    }
    
    public var prepayAmount: String {
        return model.prepayAmount.onlyDigitsCurrency() ?? ""
    }
    
    public var totalNetAmount: String {
        return model.totalNetAmount.onlyDigitsCurrency() ?? ""
    }
    
    public init(model: SaleSimulatedModel) {
        self.model = model
    }
    
}

// MARK: - Button Presentable
extension SalesSimulatedViewModel: ButtonSalesSimulatedPresentable {
    
}

// MARK: - Image Presentable
extension SalesSimulatedViewModel: ImageSalesSimulatedPresentable {
    
}
