//
//  PaymentListViewModel.swift
//  SlingBasicComponent
//
//  Created by Luan Kalume | Stone on 08/05/2018.
//  Copyright © 2018 StoneCo. All rights reserved.
//

import UIKit

public protocol PaymentListViewModel {
    var dayString: String { get }
    var weekdayString: String { get }
    var amountString: String { get }
    var statusString: String { get }
    var statusColor: UIColor { get }
}
