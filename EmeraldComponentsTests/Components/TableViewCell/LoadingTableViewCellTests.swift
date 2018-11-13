//
//  LoadingTableViewCellTests.swift
//  EmeraldComponentsTests
//
//  Created by Luan Kalume | Stone on 29/05/2018.
//  Copyright © 2018 StoneCo. All rights reserved.
//

import XCTest
@testable import EmeraldComponents

class LoadingTableViewCellTests: XCTestCase {
    
    private let bundle = Bundle(for: LoadingTableViewCell.self)
    private var cell: LoadingTableViewCell!
    
    override func setUp() {
        let nib = UINib(nibName: "LoadingTableViewCell", bundle: bundle)
        guard let cell = nib.instantiate(withOwner: self, options: nil).first as? LoadingTableViewCell else {
            XCTFail("Nib loading should not fail")
            return
        }
        
        self.cell = cell
    }
    
    override func tearDown() {
        self.cell = nil
        super.tearDown()
    }
    
    func testNibAwakening() {
        XCTAssertEqual(cell.selectionStyle, .none)
        XCTAssertEqual(cell.contentView.autoresizingMask, .flexibleHeight)
    }
    
    func testAnimate() {
        // when
        cell.animate()
        // then
        XCTAssertTrue(cell.activityIndicator.isAnimating)
    }
    
}
