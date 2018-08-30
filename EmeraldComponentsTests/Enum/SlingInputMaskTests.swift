//
//  SlingInputMaskTests.swift
//  SlingBasicComponentTests
//
//  Created by Luan Kalume | Stone on 15/06/2018.
//  Copyright © 2018 StoneCo. All rights reserved.
//

import XCTest
@testable import SlingBasicComponent
@testable import InputMask

class SlingInputMaskTests: XCTestCase {
    
    func testGetMaskFormat() {
        let customMaskString = "[0000]"
        let allMasks: [SlingInputMask] = [.none, .email, .phone, .cep, .cpf, .cnpj, .password, .custom(mask: customMaskString)]
        
        for mask in allMasks {
            switch mask {
            case .cnpj:
                XCTAssertEqual(SlingInputMask.getMaskFormat(for: mask), "[00].[000].[000]/[0000]-[00]")
            case .cpf:
                XCTAssertEqual(SlingInputMask.getMaskFormat(for: mask), "[000].[000].[000]-[00]")
            case .cep:
                XCTAssertEqual(SlingInputMask.getMaskFormat(for: mask), "[00000]-[000]")
            case .phone:
                XCTAssertEqual(SlingInputMask.getMaskFormat(for: mask), "([00]) [0000]-[00009]")
            case .custom:
                XCTAssertEqual(SlingInputMask.getMaskFormat(for: mask), customMaskString)
            case .none, .email, .password, .currency:
                XCTAssertEqual(SlingInputMask.getMaskFormat(for: mask), "[…]")
            }
        }
    }
    
}
