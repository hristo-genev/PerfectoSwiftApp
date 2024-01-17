//
//  Utils.swift
//  PerfectoSwiftAppUITests
//
//  Created by Hristo Genev on 15.11.23.
//

import Foundation
import XCTest

class Utils {
    static func wait(_ seconds: Int) {
        Thread.sleep(forTimeInterval: 1)
    }
    
    static func getScreenshot(name: String) -> XCTAttachment {
        let fullScreenshot = XCUIScreen.main.screenshot()
        
        let screenshot = XCTAttachment(uniformTypeIdentifier: "public.png", name: "Screenshot-\(name)-\(UIDevice.current.name).png", payload: fullScreenshot.pngRepresentation, userInfo: nil)
        screenshot.lifetime = .keepAlways
        return screenshot
    }
}
