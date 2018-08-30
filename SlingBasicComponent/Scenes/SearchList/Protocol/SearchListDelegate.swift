//
//  SearchListDelegate.swift
//  SlingBasicComponent
//
//  Created by João Mendes | Stone on 14/06/18.
//  Copyright © 2018 StoneCo. All rights reserved.
//

import UIKit

public protocol SearchListDelegate: class {
    var dataList: [PickerData] { get }
    func didSelectOption(_ option: PickerData)
    func didDeselectOption(_ option: PickerData)
}
