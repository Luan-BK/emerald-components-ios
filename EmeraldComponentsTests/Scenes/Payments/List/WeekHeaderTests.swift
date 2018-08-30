//
//  WeekHeaderTests.swift
//  SlingBasicComponentTests
//
//  Created by Luan Kalume | Stone on 07/05/2018.
//  Copyright © 2018 StoneCo. All rights reserved.
//

import XCTest
@testable import SlingBasicComponent

class WeekHeaderTests: XCTestCase {
    
    private var header: WeekHeader!
    
    override func setUp() {
        super.setUp()
        header = WeekHeader()
    }
    
    override func tearDown() {
        header = nil
        super.tearDown()
    }
    
    func testSetupNib_frame() {
        // given
        let frame = CGRect(x: 10, y: 10, width: 10, height: 10)
        // when
        header = WeekHeader(frame: frame)
        // then
        XCTAssertEqual(header.backgroundView.frame, header.bounds)
    }
    
    func testSetupNib_autoresizingMask() {
        XCTAssertEqual(header.backgroundView.autoresizingMask, [.flexibleWidth, .flexibleHeight])
    }
    
}
