//
//  PerfectoSwiftAppUITests.swift
//  PerfectoSwiftAppUITests
//
//  Created by Hristo Genev on 13.10.23.
//

import XCTest

final class LoginTests: XCTestCase {
    
    var app: XCUIApplication!
    var auth: AuthenticationHelper!
    
    override func setUpWithError() throws {
        app = XCUIApplication()
        app.launch()
        auth = AuthenticationHelper(app)
        
        continueAfterFailure = false
    }
    
    override func tearDownWithError() throws {
        app.terminate()
    }
    
    func testLoginFailsWithEmptyCredentials() throws {
        
        app.buttons["Login"].tap()
        XCTAssertTrue(app.staticTexts["LoginScreen.errorMsg"].isHittable)
        add(Utils.getScreenshot(name: "Login-error"))
    }
    
    func testLoginFailsWithInvalidEmail() throws {
        
        auth.login("hristo.genev@gmail.com", "P@ssw0rd")
        XCTAssertTrue(app.staticTexts["LoginScreen.errorMsg"].isHittable)
        add(Utils.getScreenshot(name: "Login-error"))
    }
    
    
    func testLoginFailsWithValidEmailAndWrongPassword() throws {
        
        auth.login("hgenev@perforce.com", "xxxxxx")
        XCTAssertTrue(app.staticTexts["LoginScreen.errorMsg"].isHittable)
        add(Utils.getScreenshot(name: "Login-error"))
    }
    
    func testLoginWorksWithValidPerfectoEmailAndPassword() throws {
        
        auth.login("hristog@perfectomobile.com", "P@ssw0rd")
        XCTAssertTrue(app.buttons["Log out"].isHittable)
        auth.logout()
        XCTAssertTrue(app.buttons["Login"].isHittable)
        XCTAssertFalse(app.staticTexts["LoginScreen.errorMsg"].isHittable)
        
    }
    
    func testLoginWorksWithValidPerforceEmailAndPassword() throws {
        
        auth.login("hgenev@perforce.com", "P@ssw0rd")
        XCTAssertTrue(app.buttons["Log out"].isHittable)
        auth.logout()
        XCTAssertFalse(app.staticTexts["LoginScreen.errorMsg"].isHittable)
    }
    
    
    func testLoginAsGuest() throws {
        
        app.buttons["LoginScreen.loginAsGuest"].tap()
        add(Utils.getScreenshot(name: "Logged-In"))
        XCTAssertTrue(app.buttons["Log out"].isHittable)
        auth.logout()
        XCTAssertTrue(app.buttons["Login"].isHittable)
    }
    
    func testTogglePasswordVisibilityShowsPassword() throws {
        
        app.secureTextFields["LoginScreen.password"].tap()
        app.secureTextFields["LoginScreen.password"].typeText("P@ssw0rd")
        app.buttons["LoginScreen.showPasswordBtn"].tap()
        
        XCTAssertFalse(app.staticTexts["LoginScreen.passwordTxt"].isHittable)
        add(Utils.getScreenshot(name: "Password-Displayed"))
    }
    
    
    func testCredentialsShouldBeClearedAfterLogout() {
        auth.login("hgenev@perforce.com", "P@ssw0rd")
        XCTAssertTrue(app.buttons["Log out"].isHittable)
        auth.logout()
        XCTAssertTrue(app.secureTextFields["LoginScreen.password"].hasNoText())
    }
}
