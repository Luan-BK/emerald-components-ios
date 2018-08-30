//
//  UINavigationControllerTests.swift
//  SlingBasicComponentTests
//
//  Created by Luan Kalume | Stone on 15/08/2018.
//  Copyright © 2018 StoneCo. All rights reserved.
//

import XCTest
@testable import SlingBasicComponent

class UINavigationControllerTests: XCTestCase {
    
    func testViewControllerPop() {
        let firstViewController = UIViewController()
        let secondViewController = UIViewController()
        let thirdViewController = UIViewController()
        
        let navigationController = UINavigationController(rootViewController: firstViewController)
        navigationController.pushViewController(secondViewController, animated: false)
        navigationController.pushViewController(thirdViewController, animated: false)
        
        XCTAssertEqual(navigationController.viewControllers.count, 3)
        
        navigationController.popViewControllers(1)
        
        XCTAssertEqual(navigationController.viewControllers.count, 2)
        XCTAssertEqual(navigationController.viewControllers[1], secondViewController)
    }
    
    func testViewControllerPop_AboveLimit() {
        let firstViewController = UIViewController()
        let secondViewController = UIViewController()
        let thirdViewController = UIViewController()
        
        let navigationController = UINavigationController(rootViewController: firstViewController)
        navigationController.pushViewController(secondViewController, animated: false)
        navigationController.pushViewController(thirdViewController, animated: false)
        
        XCTAssertEqual(navigationController.viewControllers.count, 3)
        
        navigationController.popViewControllers(10)
        
        XCTAssertEqual(navigationController.viewControllers.count, 3)
        XCTAssertEqual(navigationController.viewControllers[2], thirdViewController)
    }
    
}
