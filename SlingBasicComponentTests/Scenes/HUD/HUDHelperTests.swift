//
//  HUDHelperTests.swift
//  SlingBasicComponentTests
//
//  Created by João Mendes | Stone on 16/04/18.
//  Copyright © 2018 StoneCo. All rights reserved.
//

import XCTest
@testable import SlingBasicComponent

class HUDHelperTests: XCTestCase {
    
    private var hudHelper: HUDHelper?
    private var activityIndicatorView: UIActivityIndicatorView?
    private var containerView: UIView?
    
    private var blurEffect: UIBlurEffect?
    private var blurView: UIVisualEffectView?
    
    override func setUp() {
        super.setUp()
        activityIndicatorView = UIActivityIndicatorView()
        containerView = UIView()
        hudHelper = HUDHelper()
        blurEffect = UIBlurEffect(style: .light)
        blurView = UIVisualEffectView(effect: blurEffect)
    }
    
    override func tearDown() {
        activityIndicatorView = nil
        containerView = nil
        hudHelper = nil
        blurEffect = nil
        blurView = nil
        super.tearDown()
    }
    
    // Container Background View Method
    
    func testContainerBackgroundView_frame() {
        // given
        let view = UIView()
        let frame = view.frame
        
        // when
        guard let container = containerView else { return XCTFail("error to instantiate view") }
        container.frame = frame
        
        // then
        XCTAssertEqual(container.frame, hudHelper?.containerBackgroundView(view).frame)
    }
    
    func testContainerBackgroundView_align() {
        // given
        let view = UIView()
        let center = view.center
        
        // when
        guard let container = containerView else { return XCTFail("error to instantiate view") }
        container.center = center
        
        // then
        XCTAssertEqual(container.center, hudHelper?.containerBackgroundView(view).center)
    }
    
    func testContainerBackgroundView_background() {
        // given
        let view = UIView()
        let backgroundColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 0.4)
        
        // when
        guard let container = containerView else { return XCTFail("error to instantiate view") }
        container.backgroundColor = backgroundColor
        
        // then
        XCTAssertEqual(container.backgroundColor, hudHelper?.containerBackgroundView(view).backgroundColor)
    }
    
    func testContainerBackgroundView_failToInstantiateView() {
        // given
        let view: UIView? = nil
        let backgroundColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 0.4)
        
        // when
        guard let container = containerView else { return XCTFail("error to instantiate view") }
        container.backgroundColor = backgroundColor
        
        // then
        XCTAssertNil(hudHelper?.containerBackgroundView(view).backgroundColor)
    }
    
    // Blur Effect View Method
    
    func testBlurEffectView_frame() {
        // given
        let view = UIView()
        let frame = CGRect(x: 0.0, y: 0.0, width: 156.0, height: 156.0)
        
        // when
        guard let blur = blurView else { return XCTFail("error to instantiate view") }
        blur.frame = frame
        
        // then
        XCTAssertEqual(blur.frame, hudHelper?.blurEffectView(view).frame)
    }
    
    func testBlurEffectView_clipsToBounds() {
        // given
        let view = UIView()
        let clipsToBounds = true
        
        // when
        guard let blur = blurView else { return XCTFail("error to instantiate view") }
        blur.clipsToBounds = clipsToBounds
        
        // then
        XCTAssertEqual(blur.clipsToBounds, hudHelper?.blurEffectView(view).clipsToBounds)
    }
    
    func testBlurEffectView_cornerRadius() {
        // given
        let view = UIView()
        let cornerRadius = CGFloat(10)
        
        // when
        guard let blur = blurView else { return XCTFail("error to instantiate view") }
        blur.layer.cornerRadius = cornerRadius
        
        // then
        XCTAssertEqual(blur.layer.cornerRadius, hudHelper?.blurEffectView(view).layer.cornerRadius)
    }
    
    // Activity Animating Method
    
    func testActivityAnimating_frame() {
        // given
        let view = UIView()
        let frame = CGRect(x: -30.0, y: -30.0, width: 60.0, height: 60.0)
        
        // when
        guard let animating = activityIndicatorView else { return XCTFail("error to instantiate view") }
        animating.frame = frame
        
        // then
        XCTAssertEqual(animating.frame, hudHelper?.activityAnimating(view).frame)
    }
    
    func testActivityAnimating_activityIndicatorViewStyle() {
        // given
        let view = UIView()
        let style = UIActivityIndicatorViewStyle.whiteLarge
        
        // when
        guard let animating = activityIndicatorView else { return XCTFail("error to instantiate view") }
        animating.activityIndicatorViewStyle = style
        
        // then
        XCTAssertEqual(animating.activityIndicatorViewStyle, hudHelper?.activityAnimating(view).activityIndicatorViewStyle)
    }
    
    func testActivityAnimating_color() {
        // given
        let view = UIView()
        let color = UIColor.black
        
        // when
        guard let animating = activityIndicatorView else { return XCTFail("error to instantiate view") }
        animating.color = color
        
        // then
        XCTAssertEqual(animating.color, hudHelper?.activityAnimating(view).color)
    }
    
    func testActivityAnimating_transform() {
        // given
        let view = UIView()
        let transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
        
        // when
        guard let animating = activityIndicatorView else { return XCTFail("error to instantiate view") }
        animating.transform = transform
        
        // then
        XCTAssertEqual(animating.transform, hudHelper?.activityAnimating(view).transform)
    }
    
    func testActivityAnimating_align() {
        // given
        let view = UIView()
        let center = CGPoint(x: view.frame.size.width / 2, y: view.frame.size.height / 2)
        
        // when
        guard let animating = activityIndicatorView else { return XCTFail("error to instantiate view") }
        animating.center = center
        
        // then
        XCTAssertEqual(animating.center, hudHelper?.activityAnimating(view).center)
    }
    
}
