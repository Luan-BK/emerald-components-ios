//
//  EmptyTableViewTests.swift
//  EmeraldComponentsTests
//
//  Created by João Mendes | Stone on 24/09/18.
//  Copyright © 2018 StoneCo. All rights reserved.
//

import XCTest
@testable import EmeraldComponents

class EmptyTableViewTests: XCTestCase {
    
    var view: EmptyTableView!
    
    override func setUp() {
        super.setUp()
        self.view = EmptyTableView(frame: CGRect.zero)
    }
    
    func testViewConfiguration() {
        self.view.configureView(message: "Eu sou uma mensagem.", target: self, buttonAction: #selector(self.fooMethod))
        
        XCTAssertEqual(self.view.messageLabel.text, "Eu sou uma mensagem.")
        XCTAssertNotNil(self.view.refreshButton.actions(forTarget: self, forControlEvent: .touchUpInside))
        XCTAssertTrue(self.view.refreshButton.allTargets.contains(self))
    }
    
    @objc private func fooMethod() { }
    
}
