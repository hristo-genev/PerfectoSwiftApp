//
//  UserStateError.swift
//  PerfectoSwiftApp
//
//  Created by Hristo Genev on 18.10.23.
//

import Foundation

enum AuthError: Error {
    case signInError, signOutError, emptyCredentials, invalidCredentials, sensorAuthenticationFailed
}
