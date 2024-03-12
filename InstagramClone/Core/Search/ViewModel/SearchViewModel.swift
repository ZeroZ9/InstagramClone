//
//  SearchViewModel.swift
//  InstagramClone
//
//  Created by Long Tran M2 on 7/3/24.
//

import Foundation
import Observation

@Observable
class SearchViewModel {
    var users = [User]()
    
    init() {
        Task { try await fetchAllUsers() }
    }
    
    func fetchAllUsers() async throws {
        self.users = try await UserService.fetchAllUsers()
    }
}
