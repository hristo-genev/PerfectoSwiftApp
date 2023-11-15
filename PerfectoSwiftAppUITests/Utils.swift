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
}

extension XCUIElement {
    func hasNoText() -> Bool {
        return self.value == nil || self.value as? String == ""
    }
    
    func hasText() -> Bool {
        return self.value != nil && self.value as? String != ""
    }
}
