//
//  SlingOperationCellViewModel.swift
//  SlingBasicComponent
//
//  Created by Luan Kalume | Stone on 27/04/2018.
//  Copyright © 2018 StoneCo. All rights reserved.
//

import UIKit

public protocol SlingOperationCellViewModel {
    var cardBrandImage: UIImage? { get }
    var transactionType: String { get }
    var dateOperation: String { get }
    var amount: String { get }
    var movementCategory: String { get }
    var movementCategoryColor: UIColor { get }
    var settlementStatus: String { get }
    var settlementStatusColor: UIColor { get }
    var accessoryType: UITableViewCellAccessoryType { get }
}
