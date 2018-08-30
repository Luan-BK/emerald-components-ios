//
//  SlingOperationTableViewCellTests.swift
//  SlingBasicComponentTests
//
//  Created by Luan Kalume | Stone on 27/04/2018.
//  Copyright © 2018 StoneCo. All rights reserved.
//

import XCTest
@testable import SlingBasicComponent

class SlingOperationTableViewCellTests: XCTestCase {
    
    let bundle = Bundle(for: SlingOperationTableViewCell.self)
    var cell: SlingOperationTableViewCell!
    
    struct ViewModelMock: SlingOperationCellViewModel {
        var movementCategoryColor: UIColor = .black
        var settlementStatusColor: UIColor = .black
        var cardBrandImage: UIImage? = UIImage(named: "brand_icon_visa", in: Bundle(for: SlingOperationTableViewCell.self), compatibleWith: nil)!
        var transactionType: String = "Crédito"
        var dateOperation: String = "14/05 às 11:23"
        var amount: String = "R$ 10,90"
        var movementCategory: String = "VENDA"
        var settlementStatus: String = "COMPENSADO"
        var accessoryType: UITableViewCellAccessoryType = .none
    }
    
    override func setUp() {
        super.setUp()
        self.cell = bundle.loadNibNamed("SlingOperationTableViewCell", owner: nil)?.first as? SlingOperationTableViewCell
    }
    
    func testClearCellFields() {
        let image = UIImage(named: "mastercard", in: Bundle(for: SlingOperationTableViewCell.self), compatibleWith: nil)
        
        self.cell.cardBrandImageView.image = image
        self.cell.transactionTypeLabel.text = "Débito"
        self.cell.dateLabel.text = "12/12 às 13:40"
        self.cell.amountLabel.text = "R$ 30,00"
        self.cell.categoryLabel.text = "VENDA"
        self.cell.statusLabel.text = "COMPENSADO"
        
        self.cell.clearAllFields()
        
        XCTAssertEqual(self.cell.cardBrandImageView.image, nil)
        XCTAssertEqual(self.cell.transactionTypeLabel.text, "")
        XCTAssertEqual(self.cell.dateLabel.text, "")
        XCTAssertEqual(self.cell.amountLabel.text, "")
        XCTAssertEqual(self.cell.categoryLabel.text, "")
        XCTAssertEqual(self.cell.statusLabel.text, "")
    }
    
    func testConfigureMethod() {
        let mock = ViewModelMock()
        
        self.cell.configure(mock)
        
        XCTAssertEqual(self.cell.cardBrandImageView.image, mock.cardBrandImage)
        XCTAssertEqual(self.cell.transactionTypeLabel.text, mock.transactionType)
        XCTAssertEqual(self.cell.dateLabel.text, mock.dateOperation)
        XCTAssertEqual(self.cell.amountLabel.text, mock.amount)
        XCTAssertEqual(self.cell.categoryLabel.text, mock.movementCategory)
        XCTAssertEqual(self.cell.statusLabel.text, mock.settlementStatus)
        XCTAssertEqual(self.cell.accessoryType, mock.accessoryType)
    }
    
}
