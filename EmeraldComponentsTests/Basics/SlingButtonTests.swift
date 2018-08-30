//
//  SlingButtonTests.swift
//  EmeraldComponentsTests
//
//  Created by Luan Kalume | Stone on 19/06/2018.
//  Copyright © 2018 StoneCo. All rights reserved.
//

import XCTest
@testable import EmeraldComponents

class SlingButtonTests: XCTestCase {
    
    private var button: SlingButton!
    
    private let types: [SlingButtonType] = [.regular, .confirm, .delete, .neutral, .disabled]
    private let styles: [SlingButtonStyle] = [.fill, .outline, .plain]
    
    override func setUp() {
        super.setUp()
        self.button = SlingButton(frame: CGRect(x: 0.0, y: 0.0, width: 100.0, height: 60.0))
    }
    
    override func tearDown() {
        self.button = nil
        super.tearDown()
    }
    
    // MARK: - Inspectables
    
    func testBorderRadius() {
        let newRadius: CGFloat = 10.0
        
        self.button.borderRadius = newRadius
        
        XCTAssertEqual(self.button.layer.cornerRadius, newRadius)
    }
    
    func testBorderWidth() {
        let newWidth: CGFloat = 5.0
        
        self.button.borderWidth = newWidth
        
        XCTAssertEqual(self.button.layer.borderWidth, newWidth)
    }
    
    func testStyleAdapter() {
        let newStyle = SlingButtonStyle.plain
        
        self.button.styleAdapter = newStyle.rawValue
        
        XCTAssertEqual(self.button.style, .plain)
        XCTAssertEqual(self.button.styleAdapter, newStyle.rawValue)
    }
    
    func testTypeAdapter() {
        let newType = SlingButtonType.disabled
        
        self.button.typeAdapter = newType.rawValue
        
        XCTAssertEqual(self.button.type, .disabled)
        XCTAssertEqual(self.button.typeAdapter, newType.rawValue)
    }
    
    // MARK: - Init
    
    func testCommonInit() {
        XCTAssertEqual(self.button.layer.cornerRadius, 2.0)
        XCTAssertEqual(self.button.layer.borderWidth, 1.0)
        
        XCTAssertEqual(self.button.titleEdgeInsets, UIEdgeInsets(top: 0.0, left: 4.0, bottom: 0.0, right: 0.0))
        XCTAssertEqual(self.button.imageEdgeInsets, UIEdgeInsets(top: 0.0, left: 0.0, bottom: 0.0, right: 4.0))
        
        XCTAssertEqual(self.button.titleLabel?.font, UIFont.systemFont(ofSize: 18.0, weight: .medium))
    }
    
    // MARK: - Public configuration
    
    func testConfigure() {
        let testType = SlingButtonType.confirm
        let testStyle = SlingButtonStyle.outline
        
        self.button.configure(style: testStyle, type: testType)
        
        XCTAssertEqual(self.button.type, testType)
        XCTAssertEqual(self.button.style, testStyle)
    }
    
    func testConfigure_Default() {
        let currentType = self.button.type
        let currentStyle = self.button.style
        
        self.button.configure()
        
        XCTAssertEqual(self.button.type, currentType)
        XCTAssertEqual(self.button.style, currentStyle)
    }
    
    func testSetButtonImage_RightSideNoTemplate() {
        let mockImage = UIImage()
        
        self.button.setButtonImage(mockImage, template: false, usesRightSide: true)
        
        XCTAssertEqual(self.button.image(for: .normal), mockImage)
        XCTAssertEqual(self.button.image(for: .highlighted), mockImage)
        XCTAssertEqual(self.button.semanticContentAttribute, .forceRightToLeft)
    }
    
    func testSetButtonImage_LeftSideWithTemplate() {
        let mockImage = UIImage()
        
        self.button.setButtonImage(mockImage, template: true, usesRightSide: false)
        
        XCTAssertNotEqual(self.button.image(for: .normal), mockImage)
        XCTAssertNotEqual(self.button.image(for: .highlighted), mockImage)
        XCTAssertEqual(self.button.semanticContentAttribute, .unspecified)
    }
    
    // MARK: - Background animation
    
