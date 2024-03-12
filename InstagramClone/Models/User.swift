//
//  User.swift
//  InstagramClone
//
//  Created by Long Tran M2 on 26/2/24.
//

import Foundation
import Firebase

struct User: Identifiable, Hashable ,Codable {
    let id: String
    var username: String
    var profileImageUrl: String?
    var fullname: String?
    var bio: String?
    let email: String
    
    var isCurrentUser: Bool {
        guard let currentUid = Auth.auth().currentUser?.uid else { return false }
        return currentUid == id
    }
}

extension User {
    static var MOCK_USERS: [User] = [
        .init(id: UUID().uuidString, username: "Batman", profileImageUrl: "doremon",fullname: "Bruce Way",  bio: "Meo U doremon",email: "doremon@gmail.com"),
        .init(id: UUID().uuidString, username: "Spidey", profileImageUrl: "doremon1",fullname: "Peta Pakar",  bio: "Meo U doremon",email: "doremon@gmail.com"),
        .init(id: UUID().uuidString, username: "IronMan", profileImageUrl: "doremon",fullname: "Tony",  bio: "Meo U doremon",email: "doremon@gmail.com")
    ]
}
