//
//  LoginTestUtils.swift
//  PerfectoSwiftAppUITests
//
//  Created by Hristo Genev on 16.01.24.
//

import XCTest

class AuthenticationHelper {
    
    let app: XCUIApplication!
    
    init (_ app: XCUIApplication) {
        self.app = app
    }
    
    public func loginAsGuest() {
        app.buttons["LoginScreen.loginAsGuest"].tap()
    }
    
    public func login() {
        login("g", "g")
    }
    
    public func login(_ username: String, _ password: String) {
        app.textFields["Username"].tap()
        Utils.wait(1)
        app.textFields["Username"].typeText(username)
        //        typeTextWithKeyboard(text: username)
        app.secureTextFields["Password"].tap()
        Utils.wait(1)
        app.secureTextFields["Password"].typeText(password)
        //        app.buttons["LoginScreen.showPasswordBtn"].tap()
        app.buttons["Return"].tap()
        Utils.wait(1)
        app.buttons["LoginScreen.loginBtn"].tap()
        Utils.wait(1)
//        takeScreenshot(name: "Logged-In")
    }
    
    public func logout() {
        app.buttons["Log out"].tap()
        Utils.wait(1)
//        takeScreenshot(name: "Logged-Out")
    }
    
    func typeTextWithKeyboard(_ app: XCUIApplication, _ text: String) {
        if app.keyboards.keys.count == 0 {
            return
        }
        
        for char in text {
            typeKey(app, char)
        }
    }
    
    func typeKey(_ app: XCUIApplication, _ key: Character) {
        app.keys[String(key)].tap()
    }
}