    func testDarkenBackground() {
        for type in self.types {
            for style in self.styles {
                
                self.button.configure(style: style, type: type)
                self.button.darkenBackground()
                
                switch style {
                case .outline, .plain:
                    switch type {
                    case .neutral: XCTAssertEqual(self.button.backgroundColor, UIColor.Palette.Light.white2)
                    default: XCTAssertEqual(self.button.backgroundColor, self.button.titleColor(for: .normal)?.withAlphaComponent(0.1))
                    }
                case .fill:
                    switch type {
                    case .regular, .confirm, .delete: XCTAssertEqual(self.button.backgroundColor, self.button.backgroundColor(forType: type, andStyle: style).darker(by: 20.0))
                    default: XCTAssertEqual(self.button.backgroundColor, UIColor.Palette.Light.white2)
                    }
                }
            }
        }
    }
    
    func testRestoreBackground() {
        self.button.configure(style: .fill, type: .delete)
        self.button.backgroundColor = .blue
        
        XCTAssertEqual(self.button.backgroundColor, .blue)
        
        self.button.restoreBackground()
        
        XCTAssertEqual(self.button.backgroundColor, UIColor.Palette.Basic.error)
    }
    
    // MARK: - Aux
    
    //swiftlint:disable cyclomatic_complexity
    func testBackgroundColor() {
        for type in self.types {
            for style in self.styles {
                let color = button.backgroundColor(forType: type, andStyle: style)
                
                switch style {
                case .outline, .plain:
                    switch type {
                    case .neutral: XCTAssertEqual(color, UIColor.Palette.Light.white1)
                    case .disabled: XCTAssertEqual(color, UIColor.Palette.Light.white2)
                    default: XCTAssertEqual(color, UIColor.clear)
                    }
                case .fill:
                    switch type {
                    case .regular: XCTAssertEqual(color, UIColor.primaryColor(for: ThemeManager.currentTheme()))
                    case .confirm: XCTAssertEqual(color, UIColor.Palette.Basic.success)
                    case .delete: XCTAssertEqual(color, UIColor.Palette.Basic.error)
                    case .neutral: XCTAssertEqual(color, UIColor.Palette.Light.white1)
                    case .disabled: XCTAssertEqual(color, UIColor.Palette.Light.white2)
                    }
                }
            }
        }
    }
    
    func testBorderColor() {
        for type in self.types {
            for style in self.styles {
                let color = button.borderColor(forType: type, andStyle: style)
                
                switch style {
                case .fill, .outline:
                    switch type {
                    case .regular: XCTAssertEqual(color, UIColor.primaryColor(for: ThemeManager.currentTheme()).cgColor)
                    case .confirm: XCTAssertEqual(color, UIColor.Palette.Basic.success.cgColor)
                    case .delete: XCTAssertEqual(color, UIColor.Palette.Basic.error.cgColor)
                    case .neutral: XCTAssertEqual(color, UIColor.Palette.Light.white4.cgColor)
                    case .disabled: XCTAssertEqual(color, UIColor.clear.cgColor)
                    }
                case .plain:
                    if type == .neutral {
                        XCTAssertEqual(color, UIColor.Palette.Light.white4.cgColor)
                    } else {
                        XCTAssertEqual(color, UIColor.clear.cgColor)
                    }
                }
            }
        }
    }
    
    func testTextColor() {
        for type in self.types {
            for style in self.styles {
                let color = button.textColor(forType: type, andStyle: style)
                
                switch style {
                case .fill:
                    switch type {
                    case .neutral: XCTAssertEqual(color, UIColor.Palette.Dark.black4)
                    case .disabled: XCTAssertEqual(color, UIColor.Palette.Light.white4)
                    default: XCTAssertEqual(color, UIColor.Palette.Light.white1)
                    }
                case .outline, .plain:
                    switch type {
                    case .regular: XCTAssertEqual(color, UIColor.primaryColor(for: ThemeManager.currentTheme()))
                    case .confirm: XCTAssertEqual(color, UIColor.Palette.Basic.success)
                    case .delete: XCTAssertEqual(color, UIColor.Palette.Basic.error)
                    case .neutral: XCTAssertEqual(color, UIColor.Palette.Dark.black4)
                    case .disabled: XCTAssertEqual(color, UIColor.Palette.Light.white4)
                    }
                }
            }
        }
    }
}
