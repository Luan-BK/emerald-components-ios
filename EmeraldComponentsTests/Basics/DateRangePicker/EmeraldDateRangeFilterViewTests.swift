//
//  EmeraldDateRangeFilterViewTests.swift
//  EmeraldComponentsTests
//
//  Created by João Mendes | Stone on 25/09/18.
//  Copyright © 2018 StoneCo. All rights reserved.
//

import XCTest
@testable import EmeraldComponents

class EmeraldDateRangeFilterViewTests: XCTestCase {

    var dateRangeFilter: EmeraldDateRangeFilterView!
    var date: Date!
    
    override func setUp() {
        super.setUp()
        
        date = Date()
        dateRangeFilter = EmeraldDateRangeFilterView(frame: CGRect(x: 0.0, y: 0.0, width: 200.0, height: 120.0))
    }
    
    override func tearDown() {
        dateRangeFilter = nil
        date = nil
    }

    func testDidChooseDateRange_last7days() {
        XCTAssertNotNil(dateRangeFilter.didChooseDateRange(start: date, end: date, range: .last7Days))
    }
    
    func testDidChooseDateRange_lastMonth() {
        XCTAssertNotNil(dateRangeFilter.didChooseDateRange(start: date, end: date, range: .lastMonth))
    }
    
}
