//
//  CalendarCollectionCustomViewCellTests.swift
//  EmeraldComponentsTests
//
//  Created by Luan Kalume | Stone on 07/05/2018.
//  Copyright © 2018 StoneCo. All rights reserved.
//

import XCTest
@testable import EmeraldComponents

class CalendarCollectionCustomViewCellTests: XCTestCase {
  
    func testNibAwakening() {
        let bundle = Bundle(for: CalendarCollectionCustomViewCell.self)
        let nib = UINib(nibName: "CalendarCollectionCustomViewCell", bundle: bundle)
        guard let cell = nib.instantiate(withOwner: self, options: nil).first as? CalendarCollectionCustomViewCell else {
            XCTFail("Nib loading should not fail")
            return
        }
        
        XCTAssertEqual(cell.selectedDayBackgroundView.layer.cornerRadius, 20.0)
        XCTAssertEqual(cell.statusView.layer.isHidden, true)
    }
    
    func testCellConfigure_withModel() {
        //given
        let bundle = Bundle(for: CalendarCollectionCustomViewCell.self)
        let nib = UINib(nibName: "CalendarCollectionCustomViewCell", bundle: bundle)
        guard let cell = nib.instantiate(withOwner: self, options: nil).first as? CalendarCollectionCustomViewCell else {
            XCTFail("Nib loading should not fail")
            return
        }
        let model = PaymentListTableCellTests.PaymentViewModelMock()
        
        //when
        cell.configure(model)
        
        //then
        XCTAssertEqual(cell.statusView.backgroundColor, model.statusColor)
        XCTAssertEqual(cell.statusView.isHidden, false)
    }
    
    func testCellConfigure_noModel() {
        //given
        let bundle = Bundle(for: CalendarCollectionCustomViewCell.self)
        let nib = UINib(nibName: "CalendarCollectionCustomViewCell", bundle: bundle)
        guard let cell = nib.instantiate(withOwner: self, options: nil).first as? CalendarCollectionCustomViewCell else {
            XCTFail("Nib loading should not fail")
            return
        }
        
        //when
        cell.configure(nil)
        
        //then
        XCTAssertEqual(cell.statusView.isHidden, true)
    }
    
}
