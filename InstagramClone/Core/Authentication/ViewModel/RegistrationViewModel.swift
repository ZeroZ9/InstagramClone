//
//  RegistrationViewModel.swift
//  InstagramClone
//
//  Created by Long Tran M2 on 29/2/24.
//

import Foundation
import Observation

class RegistrationViewModel:ObservableObject {
    @Published var username = ""
    @Published var email = ""
    @Published var password = ""
    
    func createUser() async throws {
        try await AuthService.shared.createUser(email: email, password: password, username: username)
        
        username = ""
        email = ""
        password = ""
    }
}
