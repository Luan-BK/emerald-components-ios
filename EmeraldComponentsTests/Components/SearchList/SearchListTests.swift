//
//  SearchListTests.swift
//  EmeraldComponentsTests
//
//  Created by Luan Kalume | Stone on 22/06/2018.
//  Copyright © 2018 StoneCo. All rights reserved.
//

import XCTest
@testable import EmeraldComponents

class SearchListTests: XCTestCase {
    
    private let expectationTimeout = 10.0

    internal var searchList: EmeraldSearchList!
    internal let storyboard = UIStoryboard(name: "SearchList", bundle: Bundle.emerald)
    
    internal var selectedExpectation: XCTestExpectation?
    internal var deselectedExpectation: XCTestExpectation?
    internal var selectedOption: Bool = false
    internal var deselectedOption: Bool = false
    
    override func setUp() {
        super.setUp()
        self.searchList = storyboard.instantiateInitialViewController() as? EmeraldSearchList
        _ = self.searchList.view
    }
    
    override func tearDown() {
        self.searchList = nil
        self.selectedOption = false
        self.selectedExpectation = nil
        self.deselectedOption = false
        self.deselectedExpectation = nil
        super.tearDown()
    }
    
    func testInit() {
        XCTAssertEqual(self.searchList.searchBar.placeholder, "Search")
        XCTAssertEqual(self.searchList.searchBar.autocorrectionType, .no)
        XCTAssertEqual(self.searchList.searchBar.returnKeyType, .done)
    }
    
    // MARK: - UITableView
    
    func testNumberOfRows_NoData() {
        self.searchList.filteredData = nil
        
        let rows = self.searchList.tableView(UITableView(), numberOfRowsInSection: 0)
        
        XCTAssertEqual(rows, 0)
    }
    
    func testNumberOfRows() {
        self.searchList.filteredData = ["option1", "option2"]
        
        let rows = self.searchList.tableView(UITableView(), numberOfRowsInSection: 0)
        
        XCTAssertEqual(rows, 2)
    }
    
    func testCellForRow() {
        self.searchList.filteredData = ["option1", "option2"]
        
        let cell = self.searchList.tableView(self.searchList.tableView, cellForRowAt: IndexPath(row: 0, section: 0))
        
        XCTAssertEqual(cell.textLabel?.text, "option1")
        XCTAssertEqual(cell.accessoryType, .none)
    }
    
    func testCellForRow_Selected() {
        self.searchList.filteredData = ["option1", "option2"]
        self.searchList.selectedOption = "option2"
        
        let cell = self.searchList.tableView(self.searchList.tableView, cellForRowAt: IndexPath(row: 1, section: 0))
        
        XCTAssertEqual(cell.textLabel?.text, "option2")
        XCTAssertEqual(cell.accessoryType, .checkmark)
    }
    
    func testDidSelectRow() {
        self.searchList.filteredData = ["option1", "option2"]
        self.searchList.delegate = self
        self.selectedExpectation = XCTestExpectation(description: "Did select option.")
        
        self.searchList.tableView(self.searchList.tableView, didSelectRowAt: IndexPath(row: 0, section: 0))
        
        wait(for: [self.selectedExpectation!], timeout: expectationTimeout)
        
        XCTAssertTrue(self.selectedOption)
    }
    
    func testDidSelectRow_PreviouslySelected() {
        self.searchList.filteredData = ["option1", "option2"]
        self.searchList.delegate = self
        self.deselectedExpectation = XCTestExpectation(description: "Did deselect option.")
        self.searchList.selectedOption = "option1"
        
        self.searchList.tableView(self.searchList.tableView, didSelectRowAt: IndexPath(row: 0, section: 0))
        
        wait(for: [self.deselectedExpectation!], timeout: expectationTimeout)
        
        XCTAssertTrue(self.deselectedOption)
    }
    
    // MARK: - UISearchBarDelegate
    
    func testSearchBar() {
        let searchString = "option 2"
        self.searchList.delegate = self
        
        self.searchList.searchBar(self.searchList.searchBar, textDidChange: searchString)
        
        XCTAssertEqual(self.searchList.filteredData?.count, 1)
        XCTAssertEqual(self.searchList.filteredData?.first?.identifier, searchString)
    }
    
    func testSearchBar_EmptyString() {
        let searchString = ""
        self.searchList.delegate = self
        self.searchList.filteredData = ["option 2"]
        
        self.searchList.searchBar(self.searchList.searchBar, textDidChange: searchString)
        
        XCTAssertEqual(self.searchList.filteredData?.count, self.dataList.count)
        XCTAssertNotEqual(self.searchList.filteredData?.first?.identifier, searchString)
    }
}

extension SearchListTests: SearchListDelegate {

    var dataList: [PickerData] {
        return ["option 1", "option 2", "option 3"]
    }

    func didSelectOption(_ option: PickerData) {
        self.selectedOption = true
        self.selectedExpectation?.fulfill()
    }

    func didDeselectOption(_ option: PickerData) {
        self.deselectedOption = true
        self.deselectedExpectation?.fulfill()
    }

}
