//
//  SaleSimulatedModel.swift
//  EmeraldComponents
//
//  Created by João Mendes | Stone on 20/09/18.
//  Copyright © 2018 StoneCo. All rights reserved.
//

import Foundation

public class SaleSimulatedModel: Codable {
    public var grossAmount: Double = 0.0
    public var prepayAmount: Double = 0.0
    public var totalNetAmount: Double = 0.0
    
    public init() { }
}
