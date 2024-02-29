//
//  LogInViewModel.swift
//  InstagramClone
//
//  Created by Long Tran M2 on 29/2/24.
//

import Foundation
import Observation

@Observable
class LogInViewModel {
    var email = ""
    var password = ""
    
    func signIn() async throws {
        try await AuthService.shared.login(withEmail: email, password: password)
    }
}
