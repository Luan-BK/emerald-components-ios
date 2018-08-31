//
//  WalletDetailTableCellTests.swift
//  EmeraldComponentsTests
//
//  Created by Luan Kalume | Stone on 07/05/2018.
//  Copyright © 2018 StoneCo. All rights reserved.
//

import XCTest
@testable import EmeraldComponents

class WalletDetailTableCellTests: XCTestCase {
    
    private let bundle = Bundle(for: WalletDetailTableCell.self)
    private var cell: WalletDetailTableCell!
    
    public struct PaymentDetailViewModelMock: PaymentDetailViewModel {
        public var barColor: UIColor = .green
        public var walletTypeString: String = "Carteira"
        public var signString: String = "+"
        public var signColor: UIColor = .black
        public var amountString: String = "R$ 10,00"
    }
    
    override func setUp() {
        let nib = UINib(nibName: "WalletDetailTableCell", bundle: Bundle.basic)
        guard let cell = nib.instantiate(withOwner: self, options: nil).first as? WalletDetailTableCell else {
            XCTFail("Nib loading should not fail")
            return
        }
        
        self.cell = cell
    }
    
    override func tearDown() {
        self.cell = nil
        super.tearDown()
    }
    
    func testSelection() {
        let movement: [String : (String, UIColor)] = ["Venda" : ("R$ 20,00", .green)]
        
        cell.movements = movement
        cell.setSelected(true, animated: true)
        
        XCTAssertFalse(cell.movementsStackView.arrangedSubviews.isEmpty)
        guard let movementLabel = (cell.movementsStackView.arrangedSubviews.first as? UIStackView)?.arrangedSubviews[0] as? UILabel,
            let amountLabel = (cell.movementsStackView.arrangedSubviews.first as? UIStackView)?.arrangedSubviews[1] as? UILabel else {
                XCTFail("Labels should not be nil")
                return
        }
        XCTAssertEqual(movementLabel.text, "Venda")
        XCTAssertEqual(amountLabel.text, "R$ 20,00")
        XCTAssertEqual(amountLabel.textColor, UIColor.green)
        
        cell.setSelected(false, animated: true)
        
        XCTAssertTrue(cell.movementsStackView.arrangedSubviews.isEmpty)
    }
    
    func testConfigure_closed() {
        let paymentDetailMock = PaymentDetailViewModelMock()
        
        cell.configure(paymentDetailMock)
        
        XCTAssertEqual(cell.colorView.backgroundColor, .green)
        XCTAssertEqual(cell.walletTypeLabel.text, "Carteira")
        XCTAssertEqual(cell.walletTypeLabel.textColor, UIColor.veryDarkGrayScaleContentBackground)
        XCTAssertEqual(cell.signLabel.text, "+")
        XCTAssertEqual(cell.signLabel.textColor, .black)
        XCTAssertEqual(cell.amountLabel.text, "R$ 10,00")
        XCTAssertEqual(cell.amountLabel.textColor, .black)
        XCTAssertEqual(cell.arrowImageView.isHidden, false)
        XCTAssertTrue(cell.movementsStackView.arrangedSubviews.isEmpty)
    }
    
    func testConfigure_expanded() {
        let paymentDetailMock = PaymentDetailViewModelMock()
        
        cell.configure(paymentDetailMock, movements: ["Venda" : ("R$20,00", .green)])
        
        XCTAssertEqual(cell.colorView.backgroundColor, .green)
        XCTAssertEqual(cell.walletTypeLabel.text, "Carteira")
        XCTAssertEqual(cell.walletTypeLabel.textColor, UIColor.veryDarkGrayScaleContentBackground)
        XCTAssertEqual(cell.signLabel.text, "+")
        XCTAssertEqual(cell.signLabel.textColor, .black)
        XCTAssertEqual(cell.amountLabel.text, "R$ 10,00")
        XCTAssertEqual(cell.amountLabel.textColor, .black)
        XCTAssertEqual(cell.arrowImageView.isHidden, false)
        XCTAssertFalse(cell.movementsStackView.arrangedSubviews.isEmpty)
    }
    
    func testConfigureSum() {
        cell.configureSum(.red, "R$ 2.000,00")
        
        XCTAssertEqual(cell.colorView.backgroundColor, .clear)
        XCTAssertEqual(cell.walletTypeLabel.text, "Saldo do dia")
        XCTAssertEqual(cell.walletTypeLabel.textColor, UIColor.veryDarkGrayScaleContentBackground)
        XCTAssertEqual(cell.signLabel.text, "=")
        XCTAssertEqual(cell.signLabel.textColor, UIColor.veryDarkGrayScaleContentBackground)
        XCTAssertEqual(cell.amountLabel.text, "R$ 2.000,00")
        XCTAssertEqual(cell.amountLabel.textColor, .red)
        XCTAssertEqual(cell.arrowImageView.isHidden, true)
        XCTAssertTrue(cell.movementsStackView.arrangedSubviews.isEmpty)
    }
    
    func testAddMovementInfoStackView() {
        let movement: [String : (amount: String, color: UIColor)] = ["Venda" : ("R$ 20,00", .green)]
        
        cell.addMovementInfoToStack(movement)
        
        XCTAssertFalse(cell.movementsStackView.arrangedSubviews.isEmpty)
        guard let movementLabel = (cell.movementsStackView.arrangedSubviews.first as? UIStackView)?.arrangedSubviews[0] as? UILabel,
            let amountLabel = (cell.movementsStackView.arrangedSubviews.first as? UIStackView)?.arrangedSubviews[1] as? UILabel else {
                XCTFail("Labels should not be nil")
                return
        }
        XCTAssertEqual(movementLabel.text, "Venda")
        XCTAssertEqual(amountLabel.text, "R$ 20,00")
        XCTAssertEqual(amountLabel.textColor, UIColor.green)
    }
    
    func testRemoveMovementInfoFromStackView() {
        cell.removeMovementInfoFromStack()
        
        XCTAssertTrue(cell.movementsStackView.arrangedSubviews.isEmpty)
    }
    
}
