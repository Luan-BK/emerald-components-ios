//
//  AttachmentHelper.swift
//  EmeraldComponentsAppUITests
//
//  Created by João Mendes | Stone on 17/09/18.
//  Copyright © 2018 StoneCo. All rights reserved.
//

import Foundation
import XCTest

public struct AttachmentHelper {
    
    let app = XCUIApplication()
    
    func screenshot(_ named: String, to cell: Int) {
        
        XCTContext.runActivity(named: named) { activity in
            // Capture cell screen
            let cell = app.cells.element(boundBy: cell)
            let cellScreenshot = cell.screenshot()
            let cellScreenshotAttachment = XCTAttachment(screenshot: cellScreenshot)
            snapshot(named)
            cellScreenshotAttachment.lifetime = .keepAlways
            activity.add(cellScreenshotAttachment)
        }
        
    }
    
    func fullScreenshot(_ named: String) {
        
        XCTContext.runActivity(named: named) { activity in
            // Capture fullscreen
            snapshot(named)
            let mainScreen = XCUIScreen.main
            let fullScreenshot = mainScreen.screenshot()
            let fullScreenshotAttachment = XCTAttachment(screenshot: fullScreenshot)
            fullScreenshotAttachment.lifetime = .keepAlways
            activity.add(fullScreenshotAttachment)
        }
        
    }
    
}
