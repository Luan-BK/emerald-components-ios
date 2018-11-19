//
//  CustomDateRangePickerTests.swift
//  EmeraldComponentsTests
//
//  Created by Luan Kalume | Stone on 15/08/2018.
//  Copyright © 2018 StoneCo. All rights reserved.
//

import XCTest
@testable import EmeraldComponents

class CustomDateRangePickerTests: XCTestCase {
    
    var viewController: EmeraldCustomDateRangePicker!
    private var startDate: Date?
    private var finalDate: Date?
    private var period: EmeraldDateRangePicker.EmeraldDatePeriod?
    
    override func setUp() {
        super.setUp()
        
        self.startDate = nil
        self.finalDate = nil
        self.period = nil
        
        self.viewController = UIStoryboard(name: "DateRangePicker", bundle: Bundle.emerald).instantiateViewController(withIdentifier: "EmeraldCustomDateRangePicker") as? EmeraldCustomDateRangePicker
        self.viewController.delegate = self
        _ = self.viewController.view
    }
    
    func testViewLoad() {
        let dateRange = self.viewController.customRange
        
        XCTAssertEqual(self.viewController.startDatePicker.date, dateRange.start)
        XCTAssertEqual(self.viewController.finalDatePicker.date, dateRange.end)
        XCTAssertEqual(self.viewController.startDateLabel.text, dateRange.start.dateStringWithSlashes())
        XCTAssertEqual(self.viewController.finalDateLabel.text, dateRange.end.dateStringWithSlashes())
        
    }
    
    func testPeriodSelection() {
        let range: (start: Date, end: Date) = (Date(), Date().addingDays(1))
        self.viewController.customRange = range
        
        self.viewController.okButtonTouched()
        
        XCTAssertEqual(self.startDate, range.start)
        XCTAssertEqual(self.finalDate, range.end)
        XCTAssertEqual(self.period, .custom)
    }
    
    func testStartDateValueChanged() {
        let customDate = Date()
        self.viewController.startDatePicker.date = customDate
        
        self.viewController.startDateValueChanged()
        
        XCTAssertEqual(self.viewController.startDateLabel.text, customDate.dateStringWithSlashes())
        XCTAssertEqual(self.viewController.startDatePicker.date, customDate)
    }
    
    func testStartDateValueChanged_AboveFinalDate() {
        let customDate = Date()
        let finalDate = Date().addingDays(-1)
        self.viewController.startDatePicker.date = customDate
        self.viewController.finalDatePicker.date = finalDate
        
        self.viewController.startDateValueChanged()
        
        XCTAssertEqual(self.viewController.startDateLabel.text, customDate.dateStringWithSlashes())
        XCTAssertEqual(self.viewController.finalDateLabel.text, customDate.dateStringWithSlashes())
        XCTAssertEqual(self.viewController.startDatePicker.date, customDate)
        XCTAssertEqual(self.viewController.finalDatePicker.date, customDate)
    }
    
    func testFinalDateChanged_AboveStartDate() {
        let customDate = Date()
        let startDate = Date().addingDays(-1)
        self.viewController.startDatePicker.date = startDate
        self.viewController.finalDatePicker.date = customDate
        
        self.viewController.finalDateValueChanged()
        
        XCTAssertEqual(self.viewController.finalDateLabel.text, customDate.dateStringWithSlashes())
        XCTAssertEqual(self.viewController.finalDatePicker.date, customDate)
    }
    
    func testFinalDateChanged_BelowStartDate() {
        let customDate = Date().addingDays(-1)
        let startDate = Date()
        
        self.viewController.startDatePicker.date = startDate
        self.viewController.finalDatePicker.date = customDate
        
        self.viewController.finalDateValueChanged()
        
        XCTAssertEqual(self.viewController.finalDateLabel.text, startDate.dateStringWithSlashes())
        XCTAssertEqual(self.viewController.finalDatePicker.date, startDate)
    }
    
    func testStartDateButtonTouched_WhileOpened() {
        self.viewController.startDatePickerContainerView.isHidden = false
        
        self.viewController.startDateButtonTouched()
        
        XCTAssertEqual(self.viewController.startDatePickerContainerView.isHidden, true)
    }
    
    func testStartDateButtonTouched_WhileClosed() {
        self.viewController.startDatePickerContainerView.isHidden = true
        
        self.viewController.startDateButtonTouched()
        
        XCTAssertEqual(self.viewController.startDatePickerContainerView.isHidden, false)
        XCTAssertEqual(self.viewController.finalDatePickerContainerView.isHidden, true)
    }
    
    func testFinalDateButtonTouched_WhileOpened() {
        self.viewController.finalDatePickerContainerView.isHidden = false
        
        self.viewController.finalDateButtonTouched()
        
        XCTAssertEqual(self.viewController.finalDatePickerContainerView.isHidden, true)
    }
    
    func testFinalDateButtonTouched_WhileClosed() {
        self.viewController.finalDatePickerContainerView.isHidden = true
        
        self.viewController.finalDateButtonTouched()
        
        XCTAssertEqual(self.viewController.startDatePickerContainerView.isHidden, true)
        XCTAssertEqual(self.viewController.finalDatePickerContainerView.isHidden, false)
    }
    
}

extension CustomDateRangePickerTests: EmeraldDateRangePickerDelegate {
    
    func didChooseDateRange(start: Date?, end: Date?, range: EmeraldDateRangePicker.EmeraldDatePeriod) {
        self.startDate = start
        self.finalDate = end
        self.period = range
    }
    
}
