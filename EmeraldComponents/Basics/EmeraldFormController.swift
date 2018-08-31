//
//  EmeraldFormController.swift
//  EmeraldComponents
//
//  Created by Luan Kalume | Stone on 15/06/2018.
//  Copyright © 2018 StoneCo. All rights reserved.
//

import Foundation

public protocol InputField: class {
    var isValid: Bool { get }
}

public class EmeraldFormController {
    
    public init() { }
    
    public static func validateFields<T>(_ fields: [T]) -> Bool where T : InputField {
        return !fields.contains(where: { !$0.isValid })
    }
    
}
