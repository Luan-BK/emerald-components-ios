//
//  InputMaskTests.swift
//  EmeraldComponentsTests
//
//  Created by Luan Kalume | Stone on 15/06/2018.
//  Copyright © 2018 StoneCo. All rights reserved.
//

import XCTest
@testable import EmeraldComponents
@testable import InputMask

class InputMaskTests: XCTestCase {
    
    func testGetMaskFormat() {
        let customMaskString = "[0000]"
        let allMasks: [EmeraldInputMask] = [.none, .email, .phone, .cep, .cpf, .cnpj, .password, .custom(mask: customMaskString)]
        
        for mask in allMasks {
            switch mask {
            case .cnpj:
                XCTAssertEqual(EmeraldInputMask.getMaskFormat(for: mask), "[00].[000].[000]/[0000]-[00]")
            case .cpf:
                XCTAssertEqual(EmeraldInputMask.getMaskFormat(for: mask), "[000].[000].[000]-[00]")
            case .cep:
                XCTAssertEqual(EmeraldInputMask.getMaskFormat(for: mask), "[00000]-[000]")
            case .phone:
                XCTAssertEqual(EmeraldInputMask.getMaskFormat(for: mask), "([00]) [0000]-[00009]")
            case .custom:
                XCTAssertEqual(EmeraldInputMask.getMaskFormat(for: mask), customMaskString)
            case .none, .email, .password, .currency:
                XCTAssertEqual(EmeraldInputMask.getMaskFormat(for: mask), "[…]")
            }
        }
    }
    
}
