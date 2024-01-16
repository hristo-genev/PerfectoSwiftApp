//
//  CustomerTests.swift
//  PerfectoSwiftAppUITests
//
//  Created by Hristo Genev on 15.01.24.
//

import XCTest

final class CustomerTests: XCTestCase {
    
    var interruptionMonitor: NSObjectProtocol!
    
    override func setUp() {
            super.setUp()
        }
    
    override func tearDown() {
            super.tearDown()
            self.removeUIInterruptionMonitor(interruptionMonitor)
        }

    
    
    func testHandlePermissionsPopup() throws {
        let app = XCUIApplication(bundleIdentifier: "com.singaporeair.uat")
        app.launch()
        print ("HristoG app launched!")
        app.swipeUp()
//        var interruptionMonitor: NSObjectProtocol!
        let alertText = "Allow \"SingaporeAir (UAT)\" to track your activity across other companies' apps and websites?"
        interruptionMonitor = addUIInterruptionMonitor( withDescription: alertText) { (alert) -> Bool in
            print("HristoG test addUIInterruptionMonitor triggered")
            if alert.buttons["Allow"].exists {
                alert.buttons["Allow"].tap()
                return true
            }

            return false
        }
//        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(3), execute: {
//            app.buttons["Allow"].click()
//        })

//        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(5), execute: {            
//            app.buttons["Allow"].click()
//        })
            
        removeUIInterruptionMonitor(interruptionMonitor)
    }
    
}
