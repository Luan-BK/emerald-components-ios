//
//  PaymentListTableCellTests.swift
//  EmeraldComponentsTests
//
//  Created by Luan Kalume | Stone on 07/05/2018.
//  Copyright © 2018 StoneCo. All rights reserved.
//

import XCTest
@testable import EmeraldComponents

class PaymentListTableCellTests: XCTestCase {
    
    public struct PaymentViewModelMock: PaymentListViewModel {
        var dayString: String = "14"
        var weekdayString: String = "Qua"
        var amountString: String = "R$ 12,00"
        var statusString: String = "Compensado"
        var statusColor: UIColor = .green
    }
    
}
