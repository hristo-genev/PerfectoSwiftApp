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
        
        login("hristo.genev@gmail.com", "P@ssw0rd")
        XCTAssertTrue(app!.staticTexts["LoginScreen.errorMsg"].isHittable)
        takeScreenshot(name: "Login-Error")
    }
    
    
    func testLoginFailsWithValidEmailAndWrongPassword() throws {
        
        login("hgenev@perforce.com", "xxxxxx")
        XCTAssertTrue(app!.staticTexts["LoginScreen.errorMsg"].isHittable)
        takeScreenshot(name: "Login-Error")
    }
    
    func testLoginWorksWithValidPerfectoEmailAndPassword() throws {
        
        login("hristog@perfectomobile.com", "P@ssw0rd")
        XCTAssertTrue(app!.buttons["Log out"].isHittable)
        logout()
        XCTAssertTrue(app!.buttons["Login"].isHittable)
        XCTAssertFalse(app!.staticTexts["LoginScreen.errorMsg"].isHittable)
        
    }
    
    func testLoginWorksWithValidPerforceEmailAndPassword() throws {
        
        login("hgenev@perforce.com", "P@ssw0rd")
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
        
        app!.secureTextFields["LoginScreen.password"].tap()
        app!.secureTextFields["LoginScreen.password"].typeText("P@ssw0rd")
        app!.buttons["LoginScreen.showPasswordBtn"].tap()
        
        XCTAssertFalse(app!.staticTexts["LoginScreen.passwordTxt"].isHittable)
        takeScreenshot(name: "Password-Displayed")
    }
    
    
    func testCredentialsShouldBeClearedAfterLogout() {
        login("hgenev@perforce.com", "P@ssw0rd")
        XCTAssertTrue(app!.buttons["Log out"].isHittable)
        logout()
        XCTAssertTrue(app!.secureTextFields["LoginScreen.password"].hasNoText())
    }
    
    
    func login(_ username: String, _ password: String) {
        app!.textFields["Username"].tap()
        Utils.wait(1)
        app!.textFields["Username"].typeText(username)
//        typeTextWithKeyboard(text: username)
        app!.secureTextFields["Password"].tap()
        Utils.wait(1)
        app!.secureTextFields["Password"].typeText(password)
//        app!.buttons["LoginScreen.showPasswordBtn"].tap()
        Utils.wait(1)
        app!.buttons["LoginScreen.LoginBtn"].tap()
        Utils.wait(1)
        takeScreenshot(name: "Logged-In")
    }
    
    func logout() {
        app!.buttons["Log out"].tap()
        Utils.wait(1)
        takeScreenshot(name: "Logged-Out")
    }
    
    
    
    func takeScreenshot(name: String) {
        let fullScreenshot = XCUIScreen.main.screenshot()
        
        let screenshot = XCTAttachment(uniformTypeIdentifier: "public.png", name: "Screenshot-\(name)-\(UIDevice.current.name).png", payload: fullScreenshot.pngRepresentation, userInfo: nil)
        screenshot.lifetime = .keepAlways
        add(screenshot)
    }
    
    func typeTextWithKeyboard(_ text: String) {
        if app!.keyboards.keys.count == 0 {
            return
        }
        
        for char in text {
            typeKey(char)
        }
    }
    
    func typeKey(_ key: Character) {
        app!.keys[String(key)].tap()
    }
}
