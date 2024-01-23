//
//  LocationTests.swift
//  PerfectoSwiftAppUITests
//
//  Created by Hristo Genev on 16.01.24.
//


import XCTest

final class LocationTests: XCTestCase {
    
    var app: XCUIApplication!
    var auth: AuthenticationHelper!
    var interruptionMonitor: NSObjectProtocol!
    
    override func setUpWithError() throws {
        
        continueAfterFailure = false

        // Reset app Location permissions
        let settings = XCUIApplication(bundleIdentifier: "com.apple.Preferences")
        settings.terminate()
        settings.activate()
        settings.swipeUp(velocity: XCUIGestureVelocity.fast)
        print(settings.debugDescription)
        settings.staticTexts["PerfectoSwiftApp"].tap()
        settings.staticTexts["Location"].tap()
        settings.staticTexts["Ask Next Time Or When I Share"].tap()
        
        app = XCUIApplication()
        app.launch()
        auth = AuthenticationHelper(app)
        auth.loginAsGuest()
        Utils.wait(3)
    }
    
    override func tearDownWithError() throws {
        app.terminate()
        if interruptionMonitor != nil {
            self.removeUIInterruptionMonitor(interruptionMonitor)
        }
    }
    
    
    func testAllowLocationPermissionsPopupShowsMap() throws {
        
        let alertText = "Allow \"PerfectoSwiftApp\" to use your location?"
        interruptionMonitor = addUIInterruptionMonitor( withDescription: alertText) { (alert) -> Bool in
            print("HristoG test addUIInterruptionMonitor triggered")
            if alert.buttons["Allow Once"].exists {
                alert.buttons["Allow Once"].tap()
                return true
            }
            return false
        }
        app.buttons["HomeScreen.openLocation"].tap()
        Utils.wait(3)
        add(Utils.getScreenshot(name: "Map-Displayed"))
        print(XCUIApplication().debugDescription)
        XCTAssertTrue(app.otherElements["MapScreen.userLocationMap"].exists)
        
    }
    
    func testDenyLocationPermissionsPopupShowsError() throws {
    
        let alertText = "Allow \"PerfectoSwiftApp\" to use your location?"
        interruptionMonitor = addUIInterruptionMonitor( withDescription: alertText) { (alert) -> Bool in
            print("HristoG test addUIInterruptionMonitor triggered")
            if alert.buttons["Don't Allow"].exists {
                alert.buttons["Don't Allow"].tap()
                return true
            }
            return false
        }
        app.buttons["HomeScreen.openLocation"].tap()
        Utils.wait(3)
        add(Utils.getScreenshot(name: "Map-Displayed"))
        print(XCUIApplication().debugDescription)
        XCTAssertTrue(app.staticTexts["MapScreen.locationErrorMsg"].exists)
        
    }
}
