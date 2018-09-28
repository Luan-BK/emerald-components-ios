//
//  SalesSimulatorModel.swift
//  EmeraldComponents
//
//  Created by João Mendes | Stone on 20/09/18.
//  Copyright © 2018 StoneCo. All rights reserved.
//

import Foundation

public struct SalesSimulationModel: Codable {
    public var brands: [String]
    public var fees: [String]
    
    public init(brands: [String], fees: [String]) {
        self.brands = brands
        self.fees = fees
    }
}

public class SaleSimulatorRequestModel: Codable {
    public var brands: [Brands] = []
    public var fees: [Fees] = []
    
    public struct Brands: Codable {
        public var name: String
    }
    
    public struct Fees: Codable {
        public var name: String
        public var rate: Double
    }
    
    public init() { }
}
