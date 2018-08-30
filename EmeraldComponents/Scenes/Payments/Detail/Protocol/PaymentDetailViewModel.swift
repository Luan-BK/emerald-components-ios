//
//  PaymentDetailViewModel.swift
//  EmeraldComponents
//
//  Created by Luan Kalume | Stone on 18/05/2018.
//  Copyright © 2018 StoneCo. All rights reserved.
//

import UIKit

public protocol PaymentDetailViewModel {
    var barColor: UIColor { get }
    var walletTypeString: String { get }
    var signString: String { get }
    var signColor: UIColor { get }
    var amountString: String { get }
}
