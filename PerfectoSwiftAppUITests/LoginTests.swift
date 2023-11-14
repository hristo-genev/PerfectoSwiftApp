//
//  PerfectoSwiftAppUITests.swift
//  PerfectoSwiftAppUITests
//
//  Created by Hristo Genev on 13.10.23.
//

import XCTest

final class LoginTests: XCTestCase {
    
    var app: XCUIApplication?
    
    override func setUpWithError() throws {
        app = XCUIApplication()
        app!.launch()
        continueAfterFailure = false
    }
    
    override func tearDownWithError() throws {
        app!.terminate()
    }
    
    func testLoginFailsWithEmptyCredentials() throws {
        
        app!.buttons["Login"].tap()
        XCTAssertTrue(app!.staticTexts["LoginScreen.errorMsg"].isHittable)
        takeScreenshot(name: "Login-Error")
    }
    
    func testLoginFailsWithInvalidEmail() throws {
        
        login(username: "hristo.genev@gmail.com", password: "P@ssw0rd")
        XCTAssertTrue(app!.staticTexts["LoginScreen.errorMsg"].isHittable)
        takeScreenshot(name: "Login-Error")
    }
    
    
    func testLoginFailsWithValidEmailAndWrongPassword() throws {
        
        login(username: "hgenev@perforce.com", password: "xxxxxx")
        XCTAssertTrue(app!.staticTexts["LoginScreen.errorMsg"].isHittable)
        takeScreenshot(name: "Login-Error")
    }
    
    func testLoginWorksWithValidPerfectoEmailAndPassword() throws {
        
        login(username: "hristog@perfectomobile.com", password: "P@ssw0rd")
        XCTAssertTrue(app!.buttons["Log out"].isHittable)
        logout()
        XCTAssertTrue(app!.buttons["Login"].isHittable)
        XCTAssertFalse(app!.staticTexts["LoginScreen.errorMsg"].isHittable)
        
    }
    
    func testLoginWorksWithValidPerforceEmailAndPassword() throws {
        
        login(username: "hgenev@perforce.com", password: "P@ssw0rd")
        XCTAssertTrue(app!.buttons["Log out"].isHittable)
        logout()
        XCTAssertFalse(app!.staticTexts["LoginScreen.errorMsg"].isHittable)
    }
    
    
    func testLoginAsGuest() throws {
        
        app!.buttons["LoginScreen.loginAsGuest"].tap()
        takeScreenshot(name: "Logged-In")
        XCTAssertTrue(app!.buttons["Log out"].isHittable)
        logout()
        XCTAssertTrue(app!.buttons["Login"].isHittable)
    }
    
    func testTogglePasswordVisibilityShowsPassword() throws {
        
        app!.secureTextFields["Password"].tap()
        app!.secureTextFields["Password"].typeText("P@ssw0rd")
        app!.buttons["LoginScreen.showPasswordBtn"].tap()
        
        XCTAssertFalse(app!.staticTexts["LoginScreen.passwordTxt"].isHittable)
        takeScreenshot(name: "Password-Displayed")
    }
    
    
    //
    //    func testLaunchPerformance() throws {
    //        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
    //            // This measures how long it takes to launch your application.
    //            measure(metrics: [XCTApplicationLaunchMetric()]) {
    //                XCUIApplication().launch()
    //            }
    //        }
    //    }
    
    
    func login(username: String, password: String) {
        app!.textFields["Username"].tap()
        app!.textFields["Username"].typeText(username)
        app!.secureTextFields["Password"].tap()
        app!.secureTextFields["Password"].typeText(password)
        app!.buttons["Login"].tap()
        takeScreenshot(name: "Logged-In")
    }
    
    func logout() {
        app!.buttons["Log out"].tap()
        takeScreenshot(name: "Logged-Out")
    }
    
    func takeScreenshot(name: String) {
        let fullScreenshot = XCUIScreen.main.screenshot()
        
        let screenshot = XCTAttachment(uniformTypeIdentifier: "public.png", name: "Screenshot-\(name)-\(UIDevice.current.name).png", payload: fullScreenshot.pngRepresentation, userInfo: nil)
        screenshot.lifetime = .keepAlways
        add(screenshot)
    }
}
