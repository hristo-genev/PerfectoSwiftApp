//
//  LoginViewModel.swift
//  PerfectoSwiftApp
//
//  Created by Hristo Genev on 14.10.23.
//

import Foundation
import LocalAuthentication
import os

class LoginViewModel: ObservableObject {

    @Published var username: String = ""
    @Published var password: String = ""
    @Published var isLoggedIn = false
    @Published var isBusy = false
   
    func login(completion: @escaping (Result<Bool, AuthError>) -> Void) async {
        
        if username.isEmpty || password.isEmpty {
            print("Can't login with empty credentials")
            return completion(.failure(.emptyCredentials))
        }
        
        if username == "g" && password == "g" {
            print("Logged in with simplified credentials")
            isLoggedIn = true
            return completion(.success(true))
        }
        
        if (!username.hasSuffix("@perfectomobile.com") && !username.hasSuffix("@perforce.com")) || password != "P@ssw0rd" {
            print("Can't login with \(username) and \(password)")
            return completion(.failure(.invalidCredentials))
        }
        
        isBusy = true
        
        do {
            print("Sending HTTPS request")
            let (_, response) = try await URLSession.shared.data(from: URL(string: "https://github.io/")!)

            if let httpResponse = response as? HTTPURLResponse {
                print("Response code: \(httpResponse.statusCode)")
                if httpResponse.statusCode < 200 && httpResponse.statusCode > 400 {
                    print("Request failed! Failing login with \(username) and \(password)")
                    return completion(.failure(AuthError.signInError))
                }
            }

            // try await Task.sleep(nanoseconds: 2_000_000_000)

            isLoggedIn = true
            isBusy = false
            print("Logged in with valid credentials: \(username) \(password)")
            return completion(.success(true))

        } catch {
            isBusy = false
            print("Caught error: \(error)")
            return completion(.failure(.signInError))
       }
    }
    
    func sensorAuthenticate(completion: @escaping (Result<Bool, AuthError>) -> Void) {
        
        let context = LAContext()
        var error: NSError?

        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            let reason = "We need to unlock your data."

            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, authenticationError in
                
                if success {
                    print("Login with biometrics succeeded")
                } else {
                    print("Login with biometrics failed")
                }
            }
            
            isLoggedIn = true
            return completion(.success(true))
        } else {
            print("Biometric authentication unavailable!")
            return completion(.failure(.sensorAuthenticationFailed))
        }
    }
    
    func signout(completion: @escaping (Result<Bool, AuthError>) -> Void) async {
//    func signOut() async -> Result<Bool, AuthError> {
        // try await Task.sleep(nanoseconds: 2_000_000_000)
        isLoggedIn = false
        isBusy = false
        return completion(.success(true))
    }
    
    func clearForm() {
        username = ""
        password = ""
    }
}
