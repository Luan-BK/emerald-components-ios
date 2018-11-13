//
//  PickerTests.swift
//  EmeraldComponentsTests
//
//  Created by Luan Kalume | Stone on 22/06/2018.
//  Copyright © 2018 StoneCo. All rights reserved.
//

import XCTest
@testable import EmeraldComponents

class PickerTests: XCTestCase {

    private let expectationTimeout = 10.0
    
    internal var picker: EmeraldPicker!
    
    internal var selectedExpectation: XCTestExpectation?
    internal var deselectedExpectation: XCTestExpectation?
    internal var selectedOption: Bool = false
    internal var deselectedOption: Bool = false
    
    override func setUp() {
        super.setUp()
        self.picker = EmeraldPicker(frame: .zero)
    }
    
    override func tearDown() {
        self.picker = nil
        self.selectedOption = false
        self.selectedExpectation = nil
        self.deselectedOption = false
        self.deselectedExpectation = nil
        super.tearDown()
    }
    
    func testSelectedOption_Valid() {
        let option: String? = "some option"
        
        self.picker.selectedOption = option
        
        XCTAssertEqual(self.picker.inputText, option)
    }
    
    func testSelectedOption_Nil() {
        let option: String? = nil
        
        self.picker.selectedOption = option
        
        XCTAssertEqual(self.picker.inputText, "")
    }
    
    func testIsInputValid_True() {
        self.picker.inputText = "Some options"
        
        XCTAssertTrue(self.picker.isInputValid)
    }
    
    func testIsInputValid_False() {
        self.picker.inputText = ""
        
        XCTAssertFalse(self.picker.isInputValid)
    }
    
    func testInputIcon_Regular() {
        self.picker.setInputIcon(for: .regular)
        
        XCTAssertEqual(self.picker.inputField.rightViewMode, .always)
        XCTAssertEqual(self.picker.inputButton.isUserInteractionEnabled, false)
    }
    
    func testInputIcon_Special() {
        self.picker.setInputIcon(for: .success)
        
        XCTAssertEqual(self.picker.inputField.rightViewMode, .always)
        XCTAssertEqual(self.picker.inputButton.isUserInteractionEnabled, false)
    }
    
    func testPickerButtonImage_ExpandedTrue() {
        let image = self.picker.pickerButtonImage(expanded: true)
        
        XCTAssertEqual(image?.renderingMode, .alwaysTemplate)
    }
    
    func testPickerButtonImage_ExpandedFalse() {
        let image = self.picker.pickerButtonImage(expanded: false)
        
        XCTAssertEqual(image?.renderingMode, .alwaysTemplate)
    }
    
    // MARK: - UITextFieldDelegate
    
    func testFieldShouldBeginEditing_NoDelegate() {
        self.picker.dataSource = nil
        
        let shouldBegingEdition = self.picker.textFieldShouldBeginEditing(self.picker.inputField)
        
        XCTAssertFalse(shouldBegingEdition)
    }
    
    func testFieldShouldBeginEditing_BelowThreshold() {
        let dataSource = MockPickerDataSource(amount: 5)
        self.picker.dataSource = dataSource
        
        let shouldBegingEdition = self.picker.textFieldShouldBeginEditing(self.picker.inputField)
        
        XCTAssertTrue(shouldBegingEdition)
    }
    
    func testFieldShouldBeginEditing_AboveThreshold() {
        let dataSource = MockPickerDataSource(amount: 15)
        self.picker.dataSource = dataSource
        
        let shouldBegingEdition = self.picker.textFieldShouldBeginEditing(self.picker.inputField)
        
        XCTAssertFalse(shouldBegingEdition)
    }
    
    func testDidBeginEditing() {
        self.picker.textFieldDidBeginEditing(self.picker.inputField)
        
        self.testPickerButtonImage_ExpandedTrue()
        XCTAssertEqual(self.picker.state, .focus)
    }
    
    func testDidEndEditing() {
        self.picker.textFieldDidEndEditing(self.picker.inputField)
        
        self.testPickerButtonImage_ExpandedFalse()
    }
    
    // MARK: - SearchListDelegate
    
    func testDataList() {
        let dataSource = MockPickerDataSource(amount: 20)
        self.picker.dataSource = dataSource
        
        let data = self.picker.dataList
        
        XCTAssertEqual(data.count, 20)
    }
    
    func testDataList_NoDataSource() {
        self.picker.dataSource = nil
        
        let data = self.picker.dataList
        
        XCTAssertEqual(data.count, 0)
    }
    
