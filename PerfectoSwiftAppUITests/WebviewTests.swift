//
//  WebviewTests.swift
//  PerfectoSwiftAppUITests
//
//  Created by Hristo Genev on 18.01.24.
//

import XCTest

final class WebviewTests: XCTestCase {
    
    var app: XCUIApplication!
    var auth: AuthenticationHelper!
    
    override func setUpWithError() throws {
        continueAfterFailure = false
        app = XCUIApplication()
        app.activate()
        auth = AuthenticationHelper(app)
        auth.loginAsGuest()
        
        let springboardApp = XCUIApplication(bundleIdentifier: "com.apple.springboard")
        if springboardApp.alerts.buttons["Allow Once"].isHittable {
            springboardApp.alerts.buttons["Allow Once"].tap()
        }
    }
    
    override func tearDownWithError() throws {
        app.terminate()
    }
    
    func testWebviewOpenedInSafari() {
        app.buttons["HomeScreen.openWKWebView"].tap()
        Utils.wait(3)
        print(app.webViews.textFields.debugDescription)
        app.webViews.textFields["searchbox_input"].typeText("Perfecto")
        app.webViews.buttons[""].tap()
    }
    
}
