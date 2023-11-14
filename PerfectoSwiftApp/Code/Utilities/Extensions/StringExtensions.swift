//
//  StringExtensions.swift
//  PerfectoSwiftApp
//
//  Created by Hristo Genev on 14.10.23.
//

import Foundation

extension String {
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
    func localized(arguments: CVarArg...) -> String {
        return String(format: self.localized, arguments: arguments)
    }
}
