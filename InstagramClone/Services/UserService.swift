//
//  UserService.swift
//  InstagramClone
//
//  Created by Long Tran M2 on 7/3/24.
//

import Foundation
import Firebase

struct UserService {
    
    @MainActor
    static func fetchAllUsers() async throws -> [User] {
        
        let snapshot = try await Firestore.firestore().collection("users").getDocuments()
        return snapshot.documents.compactMap({try? $0.data(as: User.self)})
    }
}
