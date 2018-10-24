//
//  HUDTests.swift
//  EmeraldComponentsTests
//
//  Created by João Mendes | Stone on 16/04/18.
//  Copyright © 2018 StoneCo. All rights reserved.
//

import XCTest
@testable import EmeraldComponents

class HUDTests: XCTestCase {
    
    private var hud: HUD!
    private var hudHelper: HUDHelper!
    private var activityIndicatorView: UIActivityIndicatorView?
    
    override func setUp() {
        super.setUp()
        hud = HUD()
        hudHelper = HUDHelper()
        activityIndicatorView = UIActivityIndicatorView()
    }
    
    override func tearDown() {
        hud = nil
        hudHelper = nil
        activityIndicatorView = nil
        super.tearDown()
    }
    
    // HUD Hide Method
    
    func testShowAnimating() {
        // given
        let view = UIView()
        // when
        hud.hide()
        let hudView = hud.show(view)
        // then
        XCTAssertNotNil(hudView)
        XCTAssertTrue(hud.isAnimating)
    }
    
    func testHideAnimating() {
        // given
        let view = UIView()
        // when
        let hudView = hud.show(view)
        hud.hide()
        // then
        XCTAssertNotNil(hudView)
        XCTAssertFalse(hud.isAnimating)
    }
    
}
