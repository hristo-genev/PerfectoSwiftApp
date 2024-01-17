//
//  Extensions.swift
//  PerfectoSwiftAppUITests
//
//  Created by Hristo Genev on 17.01.24.
//

import XCTest

extension XCUIElement {
    func hasNoText() -> Bool {
        return self.value == nil || self.value as? String == ""
    }
    
    func hasText() -> Bool {
        return self.value != nil && self.value as? String != ""
    }
}

extension String: Error {}
