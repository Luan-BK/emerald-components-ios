//
//  SlingDateRangePickerTests.swift
//  SlingBasicComponentTests
//
//  Created by Luan Kalume | Stone on 14/08/2018.
//  Copyright © 2018 StoneCo. All rights reserved.
//

import XCTest
@testable import SlingBasicComponent

//swiftlint:disable force_cast
class SlingDateRangePickerTests: XCTestCase {
    
    var viewController: SlingDateRangePicker!
    var selectedPeriod: SlingDateRangePicker.SlingDatePeriod?
    
    override func setUp() {
        super.setUp()
        
        self.viewController = UIStoryboard(name: "DateRangePicker", bundle: Bundle.basic).instantiateViewController(withIdentifier: "SlingDateRangePicker") as! SlingDateRangePicker
        self.viewController.delegate = self
        _ = self.viewController.view
        
        self.selectedPeriod = nil
    }
    
    func testTableViewCells() {
        for row in 0..<self.viewController.tableView.numberOfRows(inSection: 0) {
            let cell = self.viewController.tableView(self.viewController.tableView, cellForRowAt: IndexPath(row: row, section: 0))
            
            XCTAssertNotNil(cell)
            XCTAssertEqual(cell.textLabel?.text, SlingDateRangePicker.SlingDatePeriod(rawValue: row)?.description)
        }
    }
    
    func testTableViewNumberOfRowsInSection() {
        XCTAssertEqual(self.viewController.tableView(self.viewController.tableView, numberOfRowsInSection: 0), self.viewController.ranges.count)
    }
    
    func testTableViewRowSelection() {
        for row in 0..<self.viewController.tableView.numberOfRows(inSection: 0) {
            self.viewController.tableView(self.viewController.tableView, didSelectRowAt: IndexPath(row: row, section: 0))

            guard self.viewController.ranges[row] == .custom else {
                XCTAssertEqual(self.selectedPeriod, self.viewController.ranges[row])
                continue
            }
            
            XCTAssertEqual(self.viewController.selectedPeriod, .custom)
        }
    }
    
}

extension SlingDateRangePickerTests: SlingDateRangePickerDelegate {
    
    func didChooseDateRange(start: Date?, end: Date?, range: SlingDateRangePicker.SlingDatePeriod) {
        self.selectedPeriod = range
    }
    
}
