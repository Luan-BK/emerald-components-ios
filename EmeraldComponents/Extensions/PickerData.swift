//
//  PickerData.swift
//  EmeraldComponents
//
//  Created by João Mendes | Stone on 20/09/18.
//  Copyright © 2018 StoneCo. All rights reserved.
//

import Foundation

extension String: PickerData {
    public var identifier: String {
        return self
    }
}

extension Double: PickerData {
    public var identifier: String {
        return String(describing: self)
    }
}

extension Float: PickerData {
    public var identifier: String {
        return String(describing: self)
    }
}
