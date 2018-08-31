//
//  Color+PalleteTests.swift
//  EmeraldComponentsTests
//
//  Created by Luan Kalume | Stone on 28/03/2018.
//  Copyright © 2018 StoneCo. All rights reserved.
//

import XCTest
@testable import EmeraldComponents

class ColorPalleteTests: XCTestCase {
    
    func testColorsByTheme() {
        XCTAssertEqual(UIColor.primaryContentBackground(for: .stone), UIColor(red: 16/255, green: 58/255, blue: 33/255, alpha: 1.0))
        XCTAssertEqual(UIColor.primaryContentBackground(for: .mundiPagg), UIColor(red: 9/255, green: 39/255, blue: 89/255, alpha: 1.0))
        
        XCTAssertEqual(UIColor.secondaryContentBackground(for: .stone), UIColor(red: 20/255, green: 170/255, blue: 75/255, alpha: 1.0))
        XCTAssertEqual(UIColor.secondaryContentBackground(for: .mundiPagg), UIColor(red: 24/255, green: 130/255, blue: 120/255, alpha: 1.0))
        
        XCTAssertEqual(UIColor.tertiaryContentBackground(for: .stone), UIColor(red: 149/255, green: 201/255, blue: 61/255, alpha: 1.0))
        XCTAssertEqual(UIColor.tertiaryContentBackground(for: .mundiPagg), UIColor(red: 0/255, green: 185/255, blue: 181/255, alpha: 1.0))
    }
    
}
