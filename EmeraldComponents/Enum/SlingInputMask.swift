//
//  SlingInputMask.swift
//  EmeraldComponents
//
//  Created by Luan Kalume | Stone on 15/06/2018.
//  Copyright © 2018 StoneCo. All rights reserved.
//

import Foundation

/// An enum representing the possible masks for SlingInput basic component.
public enum SlingInputMask {
    case none
    case email
    case phone
    case cep
    case cpf
    case cnpj
    case password
    case currency
    case custom(mask: String)
    
    public static func getMaskFormat(for mask: SlingInputMask) -> String {
        let maskFormat: String
        
        switch mask {
        case .cnpj: maskFormat = "[00].[000].[000]/[0000]-[00]"
        case .cpf: maskFormat = "[000].[000].[000]-[00]"
        case .cep: maskFormat = "[00000]-[000]"
        case .phone: maskFormat = "([00]) [0000]-[00009]"
        case .custom(let mask): maskFormat = mask
        default: maskFormat = "[…]"
        }
        
        return maskFormat
    }
    
}

extension SlingInputMask: Equatable {
    
    public static func == (lhs: SlingInputMask, rhs: SlingInputMask) -> Bool {
        switch (lhs, rhs) {
        case (.none, .none),
             (.email, .email),
             (.phone, .phone),
             (.cep, .cep),
             (.cpf, .cpf),
             (.cnpj, .cnpj),
             (.currency, .currency),
             (.password, .password):
            return true
        case (.custom(let value1), .custom(let value2)):
            return value1 == value2
        default:
            return false
        }
    }
    
}