    func testDidSelectOption() {
        let option: PickerData = "Some option"
        self.selectedExpectation = XCTestExpectation(description: "Did select an option")
        self.picker.delegate = self
        
        self.picker.didSelectOption(option)
        
        wait(for: [self.selectedExpectation!], timeout: expectationTimeout)
        
        guard let selectedOption = self.picker.selectedOption else {
            XCTFail("Option shouldn't be nil!")
            return
        }
        XCTAssertEqual(selectedOption.identifier, option.identifier)
        XCTAssertEqual(self.picker.state, .regular)
        XCTAssertTrue(self.selectedOption)
    }
    
    func testDidDeselectOption() {
        let option: PickerData = "Some option"
        self.deselectedExpectation = XCTestExpectation(description: "Did deselect an option")
        self.picker.delegate = self
        
        self.picker.didDeselectOption(option)
        
        wait(for: [self.deselectedExpectation!], timeout: expectationTimeout)
        
        XCTAssertNil(self.picker.selectedOption)
        XCTAssertTrue(self.deselectedOption)
    }
    
    // MARK: - UIPickerView
    
    func testNumberOfComponents() {
        XCTAssertEqual(self.picker.numberOfComponents(in: UIPickerView()), 1)
    }
    
    func testNumberOfRowsInComponent() {
        let dataSource = MockPickerDataSource(amount: 5)
        self.picker.dataSource = dataSource
        
        let rows = self.picker.pickerView(UIPickerView(), numberOfRowsInComponent: 0)
        
        XCTAssertEqual(rows, dataSource.dataAmount + 1)
    }
    
    func testNumberOfRowsInComponent_NoDataSource() {
        self.picker.dataSource = nil
        
        let rows = self.picker.pickerView(UIPickerView(), numberOfRowsInComponent: 0)
        
        XCTAssertEqual(rows, 0)
    }
    
    func testTitleForRow_NoDataSource() {
        self.picker.dataSource = nil
        
        let title = self.picker.pickerView(UIPickerView(), titleForRow: 0, forComponent: 0)
        
        XCTAssertNil(title)
    }
    
    func testTitleForRow_FirstRow() {
        let dataSource = MockPickerDataSource(amount: 5)
        self.picker.dataSource = dataSource
        
        let title = self.picker.pickerView(UIPickerView(), titleForRow: 0, forComponent: 0)
        
        XCTAssertEqual(title, "---")
    }
    
    func testTitleForRow() {
        let dataSource = MockPickerDataSource(amount: 5)
        self.picker.dataSource = dataSource
        
        let title = self.picker.pickerView(UIPickerView(), titleForRow: 1, forComponent: 0)
        
        XCTAssertEqual(title, "option")
    }
    
    func testDidSelectRow_NoDataSource() {
        self.picker.dataSource = nil
        
        self.picker.pickerView(UIPickerView(), didSelectRow: 1, inComponent: 0)
        
        XCTAssertNil(self.picker.selectedOption)
    }
    
    func testDidSelectRow_FirstRow() {
        let dataSource = MockPickerDataSource(amount: 5)
        self.picker.dataSource = dataSource
        self.picker.delegate = self
        self.picker.selectedOption = "Some option"
        self.deselectedExpectation = XCTestExpectation(description: "User deselected an option.")
        
        self.picker.pickerView(UIPickerView(), didSelectRow: 0, inComponent: 0)
        
        wait(for: [self.deselectedExpectation!], timeout: expectationTimeout)
        
        XCTAssertTrue(self.deselectedOption)
        XCTAssertNil(self.picker.selectedOption)
        XCTAssertEqual(self.picker.inputText, "")
    }
    
    func testDidSelectRow() {
        let dataSource = MockPickerDataSource(amount: 5)
        self.picker.dataSource = dataSource
        self.picker.delegate = self
        self.selectedExpectation = XCTestExpectation(description: "User selected an option.")
        
        self.picker.pickerView(UIPickerView(), didSelectRow: 1, inComponent: 0)
        
        wait(for: [self.selectedExpectation!], timeout: expectationTimeout)
        
        XCTAssertTrue(self.selectedOption)
        XCTAssertNotNil(self.picker.selectedOption)
        XCTAssertEqual(self.picker.selectedOption?.identifier, "option")
        XCTAssertEqual(self.picker.inputText, "option")
    }
}

extension PickerTests: EmeraldPickerDelegate {
    func didSelectOption(_ picker: EmeraldPicker, option: PickerData) {
        self.selectedOption = true
        self.selectedExpectation?.fulfill()
    }
    
    func didDeselectOption(_ picker: EmeraldPicker, option: PickerData) {
        self.deselectedOption = true
        self.deselectedExpectation?.fulfill()
    }
    
}

private class MockPickerDataSource: EmeraldPickerDataSource {
    let dataAmount: Int
    
    public init(amount: Int) {
        self.dataAmount = amount
    }
    
    func pickerOptions(for picker: EmeraldPicker) -> [PickerData] {
        return [String].init(repeating: "option", count: self.dataAmount)
    }
}

extension String: PickerData {
    public var identifier: String {
        return self
    }
}
